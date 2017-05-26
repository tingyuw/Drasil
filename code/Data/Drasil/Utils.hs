module Data.Drasil.Utils
  ( foldle
  , foldle1
  , foldlSent
  , foldlList
  , foldlsC
  , mkEnumAbbrevList
  , mkConstraintList
  , zipFTable
  , zipSentList
  , makeTMatrix
  , itemRefToSent
  , refFromType
  , makeListRef
  ) where

import Language.Drasil (Sentence(EmptyS, S, (:+:)), (+:+), (+:+.), ItemType(Flat), sC, sParen, Contents(Definition), makeRef, DType, Section)
  
-- | fold helper functions applies f to all but the last element, applies g to
-- last element and the accumulator
foldle :: (a -> a -> a) -> (a -> a -> a) -> a -> [a] -> a
foldle _ _ z []     = z
foldle _ g z [x]    = g z x
foldle f g z [x,y]  = g (f z x) y
foldle f g z (x:xs) = foldle f g (f z x) xs

-- | fold helper functions applied f to all but last element, applies g to last
-- element and accumulator without starting value, does not work for empty list
foldle1 :: (a -> a -> a) -> (a -> a -> a) -> [a] -> a
foldle1 _ _ []       = error "foldle1 cannot be used with empty list"
foldle1 _ _ [x]      = x
foldle1 _ g [x,y]    = g x y
foldle1 f g (x:y:xs) = foldle f g (f x y) xs

-- | partial function application of foldle for sentences specifically
foldlSent :: [Sentence] -> Sentence
foldlSent = foldle (+:+) (+:+.) EmptyS

-- | creates a list of elements seperated by commas, ending in a "_, and _"
foldlList :: [Sentence] -> Sentence
foldlList = foldle1 sC (\a b -> a `sC` S "and" +:+ b)

-- | creates a list of elements seperated by commas, including the last element
foldlsC :: [Sentence] -> Sentence
foldlsC []       = EmptyS
foldlsC [x]      = x
foldlsC [x,y]    = x `sC` y
foldlsC (x:y:xs) = foldle sC sC (x `sC` y) xs

-- | concantenates number to abbreviation
-- should not be exported
enumWithAbbrev :: Integer -> Sentence -> [Sentence]
enumWithAbbrev start abbrev = [abbrev :+: (S $ show x) | x <- [start..]]

-- | zip helper function enumerates abbreviation and zips it with list of itemtype
mkEnumAbbrevList :: Integer -> Sentence -> [Sentence] -> [(Sentence, ItemType)]
mkEnumAbbrevList start title list = zip (enumWithAbbrev start title) (map (Flat) list)

-- | formats constraints on variables for tables
fmtConstrain :: Sentence -> Sentence -> Sentence -> Sentence
fmtConstrain _ EmptyS EmptyS      = S "None"  
fmtConstrain symb constrA EmptyS  = symb +:+ constrA
fmtConstrain symb constrA constrB = symb +:+ constrA +:+ S "and" +:+ symb +:+ constrB

-- | formats numbers with units for tables
fmtUnit :: Sentence -> Sentence -> Sentence
fmtUnit num EmptyS = num
fmtUnit num units  = num +:+ units

-- | makes a list of sentences for constraint tables
mkConstraintList :: (Sentence, Sentence, Sentence, Sentence, Sentence) -> [Sentence]
mkConstraintList (symb, a, b, num, units) = [symb, fmtConstrain symb a b, fmtUnit num units]

-- | appends a sentence to the front of a list of list of sentences
zipSentList :: [[Sentence]] -> [Sentence] -> [[Sentence]] -> [[Sentence]] 
zipSentList acc _ []           = acc
zipSentList acc [] r           = acc ++ (map (EmptyS:) r)
zipSentList acc (x:xs) (y:ys)  = zipSentList (acc ++ [x:y]) xs ys

-- | traceability matrices row from a list of rows and a list of columns
zipFTable :: Eq a => [Sentence] -> [a] -> [a] -> [Sentence]
zipFTable acc _ []              = acc
zipFTable acc [] k              = acc ++ (take (length k) (repeat EmptyS))
zipFTable acc k@(x:xs) (y:ys)   | x == y    = zipFTable (acc++[S "X"]) xs ys
                                | otherwise = zipFTable (acc++[EmptyS]) k ys

-- | makes a traceability matrix from list of column rows and list of rows
makeTMatrix :: Eq a => [Sentence] -> [[a]] -> [a] -> [[Sentence]]
makeTMatrix colName col row = zipSentList [] colName [zipFTable [] x row | x <- col] 

-- | makes sentences from an item and its reference 
itemRefToSent :: String -> Sentence -> Sentence
itemRefToSent a b = S a +:+ sParen b

-- | refFromType takes a function and returns a reference sentence
refFromType :: (a -> DType) -> a -> Sentence
refFromType f = (makeRef . Definition . f)

-- | makeListRef takes a list and a reference and generates references to 
--   match the length of the list
makeListRef :: [a] -> Section -> [Sentence]
makeListRef l r = take (length l) $ repeat $ makeRef r

