module Drasil.Truss.TMods where

import Language.Drasil
import Theory.Drasil (TheoryModel, tm)
import Utils.Drasil

import Data.Drasil.Quantities.Physics (force, moment)

import Drasil.Truss.References (mofjWiki, momentWiki)
import Drasil.Truss.Unitals (forceX, forceY)

tMods :: [TheoryModel]
tMods = [staticEqTM]

staticEqTM :: TheoryModel
staticEqTM = tm (cw staticEqRC)
  [qw forceX, qw forceX] ([] :: [ConceptChunk]) [] [staticEqRel] []
  [makeCite mofjWiki, makeCite momentWiki] "staticEquilibrium" []

staticEqRC :: RelationConcept
staticEqRC = makeRC "staticEqRC" (nounPhraseSP "static Equilibrium") EmptyS staticEqRel

staticEqRel :: Relation
staticEqRel = sy forceX $= 0


