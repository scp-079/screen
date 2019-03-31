{-# LANGUAGE OverloadedStrings #-}

import           Data.Monoid (mappend)
import           Data.List (isSuffixOf)
import           Hakyll
import           System.FilePath (takeDirectory, takeBaseName, (</>),
                                  joinPath, splitPath)

-- Config
config :: Configuration
config = defaultConfiguration {
    destinationDirectory = "public"
}

feedConfig :: FeedConfiguration
feedConfig = FeedConfiguration
    { feedTitle       = "SCP-079"
    , feedDescription = "Anti-spam project for Telegram groups"
    , feedAuthorName  = "SCP-079"
    , feedAuthorEmail = "admin@scp-079.org"
    , feedRoot        = "https://scp-079.org"
    }

------------------------------------------------------------------------

main :: IO ()
main = hakyllWith config $ do

    -- Static directories
    let staticFiles :: Pattern
        staticFiles = fromGlob "static/fonts/**" .||. 
                      fromGlob "static/images/**" .||. 
                      fromGlob "static/js/**" .||. 
                      fromGlob "static/audio/**"
    
    match staticFiles $ do
        route $ customRoute $ joinPath . drop 1 . splitPath . toFilePath
        compile copyFileCompiler

    -- CSS needs to be minified
    match "static/css/*" $ do
        route $ customRoute $ joinPath . drop 1 . splitPath . toFilePath
        compile compressCssCompiler

    -- Compile the templates
    match "templates/*" $ compile templateBodyCompiler
    
    -- Compile the index page
    create ["index.html"] $ do
        route idRoute
        compile $ do
            let indexCtx = constField "title" "SCP-079" `mappend`
                           defaultContext
            
            makeItem ""
                >>= loadAndApplyTemplate "templates/index.html" indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls
    
    -- Compile the archives page
    create ["archives/index.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archives.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls
                >>= cleanIndexUrls
    
    -- Compile pages
    match "pages/**" $ do
        route   $ cleanPageRoute
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls
            >>= cleanIndexUrls

    -- Compile posts
    match "posts/*" $ do
        route   $ cleanRoute
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= saveSnapshot "content"
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls
            >>= cleanIndexHtmls

    -- Compile keys page
    match "keys/*" $ do
        route   $ cleanRoute
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls
            >>= cleanIndexUrls

    -- Render Atom / Rss feeds
    create ["atom.xml"] $ do
        route idRoute
        compile $ do
            let feedCtx = postCtx `mappend`
                          bodyField "description"

            posts <- fmap (take 10) . recentFirst
                =<< loadAllSnapshots "posts/*" "content"
            renderAtom feedConfig feedCtx posts
    
    create ["rss.xml"] $ do
        route idRoute
        compile $ do
            let feedCtx = postCtx `mappend`
                          bodyField "description"

            posts <- fmap (take 10) . recentFirst
                =<< loadAllSnapshots "posts/*" "content"
            renderRss feedConfig feedCtx posts

------------------------------------------------------------------------

-- Default context for posts
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

-- Functions to convert pages to /name/index.html
cleanRoute :: Routes
cleanRoute = customRoute createIndexRoute
  where
    createIndexRoute ident =
        takeDirectory p </> takeBaseName p </> "index.html"
          where p = toFilePath ident

cleanPageRoute :: Routes
cleanPageRoute = customRoute createIndexRoute
  where
    createIndexRoute ident =
        takeBaseName p </> "index.html"
          where p = toFilePath ident

cleanIndexUrls :: Item String -> Compiler (Item String)
cleanIndexUrls = return . fmap (withUrls cleanIndex)

cleanIndexHtmls :: Item String -> Compiler (Item String)
cleanIndexHtmls = return . fmap (replaceAll pattern replacement)
  where
    pattern = "/index.html"
    replacement = const "/"

cleanIndex :: String -> String
cleanIndex url
    | idx `isSuffixOf` url = take (length url - length idx) url
    | otherwise            = url
  where idx = "index.html"
