module Language.Drasil.JSON.Helpers where

import Text.PrettyPrint (Doc, text, vcat)
import Data.List.Split

import Language.Drasil.HTML.Print (conHTMLtoStr)

import Language.Drasil.Printing.LayoutObj (Document(Document))

conHTMLformat :: String -> Document -> [String]
conHTMLformat fn (Document t a c) = 
  let splitLine = splitOn "\n" (conHTMLtoStr fn (Document t a c))
      delLeadspace = dropWhile (\c -> c == ' ')
  in map delLeadspace splitLine

makeMetadata :: Doc  
makeMetadata = vcat [
  text " \"metadata\": {", 
  vcat[
    text "  \"kernelspec\": {", 
    text "   \"display_name\": \"Python 3\",", 
    text "   \"language\": \"python\",",
    text "   \"name\": \"python3\"", 
    text "  },"],
  vcat[
    text "  \"language_info\": {", 
    text "   \"codemirror_mode\": {", 
    text "    \"name\": \"ipython\",",
    text "    \"version\": 3",
    text "   },"],
  text "   \"file_extension\": \".py\",", 
  text "   \"mimetype\": \"text/x-python\",",
  text "   \"name\": \"python\",",
  text "   \"nbconvert_exporter\": \"python\",",
  text "   \"pygments_lexer\": \"ipython3\",",
  text "   \"version\": \"3.8.1\"",
  text "  }",
  text " },",
  text " \"nbformat\": 4,", 
  text " \"nbformat_minor\": 4" 
  ]