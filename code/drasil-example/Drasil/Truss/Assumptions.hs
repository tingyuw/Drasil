module Drasil.Truss.Assumptions where

import Language.Drasil
import Utils.Drasil

import Data.Drasil.Concepts.Documentation (assumpDom)

assumptions :: [ConceptInstance]
assumptions = [staticDeterminate, pinConnected, connectedatEnd, straightTruss, igWeight, 
  twokindForce, applyatJoint]

staticDeterminate, pinConnected, connectedatEnd, 
  straightTruss, igWeight, twokindForce, applyatJoint :: ConceptInstance
staticDeterminate = cic "staticDeterminate" staticDeterminateDesc "staticDeterminate" assumpDom
pinConnected      = cic "pinConnected"      pinConnectedDesc      "pinConnected"      assumpDom
connectedatEnd    = cic "connectedatEnd"    connectedatEndDesc    "connectedatEnd"    assumpDom
straightTruss     = cic "straightTruss"     straightTrussDesc     "straightTruss"     assumpDom
igWeight          = cic "igWeight"          igWeightDesc          "igWeight"          assumpDom
twokindForce      = cic "twokindForce"      twokindForceDesc      "twokindForce"      assumpDom
applyatJoint      = cic "applyatJoint"      applyatJointDesc      "applyatJoint"      assumpDom

staticDeterminateDesc :: Sentence
staticDeterminateDesc = S "The structure" `sIs` S "statically determinate." 

pinConnectedDesc :: Sentence
pinConnectedDesc = S "All joints" `sAre` S "connected by frictionless pins."

connectedatEndDesc :: Sentence
connectedatEndDesc = S "Truss members" `sAre` S "connected only at their end." 

straightTrussDesc :: Sentence
straightTrussDesc = S "All the truss members" `sAre` S "perfectly straight."

igWeightDesc :: Sentence
igWeightDesc = S "The weight of the members" `sAre` S "negligibly small which can be ignored."

twokindForceDesc :: Sentence
twokindForceDesc = S "All the members have only tension or compression force."

applyatJointDesc :: Sentence
applyatJointDesc = S "All loads and support reactions" `sAre` S "applied at the joints only."

