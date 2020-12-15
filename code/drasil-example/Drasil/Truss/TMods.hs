module Drasil.Truss.TMods where

import Language.Drasil
import Theory.Drasil (TheoryModel, tm)
import Utils.Drasil

import Drasil.Truss.References (mofjWiki, momentWiki)
import Drasil.Truss.Unitals (forceX, forceY, moment_i)
import Drasil.Truss.Assumptions (staticDeterminate)

tMods :: [TheoryModel]
tMods = [staticEqTM]

staticEqTM :: TheoryModel
staticEqTM = tm (cw staticEqRC)
  [qw forceX, qw forceX] ([] :: [ConceptChunk]) [] [staticEqRel] []
  [makeCite mofjWiki, makeCite momentWiki] "staticEquilibrium" [staticEqDesc]

staticEqRC :: RelationConcept
staticEqRC = makeRC "staticEqRC" (nounPhraseSP "static Equilibrium") EmptyS staticEqRel

staticEqDesc :: Sentence
staticEqDesc = foldlSent [S "The structure is assumed to be statically determinate"
  +:+ fromSource staticDeterminate]

staticEqRel :: Relation
staticEqRel = sumAll (Variable "I") (sy forceX $= sy forceY $= sy moment_i $= 0) 


