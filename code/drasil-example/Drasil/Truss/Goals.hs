module Drasil.Truss.Goals where

import Language.Drasil

import Data.Drasil.Concepts.Documentation (goalStmtDom)

goals :: [ConceptInstance]
goals = [reactionForce, internalForce, stressDist]

reactionForce :: ConceptInstance
reactionForce = cic "reactionForce" 
  (S "Solve the support reaction forces.")
  "reactionForce" goalStmtDom

internalForce :: ConceptInstance
internalForce = cic "internalForce" 
  (S "Solve the internal forces acting on truss members.") 
  "internalForce" goalStmtDom

stressDist :: ConceptInstance
stressDist = cic "stressDist" 
  (S "Determine the stress distribution for each internal force.")
  "stressDist" goalStmtDom