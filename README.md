[![](https://gitlab.com/SCP-079/scp-079.gitlab.io/badges/master/pipeline.svg)](https://gitlab.com/SCP-079/scp-079.gitlab.io/)

---

SCP-079 [Hakyll] website using GitLab Pages.

---

## Site

This project's static Pages are built by [GitLab CI][ci], following 
the steps defined in [`.gitlab-ci.yml`](.gitlab-ci.yml).

## Theme

We call this Hakyll theme `screen`. 

This is a theme intended to use to [SCP-079](https://scp-079.org) website 
and converted from a Jekyll theme [darcli](https://github.com/gildasio/darcli) 
to Hakyll. We made some changes to make it more suitable for our homepage.

There is a post [demo](https://scp-079.org/posts/2019-03-29-post-test.html).

## Building locally

To work locally with this project, you'll have to follow the steps below:

1. Fork, clone or download this project
2. Use cabal or stack:
    - cabal:
        1. Build: `cabal new-update && cabal new-build`
        2. Generate the website: `cabal new-exec site build`
        3. Preview your project: `cabal new-exec site watch`
    - stack:
        1. Build: `stack install`
        2. Generate the website: `stack exec site build`
        3. Preview your project: `stack exec site watch`
3. Edit content

Read more at Hakyll's [documentation][hakyll].

## GitLab User or Group Pages

To use this project as your user/group website, you will need additional
steps to modify the source code.

## Be Better

Welcome to contribute to this project.

## Getting help

* [Tutorials](https://jaspervdj.be/hakyll/tutorials.html)
* [Google discussion group](https://groups.google.com/forum/#!forum/hakyll)
* [Hakyll on StackOverflow](https://stackoverflow.com/questions/tagged/hakyll)

---

## License

This theme is under [GPLv3](LICENSE).

Based on [darcli](https://github.com/gildasio/darcli).

[ci]: https://about.gitlab.com/gitlab-ci/
[hakyll]: https://jaspervdj.be/hakyll/
[install]: https://jaspervdj.be/hakyll/tutorials/01-installation.html
