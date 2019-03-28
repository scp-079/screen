[![](https://gitlab.com/SCP-079/scp-079.gitlab.io/badges/master/pipeline.svg)](https://gitlab.com/SCP-079/scp-079.gitlab.io/)

---

SCP-079 [Hakyll] website using GitLab Pages.

---

## Site

This project's static Pages are built by [GitLab CI][ci], following 
the stepsdefined in [`.gitlab-ci.yml`](.gitlab-ci.yml).

## Theme

We call this Hakyll theme `screen`. 

This is a theme intended to use to [SCP-079](https://scp-079.org) website 
and converted from a Jekyll theme [darcli](https://github.com/gildasio/darcli) 
to Hakyll. We made some changes to make it more suitable for our homepage.

## Building locally

To work locally with this project, you'll have to follow the steps below:

1. Fork, clone or download this project
2. [Install][] Hakyll.
3. Generate the website: `stack exec site build`
4. Preview your project: `stack exec site watch`
5. Edit content

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
