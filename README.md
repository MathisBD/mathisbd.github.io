# Framework 

I use [Hakyll](https://jaspervdj.be/hakyll/) to build this website. The contents (pages and blog posts) are written in markdown, styling is done using HTML and CSS and the plumbing is done in Haskell.

Source files are in src/ and the latest build is in docs/.

# Development workflow

Development happens in the `dev` branch, and `master` contains the latest deployed version of the website. 

To build the website in `dev` use `make`, and to build + deploy to `master` use `make deploy`.
