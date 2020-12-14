module Drasil.Truss.Unitals where

import Language.Drasil
import Language.Drasil.ShortHands

import Theory.Drasil (mkQuantDef)

import Data.Drasil.IdeaDicts

import Data.Drasil.SI_Units(metre, radian, newton)
import Data.Drasil.Units.Physics(momentOfForceU)
import Data.Drasil.Concepts.Documentation (assumption, goalStmt, likelyChg, 
  unlikelyChg, physSyst, requirement, srs)
import Data.Drasil.Concepts.Math as CM (angle)
import qualified Data.Drasil.Quantities.Physics as QP (force, distance, moment)
import Data.Drasil.Quantities.Physics (subMax, subMin)
import Data.Drasil.Quantities.Math (pi_)
import Data.Drasil.Constraints (gtZeroConstr)

unitSymbs :: [UnitaryConceptDict]
unitSymbs = map ucw unitalChunks ++ map ucw [forceX, forceY]

symbols, symbolsAll :: [QuantityDict]
symbols = map qw unitalChunks ++ map qw inConstraints ++ map qw outConstraints
symbolsAll = symbols ++ inputs ++ outputs ++ map qw specParamValList

unitalChunks :: [UnitalChunk]
unitalChunks = [forceX, forceY, moment_i]

acronyms :: [CI]
acronyms = [assumption, dataDefn, genDefn, goalStmt, inModel, likelyChg,
  physSyst, requirement, srs, thModel, unlikelyChg]

inputs :: [QuantityDict]
inputs = map qw [force_1, distance_1, distance_2, theta_1, theta_2]

outputs :: [QuantityDict]
outputs = map qw [forceAx, forceAy, forceBy, forceAC, forceAD, forceBC, forceBD, forceCD]

--
forceParam :: String -> String -> Symbol -> UnitalChunk
forceParam n w s = ucs'
 (dccWDS ("force" ++ n) (cn $ "force component in the " ++ w) (phrase QP.force)) 
  (sub (eqSymb QP.force) s) Real newton

forceX    = forceParam "X" "x direction" labelX
forceY    = forceParam "Y" "y direction" labelY

labelX, labelx, labelY, label1, label2, labelAx, labelAy, labelBy, labelAC, labelAD,
  labelBC, labelBD, labelCD, labelout, labeli :: Symbol
labelX  = Label "x"
labelx  = Variable "x"
labelY  = Label "y"
label1  = Integ 1
label2  = Integ 2
labelAx = Label "Ax"  
labelAy = Label "Ay"
labelBy = Label "By" 
labelAC = Label "AC" 
labelAD = Label "AD"
labelBC = Label "BC" 
labelBD = Label "BD" 
labelCD = Label "CD"
labelout = Label "out"
labeli = Label "i"  

moment_i, force_1, distance_1, distance_2, theta_1, theta_2, forceAx, 
  forceAy, forceBy, forceAC, forceAD, forceBC, forceBD, forceCD :: UnitalChunk

moment_i = ucs' (dccWDS "m_i" (cn "moment component of joint i") 
      (phrase QP.moment)) (sub (eqSymb QP.moment) labeli) Real momentOfForceU

force_1 = ucs' (dccWDS "f_1" (cn "external force") 
      (phrase QP.force)) (sub (eqSymb QP.force) label1) Real newton

distance_1 = ucs' (dccWDS "x_1" (cn "distance from joint A to joint D")
      (phrase QP.distance)) (sub labelx (Label "1")) Real metre

distance_2 = ucs' (dccWDS "x_2" (cn "distance from joint D to joint B") 
      (phrase QP.distance)) (sub labelx (Label "2")) Real metre

theta_1 = ucs' (dccWDS "theta_1" (cn "angle between member 1 and 3")
      (phrase CM.angle)) (sub lTheta (Label "1")) Real radian

theta_2 = ucs' (dccWDS "theta_2" (cn "angle between member 2 and 4")
      (phrase CM.angle)) (sub lTheta (Label "2")) Real radian

forceAx = ucs' (dccWDS "f_Ax" (cn "x-component of reaction force on joint A") 
      (phrase QP.force)) (sub (eqSymb QP.force) labelAx) Real newton

