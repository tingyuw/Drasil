module Drasil.Truss.Figures where

import Language.Drasil

import Data.Drasil.Concepts.Documentation (physicalSystem)

resourcePath :: String
resourcePath = "../../../datafiles/Truss/"

figphysSys :: LabelledContent
figphysSys = llcc (makeFigRef "physSysImage") $ figWithWidth (S "The" +:+ phrase physicalSystem)
  (resourcePath ++ "PhysicalSystem.png") 70
