module Language.Drasil.Markdown.CreateMd (
    makeMd, introInfo, verInfo, invalidOS, extLibSec, regularSec, contSep, 
    instDoc, filtEmp) 
    where

import Data.List (filter)
import Prelude hiding ((<>))
import Text.PrettyPrint.HughesPJ (Doc, empty, isEmpty, vcat, text, (<+>),
    (<>), comma, punctuate, doubleQuotes, hsep)

type Seperator = Doc


makeMd :: [Doc] -> Doc
makeMd lst = (vcat . punctuate secSep . filtEmp) lst <> contSep <>
    doubleSep <> endNote 

-- Example title and purpose section
introInfo :: String -> [String] -> Doc
introInfo name auths = introSec (text name) (listToDoc auths) 
    (text "__purpose__")

-- Instruction section, if the example contains 2 
instDoc :: [String] -> Doc
instDoc cfp = regularSec (text "Making Examples") 
    (runInstDoc <> doubleSep <> makeInstDoc) <> configSec cfp 

commandLine :: Doc
commandLine = text $ "In your terminal command line, enter the same directory as this " ++
    "README file. Then enter the following line"

runInstDoc :: Doc
runInstDoc = text "How to Run the Program:" <> contSep <>
    commandLine <> contSep <> text "`make run RUNARGS=input.txt`"

makeInstDoc :: Doc
makeInstDoc = text "How to Build the Program:" <> contSep <> commandLine <> contSep <>
    text "`make build`"

configSec :: [String] -> Doc
configSec [] = empty
configSec cfp = doubleSep <> regularSec (text "Configuration Files") (listToDoc cfp <> contSep <>
    text "(Configuration files are files that must be in same directory as the executable in order to run or build successfully)")

-- Language version section
verInfo :: String -> String -> Doc
verInfo pl plv = regularSec (text "Versioning") (text $ pl ++ " Version: " ++ plv)

-- Invalid Operating Systems section
invalidOS :: Maybe String -> Doc
invalidOS Nothing = empty
invalidOS (Just unsuppOS) = regularSec (text "Unsupported Operating Systems")
    (text $ "- " ++ unsuppOS)

-- extLibSec (External Libraries)

extLibSec:: [(String, String)] -> [String]-> Doc
extLibSec libns libfps = 
    let libs = addListToTuple libns libfps
        formattedLibs = (vcat . punctuate contSep . filtEmp . 
            map libStatment) libs
    in if isEmpty formattedLibs then empty else 
            regularSec (text "External Libraries") formattedLibs

libStatment :: (String, String, String) -> Doc
libStatment ("","", _) = empty
libStatment (nam,vers, fp) = (doubleQuotes . text) nam <+> text "version" 
    <+> text vers <+> if fp == "" then empty else
    text ", local file path to the library" <+> (doubleQuotes . text) fp

addListToTuple :: [(String,String)] -> [String] -> [(String, String, String)]
addListToTuple [] [] = []
addListToTuple ((n,v):_) [] = [(n,v,"")]
addListToTuple ((n,v):xtup) (l:xlst) = (n,v,l):addListToTuple xtup xlst
addListToTuple _ _ = []

-- End section TODO add license and logo
endNote :: Doc
endNote = text "*This README is a software artifact generated by Drasil."

-- Section seperators
secSep, contSep, doubleSep :: Seperator
secSep = text "\n------------------------------------------------------------"
contSep = text "\n"
doubleSep = text "\n\n"

-- Functions to construct section from header and message
introSec ::  Doc -> Doc -> Doc -> Doc
introSec hd ms1 ms2 = text "#" <+> hd <+> contSep <> text "> Authors: "<+> ms1 <+> 
    contSep <+> text "> " <+> ms2

regularSec :: Doc -> Doc -> Doc
regularSec hd ms = text "**" <> hd <> text ":**" <+> contSep <+> ms

-- Helper for makeMd and extLibSec
filtEmp :: [Doc] -> [Doc]
filtEmp = filter (not . isEmpty) 

-- Helper for authors and configuration files
listToDoc :: [String] -> Doc
listToDoc = hsep . punctuate comma . map text