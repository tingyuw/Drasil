module Drasil.Truss.Body where

import Control.Lens ((^.))

import Language.Drasil hiding (Symbol(..), Vector)
import Language.Drasil.Code (relToQD)
import Language.Drasil.Printers (PrintingInformation(..), defaultConfiguration)
import Database.Drasil (Block, ChunkDB, ReferenceDB, SystemInformation(SI),
  cdb, rdb, refdb, _authors, _purpose, _concepts, _constants, _constraints, 
  _datadefs, _configFiles, _definitions, _defSequence, _inputs, _kind, _outputs, 
  _quants, _sys, _sysinfodb, _usedinfodb)
import Theory.Drasil (DataDefinition, GenDefn, InstanceModel, TheoryModel, 
  Theory(defined_fun, defined_quant))
import Utils.Drasil

import Drasil.DocLang (AuxConstntSec(AuxConsProg),
  DerivationDisplay(ShowDerivation), 
  DocSection(..),
  Emphasis(Bold), Field(..), Fields, InclUnits(IncludeUnits),
  IntroSec(..), IntroSub(IScope), ProblemDescription(PDProg), PDSub(..),
  RefSec(..), RefTab(..), ReqrmntSec(..), ReqsSub(..), SCSSub(..), SRSDecl, 
  SSDSec(..), SSDSub(SSDProblem, SSDSolChSpec), SolChSpec(SCSProg), 
  TConvention(..), TSIntro(..), TraceabilitySec(TraceabilityProg), 
  Verbosity(Verbose), intro, mkDoc, traceMatStandard, tsymb)

import Data.Drasil.Concepts.Math (mathcon)

import Data.Drasil.Quantities.Math (pi_)

