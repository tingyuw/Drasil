{-# LANGUAGE TemplateHaskell #-}
module Language.Drasil.Chunk.NamedIdea (NamedChunk, nc, IdeaDict, nw, mkIdea) where

import Language.Drasil.UID (UID)
import Language.Drasil.Classes.Core (HasUID(uid))
import Language.Drasil.Classes (NamedIdea(term), Idea(getA))
import Control.Lens ((^.), makeLenses)

import Language.Drasil.NounPhrase (NP)

-- === DATA TYPES/INSTANCES === --
-- | Note that a |NamedChunk| does not have an acronym/abbreviation
-- as that's a |CommonIdea|, which has its own representation
data NamedChunk = NC {_uu :: UID, _np :: NP}
makeLenses ''NamedChunk

instance Eq        NamedChunk where c1 == c2 = (c1 ^. uid) == (c2 ^. uid)
instance HasUID    NamedChunk where uid = uu
instance NamedIdea NamedChunk where term = np
instance Idea      NamedChunk where getA _ = Nothing
  
-- | 'NamedChunk' constructor, takes an uid and a term.
nc :: String -> NP -> NamedChunk
nc = NC

-- | |IdeaDict| is the canonical dictionary associated to |Idea|
-- don't export the record accessors
data IdeaDict = IdeaDict { _nc' :: NamedChunk, mabbr :: Maybe String }
makeLenses ''IdeaDict

instance Eq        IdeaDict where a == b = a ^. uid == b ^. uid
instance HasUID    IdeaDict where uid = nc' . uid
instance NamedIdea IdeaDict where term = nc' . term
instance Idea      IdeaDict where getA = mabbr
  
mkIdea :: String -> NP -> Maybe String -> IdeaDict
mkIdea s np' = IdeaDict (nc s np')

-- Historical name: nw comes from 'named wrapped' from when
-- |NamedIdea| exported |getA| (now in |Idea|). But there are
-- no more wrappers, instead we have explicit dictionaries.
nw :: Idea c => c -> IdeaDict
nw c = IdeaDict (NC (c^.uid) (c^.term)) (getA c)
