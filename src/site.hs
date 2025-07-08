--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}

import Hakyll

-- Global configuration options.
config :: Configuration
config =
  defaultConfiguration
    { destinationDirectory = "docs",
      providerDirectory = "src"
    }

main :: IO ()
main = hakyllWith config $ do
  match "images/*" $ do
    route idRoute
    compile copyFileCompiler
  
  match "pdfs/*" $ do
    route idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "*.md" basicPage

  match "templates/*" $ compile templateCompiler

-- Rules to compile a basic page written in markdown,
-- using the default template.
basicPage :: Rules ()
basicPage = do
  route $ setExtension "html"
  compile $ do
    pandocCompiler
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls
