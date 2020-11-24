module Drasil.Truss.Changes where

import Language.Drasil
import Utils.Drasil

import Data.Drasil.Concepts.Documentation (likeChgDom, unlikeChgDom)

import Drasil.Truss.Assumptions (staticDeterminate, pinConnected, connectedatEnd, 
  straightTruss, igWeight, twokindForce, applyatJoint)
import Drasil.Truss.Goals (internalForce)

--Likely Changes--
likelyChgs :: [ConceptInstance]
likelyChgs = [likeChgNCbP, likeChgWoT, likeChgOtherF]

likeChgNCbP, likeChgWoT, likeChgOtherF :: ConceptInstance

likeChgNCbP = cic "likeChgNCbP" (
  foldlSent [chgsStart pinConnected (S ""), S "Joints may not connected by pins"]) 
  "Not-Connected-by-Pin" likeChgDom

likeChgWoT = cic "likeChgWoT" (
  foldlSent [chgsStart igWeight (S ""), S "The software may be changed" +:+
  S "to consider the weight of the trusses"] ) "Consider-Truss-Weight" likeChgDom

likeChgOtherF = cic "likeChgOtherF" (
  foldlSent [chgsStart twokindForce (S ""), S "There are other forces involved in" +:+
  S "(e.g., shearing and bending)"] ) "Other-Forces-Involved" likeChgDom

--Unlikely Changes--
unlikelyChgs :: [ConceptInstance]
unlikelyChgs = [unlikeChgSIF, unlikeChgStatD, unlikeChgST]

unlikeChgSIF, unlikeChgStatD, unlikeChgST :: ConceptInstance
unlikeChgSIF = cic "unlikeChgSIF" (
  foldlSent [chgsStart internalForce (S ""),S "The goal of the system" +:+
  S "is to find out the internal forces"] ) "Solve-Internal-Forces" unlikeChgDom

unlikeChgStatD = cic "unlikeChgStatD" (
  foldlSent [chgsStart staticDeterminate (S ""),S "The truss structure is statically determinate"] ) 
  "Statically-Determinate" unlikeChgDom

unlikeChgST = cic "unlikeChgST" (
  foldlSent [chgsStart straightTruss (S ""),S "The truss members are straight"] )
  "Straight-Truss" unlikeChgDom