import Data.Drasil.People
import Data.Drasil.SI_Units(metre, radian, newton)
import Data.Drasil.Concepts.Computation (compcon)
import Data.Drasil.Concepts.Documentation (doccon, doccon', problem, srsDomains)
import qualified Data.Drasil.Concepts.Documentation as Doc (srs)
import Data.Drasil.Concepts.Software (program, softwarecon)

import Drasil.Truss.Concepts(truss, compression, forceEquilibrium, joint, 
  methodofJoint, moment, momentEquilibrium, pinSupport, reactionForce, rollerSupport, tension)
import Drasil.Truss.Figures
import Drasil.Truss.Goals (goals)
import Drasil.Truss.Assumptions
import Drasil.Truss.TMods (tMods)
import Drasil.Truss.Unitals (symbolsAll, acronyms, inputs, outputs, 
  inConstraints, outConstraints, specParamValList)
import Drasil.Truss.IMods (iMods)
import Drasil.Truss.Requirements (funcReqs, nonfuncReqs)
import Drasil.Truss.Changes (likelyChgs, unlikelyChgs)
import Drasil.Truss.References (citations)

srs :: Document
srs = mkDoc mkSRS (for'' titleize phrase) si

printSetting :: PrintingInformation
printSetting = PI symbMap Equational defaultConfiguration

mkSRS :: SRSDecl
mkSRS = [
  RefSec $
    RefProg intro
      [ TUnits
      , tsymb [TSPurpose, TypogConvention [Vector Bold], SymbOrder, VectorUnits]
      , TAandA
      ],
  IntroSec $
    IntroProg justification (phrase truss)
      [ IScope scope ],
  SSDSec $
    SSDProg
      [ SSDProblem $ PDProg prob []
        [ TermsAndDefs Nothing terms
        , PhySysDesc truss physSystParts figphysSys []
        , Goals [S "truss properties and the external force"]]
      , SSDSolChSpec $ SCSProg
        [ Assumptions
        , TMs [] (Label : stdFields)
        , IMs [] ([Label, Input, Output, InConstraints, OutConstraints] ++ stdFields) ShowDerivation
        , Constraints EmptyS inConstraints
        , CorrSolnPpties outConstraints []
        ]
      ],
  ReqrmntSec $
    ReqsProg
      [ FReqsSub EmptyS []
      , NonFReqsSub
      ],
  LCsSec,
  UCsSec,
  TraceabilitySec $ TraceabilityProg $ traceMatStandard si,
  AuxConstntSec $ AuxConsProg truss specParamValList,
  Bibliography
  ]

justification, scope :: Sentence
justification = foldlSent [atStart truss, S "analysis is a common problem in mechanics.", 
  S "Therefore, it is useful to have a", phrase program, 
  S "to solve and model these types of" +:+. plural problem,
  S "The", phrase program, S "documented here is called", phrase truss]
scope = foldlSent_ [S "solving for unknown forces" `sAnd` S "find out their stress distribution of a ideal", 
  phrase truss, S "structure"]

si :: SystemInformation
si = SI {
  _sys         = truss,
  _kind        = Doc.srs,
  _authors     = [tyWu],
  _purpose     = [],
  _quants      = symbolsAll :: [QuantityDict],
  _concepts    = [] :: [DefinedQuantityDict],
  _definitions = map (relToQD symbMap) iMods ++ 
                 concatMap (^. defined_quant) tMods ++
                 concatMap (^. defined_fun) tMods,
  _datadefs    = [] :: [DataDefinition],
  _configFiles  = [],
  _inputs      = inputs :: [QuantityDict],
  _outputs     = outputs :: [QuantityDict],
  _defSequence = [] :: [Block QDefinition],
  _constraints = inConstraints ++ outConstraints :: [UncertQ],
  _constants   = specParamValList :: [QDefinition],
  _sysinfodb   = symbMap,
  _usedinfodb  = usedDB,
   refdb       = refDB
}

symbMap :: ChunkDB
symbMap = cdb (qw pi_ : map qw symbolsAll :: [QuantityDict]) (nw truss : [nw program] 
  ++ map nw symbolsAll ++ map nw doccon ++ map nw doccon' ++ map nw softwarecon ++ map nw mathcon 
  ++ map nw specParamValList ++ map nw compcon ++ map nw [metre, radian, newton]) 
  (srsDomains :: [ConceptChunk])
  (map unitWrapper [metre, radian, newton] :: [UnitDefn]) ([] :: [DataDefinition]) (iMods :: [InstanceModel])
  ([] :: [GenDefn]) (tMods :: [TheoryModel]) (concIns :: [ConceptInstance])
  ([] :: [Section]) ([] :: [LabelledContent])

usedDB :: ChunkDB
usedDB = cdb ([] :: [QuantityDict]) (nw pi_ : map nw symbolsAll ++ map nw acronyms) ([] :: [ConceptChunk])
  ([] :: [UnitDefn]) ([] :: [DataDefinition]) ([] :: [InstanceModel])
  ([] :: [GenDefn]) ([] :: [TheoryModel]) ([] :: [ConceptInstance])
  ([] :: [Section]) ([] :: [LabelledContent])

stdFields :: Fields
stdFields = [DefiningEquation, Description Verbose IncludeUnits, Notes, Source, RefBy]

refDB :: ReferenceDB
refDB = rdb citations concIns

concIns :: [ConceptInstance]
concIns = assumptions ++ goals ++ funcReqs ++ nonfuncReqs ++ likelyChgs ++ unlikelyChgs
-------------------------
-- Problem Description --
-------------------------

prob :: Sentence
prob = foldlSent_ [S "analyze the unknown forces acting on truss"]

---------------------------------
-- Terminology and Definitions --
---------------------------------

terms :: [ConceptChunk]
terms = [compression, forceEquilibrium, joint, methodofJoint, moment, 
  momentEquilibrium, pinSupport, reactionForce, rollerSupport, tension]

---------------------------------
-- Physical System Description --
---------------------------------

physSystParts :: [Sentence]
physSystParts = map foldlSent [
  [S "The pin support"],
  [S "The roller support"],
  [S "The joints"],
  [S "Truss members"]]