forceAy = ucs' (dccWDS "f_Ay" (cn "y-component of reaction force on joint A") 
      (phrase QP.force)) (sub (eqSymb QP.force) labelAy) Real newton

forceBy = ucs' (dccWDS "f_By" (cn "y-component of reaction force on joint B") 
      (phrase QP.force)) (sub (eqSymb QP.force) labelBy) Real newton

forceAC = ucs' (dccWDS "f_AC" (cn "force between joint A and C")
      (phrase QP.force)) (sub (eqSymb QP.force) labelAC) Real newton

forceAD = ucs' (dccWDS "f_AD" (cn "force between joint A and D")
      (phrase QP.force)) (sub (eqSymb QP.force) labelAD) Real newton

forceBC = ucs' (dccWDS "f_BC" (cn "force between joint B and C")
      (phrase QP.force)) (sub (eqSymb QP.force) labelBC) Real newton

forceBD = ucs' (dccWDS "f_BD" (cn "force between joint B and D")
      (phrase QP.force)) (sub (eqSymb QP.force) labelBD) Real newton

forceCD = ucs' (dccWDS "f_CD" (cn "force between joint C and D") 
      (phrase QP.force)) (sub (eqSymb QP.force) labelCD) Real newton

-- constraint --

inConstraints :: [UncertQ]
inConstraints = map (`uq` defaultUncrt) [exForceCon, fstDistanceCon, sndDistanceCon, fstAngleCon, sndAngleCon]

outConstraints :: [UncertQ]
outConstraints = map (`uq` defaultUncrt) [outForceCon]

exForceCon, fstDistanceCon, sndDistanceCon, fstAngleCon, sndAngleCon, outForceCon :: ConstrConcept

exForceCon = constrained' force_1 [gtZeroConstr, sfwrc $ Bounded (Inc, sy exForceMin) (Inc, sy exForceMax)] (dbl 500)
fstDistanceCon = constrained' distance_1 [gtZeroConstr, sfwrc $ Bounded (Exc, sy distanceMin) (Inc, sy distanceMax)] (dbl 3)
sndDistanceCon = constrained' distance_2 [gtZeroConstr, sfwrc $ Bounded (Exc, sy distanceMin) (Inc, sy distanceMax)] (dbl 3)
fstAngleCon = constrained' theta_1 [physc $ Bounded (Exc, 0) (Exc, sy pi_ ), sfwrc $ Bounded (Exc, sy angleMin) (Exc, sy angleMax)] (sy pi_ / 4)
sndAngleCon = constrained' theta_2 [physc $ Bounded (Exc, 0) (Exc, sy pi_ ), sfwrc $ Bounded (Exc, sy angleMin) (Exc, sy angleMax)] (sy pi_ / 4)

outForceCon = cuc' "outForceCon"
  (nounPhraseSP "all the output forces")
  "output forces in the document" 
  (sub (eqSymb QP.force) labelout) newton Rational
  [physc $ UpFrom (Exc, 0)] (dbl 0)

-- constant --

specParamValList :: [QDefinition]
specParamValList = [exForceMin, exForceMax, distanceMin, distanceMax, angleMin, angleMax]

exForceMin, exForceMax :: QDefinition

exForceMin = mkQuantDef (unitary "exForceMin"
  (nounPhraseSP "minimum value for external force")
  (subMin (eqSymb QP.force)) newton Rational) (-100000)

exForceMax = mkQuantDef (unitary "exForceMax"
  (nounPhraseSP "maximum value for external force")
  (subMax (eqSymb QP.force)) newton Rational) (100000)

distanceMin = mkQuantDef (unitary "distanceMin"
  (nounPhraseSP "minimum value for distance")
  (subMin (eqSymb QP.distance)) metre Rational) (dbl 0)

distanceMax = mkQuantDef (unitary "distanceMax"
  (nounPhraseSP "maximum value for distance")
  (subMax (eqSymb QP.distance)) metre Rational) (100000)

angleMin = mkQuantDef (unitary "angleMin"
  (nounPhraseSP "minimum value for angle")
  (subMin (lTheta)) radian Rational) (sy pi_ / 2)

angleMax = mkQuantDef (unitary "angleMax"
  (nounPhraseSP "maximum value for angle")
  (subMax (lTheta)) radian Rational) (sy pi_ / 2)

