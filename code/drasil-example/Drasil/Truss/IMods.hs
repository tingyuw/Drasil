module Drasil.Truss.IMods where

import Prelude hiding (cos, sin)

import Language.Drasil
import Theory.Drasil (InstanceModel, imNoDerivNoRefs, qwUC, qwC)
import Utils.Drasil

import Drasil.Truss.Figures (figphysSys)
import Drasil.Truss.Unitals (force_1, distance_1, distance_2, theta_1, theta_2,
  forceAx, forceAy, forceBy, forceAC, forceAD, forceBC, forceBD, forceCD)

iMods :: [InstanceModel]
iMods = [reactionAxIM, reactionAyIM, reactionByIM, internalAcIM, internalAdIM,
  internalBcIM, internalBdIM, internalCdIM]


--Reaction force Fax--
reactionAxIM :: InstanceModel
reactionAxIM = imNoDerivNoRefs reactionAxRC []
  (qw forceAx) [] "reactionAx" [reactionAxDesc]

reactionAxRC :: RelationConcept
reactionAxRC = makeRC "reactionAxRC" reactionAxNP EmptyS reactionAxRel

reactionAxNP :: NP
reactionAxNP = nounPhraseSP "Support reaction force on joint A in the x direction"

reactionAxRel :: Relation -- FIXME: add proper equation
reactionAxRel = sy forceAx $= 0

reactionAxDesc :: Sentence
reactionAxDesc = foldlSent [S "Because joint A is pinned, there is a reacting force in the x direction," +:+.
  ch forceAx, S "We apply the static equilibrium to slove the reaction force"]

--Reaction force Fay--
reactionAyIM :: InstanceModel
reactionAyIM = imNoDerivNoRefs reactionAyRC [qwUC force_1 
  ,qwC distance_1 $ UpFrom (Exc, 0)
  ,qwC distance_2 $ UpFrom (Exc, 0)
  ]
  (qw forceAy) [] "reactionAy" [reactionAyDesc]

reactionAyRC :: RelationConcept
reactionAyRC = makeRC "reactionAyRC" reactionAyNP EmptyS reactionAyRel

reactionAyNP :: NP
reactionAyNP = nounPhraseSP "Support reaction force on joint A in the y direction"

reactionAyRel :: Relation -- FIXME: add proper equation
reactionAyRel = sy forceAy $= sy force_1 * sy distance_2 / (sy distance_1 + sy distance_2)

reactionAyDesc :: Sentence
reactionAyDesc = foldlSent [ch distance_1 `sAnd` ch distance_2 `sAre` S "shown in" +:+. makeRef2S figphysSys]

--Reaction force FBy--
reactionByIM :: InstanceModel
reactionByIM = imNoDerivNoRefs reactionByRC [qwUC force_1 
  ,qwC distance_1 $ UpFrom (Exc, 0)
  ,qwC distance_2 $ UpFrom (Exc, 0)
  ]
  (qw forceBy) [] "reactionBy" [reactionByDesc]

reactionByRC :: RelationConcept
reactionByRC = makeRC "reactionByRC" reactionByNP EmptyS reactionByRel

reactionByNP :: NP
reactionByNP = nounPhraseSP "Support reaction force on joint B in the y direction"

reactionByRel :: Relation -- FIXME: add proper equation
reactionByRel = sy forceBy $= sy force_1 * sy distance_1 / (sy distance_1 + sy distance_2)

reactionByDesc :: Sentence
reactionByDesc = foldlSent [ch distance_1 `sAnd` ch distance_2 `sAre` S "shown in" +:+. makeRef2S figphysSys]

--Internal forces at joint A--
internalAcIM :: InstanceModel
internalAcIM = imNoDerivNoRefs internalAcRC [qwUC forceAy 
  ,qwC theta_1 $ UpFrom (Exc, 0)
  ]
  (qw forceAC) [] "internalAC" [internalAcDesc]

internalAcRC :: RelationConcept
internalAcRC = makeRC "internalAcRC" internalAcNP EmptyS internalAcRel

internalAcNP :: NP
internalAcNP = nounPhraseSP "Solving internal force between joint A and C" 

internalAcRel :: Relation -- FIXME: add proper equation
internalAcRel = sy forceAC $= - sy forceAy / sin (sy theta_1)

internalAcDesc :: Sentence
internalAcDesc = foldlSent [S "Truss structure is show in", makeRef2S figphysSys]

internalAdIM :: InstanceModel
internalAdIM = imNoDerivNoRefs internalAdRC [qwUC forceAC 
  ,qwC theta_1 $ UpFrom (Exc, 0)
  ]
  (qw forceAD) [] "internalAD" [internalAdDesc]

internalAdRC :: RelationConcept
internalAdRC = makeRC "internalAdRC" internalAdNP EmptyS internalAdRel

internalAdNP :: NP
internalAdNP = nounPhraseSP "Solving internal force between joint A and D"

internalAdRel :: Relation -- FIXME: add proper equation
internalAdRel = sy forceAD $= - sy forceAC / cos (sy theta_1)

internalAdDesc :: Sentence
internalAdDesc = foldlSent [S "Truss structure is show in", makeRef2S figphysSys]

--Internal forces at joint B--
internalBcIM :: InstanceModel
internalBcIM = imNoDerivNoRefs internalBcRC [qwUC forceBy 
  ,qwC theta_2 $ UpFrom (Exc, 0)
  ]
  (qw forceBC) [] "internalBC" [internalBcDesc]

internalBcRC :: RelationConcept
internalBcRC = makeRC "internalBcRC" internalBcNP EmptyS internalBcRel

internalBcNP :: NP
internalBcNP = nounPhraseSP "Solving internal force between joint B and C" 

internalBcRel :: Relation -- FIXME: add proper equation
internalBcRel = sy forceBC $= - sy forceBy / sin (sy theta_2)

internalBcDesc :: Sentence
internalBcDesc = foldlSent [S "Truss structure is show in", makeRef2S figphysSys]

internalBdIM :: InstanceModel
internalBdIM = imNoDerivNoRefs internalBdRC [qwUC forceBC 
  ,qwC theta_2 $ UpFrom (Exc, 0)
  ]
  (qw forceBD) [] "internalBD" [internalBdDesc]

internalBdRC :: RelationConcept
internalBdRC = makeRC "internalBdRC" internalBdNP EmptyS internalBdRel

internalBdNP :: NP
internalBdNP = nounPhraseSP "Solving internal force between joint B and D"

internalBdRel :: Relation -- FIXME: add proper equation
internalBdRel = sy forceBD $= - sy forceBC / cos (sy theta_2)

internalBdDesc :: Sentence
internalBdDesc = foldlSent [S "Truss structure is show in", makeRef2S figphysSys]

--Internal forces at joint D--
internalCdIM :: InstanceModel
internalCdIM = imNoDerivNoRefs internalCdRC [qwUC force_1]
  (qw forceCD) [] "internalCD" [internalCdDesc]

internalCdRC :: RelationConcept
internalCdRC = makeRC "internalCdRC" internalCdNP EmptyS internalCdRel

internalCdNP :: NP
internalCdNP = nounPhraseSP "Solving internal force between joint C and D"

internalCdRel :: Relation -- FIXME: add proper equation
internalCdRel = sy forceCD $= sy force_1 
internalCdDesc :: Sentence
internalCdDesc = foldlSent [S "Truss structure is show in", makeRef2S figphysSys]