module Main (main) where

import Language.Drasil.Generate (gen)
import Language.Drasil.Printers (DocSpec(DocSpec), DocType(SRS, Website))

import Drasil.Truss.Body (srs, printSetting)
import Drasil.Truss.Concepts

main :: IO()
main = do
  gen (DocSpec SRS     "Truss_SRS") srs printSetting
  gen (DocSpec Website "Truss_SRS") srs printSetting
