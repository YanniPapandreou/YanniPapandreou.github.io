<!--
Add here global page variables to use throughout your
website.
The website_* must be defined for the RSS to work
-->
@def website_title = "Yanni Papandreou"
@def website_descr = "Personal portfolio and blog site by YanniPapandreou"
@def website_url   = "https://yannipapandreou.github.io"

@def author = "Yanni Papandreou"
@def author_short = "YP"

@def social_github   = "https://github.com/yannipapandreou/"
@def social_linkedin = "https://www.linkedin.com/in/yanni-papandreou/"
<!-- @def rss_link        = "https://myhugosite.com/index.xml" -->
@def social_email = "john.papandreou18@imperial.ac.uk"
@def social_cv = "CV_Yanni_Papandreou.pdf"

@def mintoclevel = 2

+++
nav_items = [
  "Home" => "/",
  "Experience" => "/experience",
  "Blog" => "/blog",
  "Publications" => "/publications"
]
+++

<!-- Stuff related to the site styling -->
@def div_content = "container"

<!--
Add here files or directories that should be ignored by Franklin, otherwise
these files might be copied and, if markdown, processed by Franklin which
you might not want. Indicate directories by ending the name with a `/`.
-->
@def ignore = ["node_modules/", "franklin", "franklin.pub"]

<!--
Add here global latex commands to use throughout your
pages. It can be math commands but does not need to be.
For instance:
* \newcommand{\phrase}{This is a long phrase to copy.}
-->
\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}
