module Drasil.SSP.IMods where

--import Control.Lens ((^.))

import Language.Drasil
import Drasil.SSP.Units
import Drasil.SSP.Defs
import Data.Drasil.SentenceStructures (foldlSent)
import Control.Lens ((^.))


-----------------------
--  Instance Models  --
-----------------------

sspIMods :: [RelationConcept]
sspIMods = [fctSfty, nrmShrFor, intsliceFs, forDisEqlb, rfemFoS, crtSlpId]

fixmeS :: Sentence
fixmeS = S "FIXME: add description"
--
fctSfty :: RelationConcept
fctSfty = makeRC "fctSfty" factorOfSafety fcSfty_desc fcSfty_rel

fcSfty_rel :: Relation
fcSfty_rel = (C fs) := (Int 0) --FIXME: add the long equation

fcSfty_desc :: Sentence
fcSfty_desc = foldlSent [S "Equation for the Factor of Safety is the ratio between resistive",
  S "and mobile shear of the slip surface. The sum of values from each slice is taken to find",
  S "the total resistive and mobile shear for the slip surface. The constants", P (Greek Phi),
  S "and", P (Greek Psi), S "convert the resistive and mobile shear without the inluence of", 
  S "interslice forces, to a calculation considering the interslice forces"]

--
nrmShrFor :: RelationConcept
nrmShrFor = makeRC "nrmShrFor" (nounPhraseSP "normal/shear force ratio") nrmShrF_desc nrmShrF_rel

nrmShrF_rel :: Relation
nrmShrF_rel = (C fs) := (Int 0) --FIXME: add the long equation

nrmShrF_desc :: Sentence
nrmShrF_desc = foldlSent [P (Greek Lambda_L), S "is the magnitude ratio between shear and", 
  S "normal forces at the interslice interfaces as the assumption of the Morgenstern Price", 
  S "method in GD5. The inclination function f determines the relative magnitude ratio",
  S "between the different interslices, while", P (Greek Lambda_L), S "determines the" +:+. 
  S "magnitude", P (Greek Lambda_L), S "uses the sum of interslice normal and shear forces",
  S "taken from each interslice"] --FIXME: does "i" need to be pulled out?

--
intsliceFs :: RelationConcept
intsliceFs = makeRC "intsliceFs" (nounPhraseSP "interslice forces") sliceFs_desc sliceFs_rel

sliceFs_rel :: Relation
sliceFs_rel = (C fs) := (Int 0) --FIXME: add the long equation

sliceFs_desc :: Sentence
sliceFs_desc = foldlSent [S "The value of the interslice normal force", (P $ intNormForce ^. symbol),
  S "at interface i. The net force is the weight of the slices adjacent to interface i exert", 
  S "horizontally on each other"] --FIXME: does "i" need to be pulled out?

--
forDisEqlb :: RelationConcept
forDisEqlb = makeRC "forDisEqlb" (nounPhraseSP "force displacement equilibrium") fDisEq_desc fDisEq_rel

fDisEq_rel :: Relation
fDisEq_rel = (C fs) := (Int 0) --FIXME: add the long equation

fDisEq_desc :: Sentence
fDisEq_desc = fixmeS

--
rfemFoS :: RelationConcept
rfemFoS = makeRC "rfemFoS" (nounPhraseSP "RFEM factor of safety") rfemFoS_desc rfemFoS_rel

rfemFoS_rel :: Relation
rfemFoS_rel = (C fs) := (Int 0) --FIXME: add the long equation

rfemFoS_desc :: Sentence
rfemFoS_desc = fixmeS

--
crtSlpId :: RelationConcept
crtSlpId = makeRC "crtSlpId" (nounPhraseSP "critical slip identification") crtSlpId_desc crtSlpId_rel

crtSlpId_rel :: Relation
crtSlpId_rel = (C fs) := (C minFunction) :*  (C critCoords)
--FIXME: use brackets and comma for this equation rather than :*

crtSlpId_desc :: Sentence
crtSlpId_desc = foldlSent [S "Given the necessary slope inputs, a minimization algorithm",
  S "or function", (P $ minFunction ^. symbol), S "will identify the critical slip surface", 
  S "of the slope, with the critical slip coordinates", (P $ critCoords ^. symbol), 
  S "and the minimum factor of safety FSmin that results"]