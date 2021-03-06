module Drasil.Truss.Requirements where

import Language.Drasil
import Drasil.DocLang.SRS (datCon, propCorSol)
import Utils.Drasil

import Data.Drasil.Concepts.Computation (inValue)
import Data.Drasil.Concepts.Documentation (code, datumConstraint, environment, 
  funcReqDom, nonFuncReqDom, output_, property, value, vavPlan)
import Data.Drasil.Concepts.Math (calculation)
import Data.Drasil.Concepts.Software (errMsg)

import Drasil.Truss.IMods (reactionAxIM, reactionAyIM, reactionByIM, internalAcIM,
  internalAdIM, internalBcIM, internalBdIM, internalCdIM)
import Drasil.Truss.Unitals (forceAx, forceAy, forceBy, 
  forceAC, forceAD, forceBC, forceBD, forceCD)

--Functional Requirements--
funcReqs :: [ConceptInstance]
funcReqs = [verifyInVals, calcValues, outputValues]

verifyInVals, calcValues, outputValues :: ConceptInstance

verifyInVals = cic "verifyInVals" verifyParamsDesc "Verify-Input-Values" funcReqDom
calcValues   = cic "calcValues"   calcValuesDesc   "Calculate-Values"    funcReqDom
outputValues = cic "outputValues" outputValuesDesc "Output-Values"       funcReqDom

verifyParamsDesc, calcValuesDesc, outputValuesDesc :: Sentence
verifyParamsDesc = foldlSent [S "Check the entered", plural inValue,
  S "to ensure that they do not exceed the", plural datumConstraint,
  S "mentioned in" +:+. makeRef2S (datCon ([]::[Contents]) ([]::[Section])), 
  S "If any of the", plural inValue, S "are out of bounds" `sC`
  S "an", phrase errMsg, S "is displayed" `andThe` plural calculation, S "stop"]

calcValuesDesc = foldlSent [S "Calculate the following" +: plural value,
  foldlList Comma List [
    ch forceAx +:+ sParen (S "from" +:+ makeRef2S reactionAxIM),
    ch forceAy +:+ sParen (S "from" +:+ makeRef2S reactionAyIM),
    ch forceBy +:+ sParen (S "from" +:+ makeRef2S reactionByIM)
  ]]

outputValuesDesc = foldlSent [atStart output_, 
  foldlList Comma List [
    ch forceAC +:+ sParen (S "from" +:+ makeRef2S internalAcIM), 
    ch forceAD +:+ sParen (S "from" +:+ makeRef2S internalAdIM),
    ch forceBC +:+ sParen (S "from" +:+ makeRef2S internalBcIM),
    ch forceBD +:+ sParen (S "from" +:+ makeRef2S internalBdIM),
    ch forceCD +:+ sParen (S "from" +:+ makeRef2S internalCdIM)]]

--Nonfunctional Requirements--
nonfuncReqs :: [ConceptInstance]
nonfuncReqs = [accurate, verifiable, understandable, portable, maintainable, reliable]

accurate :: ConceptInstance
accurate = cic "accurate" (foldlSent [
  S "The accuracy of the computed solutions should meet the level needed for structural mechanic" 
  `sAnd` S "have the", plural property, S "described in", makeRef2S (propCorSol [] [])
  ]) "Accuracy" nonFuncReqDom

verifiable :: ConceptInstance
verifiable = cic "verifiable" (foldlSent [
  S "The", plural property, S "of the software should be able to tested easily through",
  phrase vavPlan]) "Verifiability" nonFuncReqDom

understandable :: ConceptInstance
understandable = cic "understandable" (foldlSent [
  S "The", phrase code, S "and the design of the software should be understandable" +:+
  S " by a new developer"]) "Understandability" nonFuncReqDom

portable :: ConceptInstance
portable = cic "portable" (foldlSent [
  S "The", phrase code, S "is able to be run on different", plural environment])
  "Portability" nonFuncReqDom

maintainable :: ConceptInstance
maintainable = cic "maintainable" (foldlSent [
  S "The software can be modified and improved easily"]) "Maintainability" nonFuncReqDom

reliable :: ConceptInstance
reliable = cic "reliable" (foldlSent [
  S "The probability of failure-free software operation for required functions" +:+
  S "for a specified period of time"]) "Reliability" nonFuncReqDom

