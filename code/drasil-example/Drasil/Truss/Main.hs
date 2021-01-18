module Main (main) where

import Language.Drasil.Code (Choices(..), CodeSpec, codeSpec, Comments(..), 
  Verbosity(..), ConstraintBehaviour(..), ImplementationType(..), Lang(..), 
  Logging(..), Modularity(..), Structure(..), ConstantStructure(..), 
  ConstantRepr(..), InputModule(..), AuxFile(..), Visibility(..),
  defaultChoices)  
import Language.Drasil.Generate (gen, genCode)
import Language.Drasil.Printers (DocSpec(DocSpec), DocType(SRS, Website, Notebook))

import Drasil.Truss.Body (si, srs, printSetting)

code :: CodeSpec
code = codeSpec si choices []

choices :: Choices
choices = defaultChoices {
  lang = [Python, Cpp, CSharp, Java, Swift],
  modularity = Modular Separated,
  impType = Program,
  logFile = "log.txt",
  logging = [LogVar, LogFunc],
  comments = [CommentFunc, CommentClass, CommentMod],
  doxVerbosity = Quiet,
  dates = Hide,
  onSfwrConstraint = Exception,
  onPhysConstraint = Exception,
  inputStructure = Bundled,
  constStructure = Inline,
  constRepr = Const,
  auxFiles = [SampleInput "../../datafiles/Truss/sampleInput.txt", ReadME] 
}

main :: IO()
main = do
  gen (DocSpec SRS      "Truss_SRS") srs printSetting
  gen (DocSpec Website  "Truss_SRS") srs printSetting
  gen (DocSpec Notebook "Truss_SRS") srs printSetting
  genCode choices code
