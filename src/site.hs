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

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith config $ do
  match "images/*" $ do
    route idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "index.md" $ do
    route $ setExtension "html"
    compile $ do
      let indexCtx = constField "title" "Home" <> defaultContext
      pandocCompiler
        -- >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

  match "templates/*" $ compile templateCompiler
