module Language.Drasil.JSON.Print(genJSON) where

import Text.PrettyPrint hiding (Str)
import Control.Monad

import qualified Language.Drasil as L (Document)

import qualified Language.Drasil.Output.Formats as F (Filename)

import Language.Drasil.Printing.Import (makeDocument)
import Language.Drasil.Printing.LayoutObj (Document(Document))
import Language.Drasil.Printing.PrintingInformation (PrintingInformation)

import Language.Drasil.JSON.Helpers (conHTMLformat, makeMetadata)

genJSON :: PrintingInformation -> F.Filename -> L.Document -> Doc
genJSON sm fn doc = build fn (makeDocument sm doc)

-- | Build the JSON Document, called by genJSON
build :: String -> Document -> Doc
build fn (Document t a c) = 
  text "{" $$
  text " \"cells\": [" $$
  text "  {" $$
  text "   \"cell_type\": \"markdown\"," $$
  text "   \"metadata\": {}," $$
  text "   \"source\": [" $$
  text ("    \"" ++      
  jf (join(conHTMLformat fn (Document t a c))) ++ "\"") $$
  text "   ]" $$
  text "  }" $$
  text " ]," $$
  makeMetadata $$
  text "}"

-- JSON formatter
jf :: String -> String
jf ('"':xs) = '\\' : '"' : jf xs
jf ('\\':xs) = '\\' : '\\' : jf xs
jf (x:xs) = x: jf xs
jf [] = []