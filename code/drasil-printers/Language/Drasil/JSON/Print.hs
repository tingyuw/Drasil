module Language.Drasil.JSON.Print(genJSON) where

import Prelude hiding (print, (<>))
import Text.PrettyPrint hiding (Str)
import Numeric (showEFloat)
import Utils.Drasil (checkValidStr)

import qualified Language.Drasil as L (DType(Data, Theory, Instance, General), MaxWidthPercent,
  Document, special)

import Language.Drasil.Printing.Import (makeDocument)
import Language.Drasil.Printing.AST (Spec, ItemType(Flat, Nested),  
  ListType(Ordered, Unordered, Definitions, Desc, Simple), Expr, 
  Expr(..), Spec(Quote, EmptyS, Ref, HARDNL, Sp, S, E, (:+:)),
  Spacing(Thin), Fonts(Bold, Emph), OverSymb(Hat), Label,
  LinkType(Internal, Cite2, External))
import Language.Drasil.Printing.Citation (BibRef)
import Language.Drasil.Printing.LayoutObj (Document(Document), LayoutObj(..))
import Language.Drasil.Printing.Helpers (sqbrac)
import Language.Drasil.Printing.PrintingInformation (PrintingInformation)

import qualified Language.Drasil.TeX.Print as TeX (spec, pExpr)
import Language.Drasil.TeX.Monad (runPrint, MathContext(Math), D, toMath, PrintLaTeX(PL))
import Language.Drasil.HTML.Monad (unPH)
import Language.Drasil.HTML.Helpers (th, em, bold, sub, sup, reflink, reflinkInfo, reflinkURI)
import Language.Drasil.HTML.Print(renderCite, OpenClose(Open, Close), pOps, fence)

import Language.Drasil.JSON.Helpers (makeMetadata, h, jf, formatter, stripnewLine,
 tr, td, image, li, pa, ba, ul, table, quote, refwrap)

genJSON :: PrintingInformation -> L.Document -> Doc
genJSON sm doc = build (makeDocument sm doc)

-- | Build the JSON Document, called by genJSON
build :: Document -> Doc
build (Document t a c) = 
  text "{" $$
  text " \"cells\": [" $$
  text "  {" $$
  text "   \"cell_type\": \"markdown\"," $$
  text "   \"metadata\": {}," $$
  text "   \"source\": [" $$
  quote (text "# " <> pSpec t) $$
  quote (text "## " <> pSpec a) $$
  print c $$
  text "    \"\\n\"" $$
  --text ("    \"" ++      
  --jf (join(conHTMLformat fn (Document t a c))) ++ "\"") $$
  text "   ]" $$
  text "  }" $$
  text " ]," $$
  makeMetadata $$
  text "}"

-- Helper for rendering a D from Latex print
printMath :: D -> Doc
printMath = (`runPrint` Math)

-- | Helper for rendering LayoutObjects into JSON
printLO :: LayoutObj -> Doc
printLO (Header n contents _)                 = quote empty $$ quote (h (n + 1) <> pSpec contents)
--printLO (HDiv _ layoutObs EmptyS)             = vcat (map printLO layoutObs)
printLO (HDiv _ layoutObs l)                 = refwrap (pSpec l) $ vcat (map printLO layoutObs)
printLO (Paragraph contents)                  = quote (stripnewLine (formatter (show(pSpec contents))))
printLO (EqnBlock contents)                   = quote (jf (show mathEqn))
  where
    toMathHelper (PL g) = PL (\_ -> g Math)
    mjDelimDisp d  = text "$" <> stripnewLine (show d) <> text "$" 
    mathEqn = mjDelimDisp $ printMath $ toMathHelper $ TeX.spec contents
printLO (Table _ rows r _ _)                  = quote empty $$ makeTable rows (pSpec r)
printLO (Definition dt ssPs l)                = quote (text "<br>") $$ makeDefn dt ssPs (pSpec l)
printLO (List t)                              = quote empty $$ makeList t False
printLO (Figure r c f wp)                     = makeFigure (pSpec r) (pSpec c) (text f) wp
printLO (Bib bib)                             = makeBib bib
printLO Graph{}                               = empty 

-- | Called by build, uses 'printLO' to render the layout
-- objects in Doc format.
print :: [LayoutObj] -> Doc
print = foldr (($$) . printLO) empty

pSpec :: Spec -> Doc
pSpec (E e)  = em $ pExpr e
pSpec (a :+: b) = pSpec a <> pSpec b
pSpec (S s)     = either error (text . concatMap escapeChars) $ checkValidStr s invalid
  where
    invalid = ['<', '>']
    escapeChars '&' = "\\&"
    escapeChars c = [c]
pSpec (Sp s)    = text $ unPH $ L.special s
pSpec HARDNL    = empty
pSpec (Ref Internal r a)      = reflink     r $ pSpec a
pSpec (Ref Cite2    r EmptyS) = reflink     r $ text r -- no difference for citations?
pSpec (Ref Cite2    r a)      = reflinkInfo r (text r) (pSpec a) -- no difference for citations?
pSpec (Ref External r a)      = reflinkURI  r $ pSpec a
pSpec EmptyS    = text "" -- Expected in the output
pSpec (Quote q) = doubleQuotes $ pSpec q


-- | Renders expressions in the HTML (called by multiple functions)
pExpr :: Expr -> Doc
pExpr (Dbl d)        = text $ showEFloat Nothing d ""
pExpr (Int i)        = text $ show i
pExpr (Str s)        = doubleQuotes $ text s
pExpr (Row l)        = hcat $ map pExpr l
pExpr (Ident s)      = text s
pExpr (Label s)      = text s
pExpr (Spec s)       = text $ unPH $ L.special s
pExpr (Sub e)        = sub $ pExpr e
pExpr (Sup e)        = sup $ pExpr e
pExpr (Over Hat s)   = pExpr s <> text "&#770;"
pExpr (MO o)         = text $ pOps o
pExpr (Fenced l r e) = text (fence Open l) <> pExpr e <> text (fence Close r)
pExpr (Font Bold e)  = bold $ pExpr e
pExpr (Font Emph e)  = text "<em>" <> pExpr e <> text "</em>" -- FIXME
pExpr (Spc Thin)     = text "&#8239;"
-- Uses TeX for Mathjax for all other exprs
pExpr e              = mjDelimDisp $ printMath $ toMath $ TeX.pExpr e
  where mjDelimDisp d = text "$" <> d <> text "$"


-- | Renders HTML table, called by 'printLO'
makeTable :: [[Spec]] -> Doc -> Doc
makeTable [] _      = error "No table to print"
makeTable (l:lls) r = refwrap r (table [] (tr (makeHeaderCols l) $$ makeRows lls)) $$ quote empty
--makeTable (l:lls) r b t = refwrap r $ quote empty $$ (makeHeaderCols l $$ makeRows lls) $$ quote empty
--if b then t else empty


-- | Helper for creating table rows
makeRows :: [[Spec]] -> Doc
makeRows = foldr (($$) . tr . makeColumns) empty

makeColumns, makeHeaderCols :: [Spec] -> Doc
-- | Helper for creating table header row (each of the column header cells)
makeHeaderCols = vcat . map (stripnewLine . show . quote . th . pSpec)
--makeHeaderCols = vcat . map (th . pSpec)

-- | Helper for creating table columns
makeColumns = vcat . map (td . quote . jf . show . pSpec)

{-
makeColumns, makeHeaderCols :: [Spec] -> Doc
-- | Helper for creating table header row (each of the column header cells)
makeHeaderCols l = quote (text $ header) $$ quote (text $ genMDtable ++ "|")
  where header = show(text "|" <> hcat(punctuate (text "|") (map pSpec l)) <> text "|")        
        c = count '|' header
        hl = ""
        genMDtable = concat [hl ++ "|--- " | i <- [1..c-1]]

-- | Helper for creating table columns
makeColumns ls = quote (text "|" <> hcat(punctuate (text "|") (map pSpec ls)) <> text "|")

count :: Char -> String -> Int
count c [] = 0
count c (x:xs) 
  | c == x = 1 + (count c xs)
  | otherwise = count c xs
-}

-- | Renders definition tables (Data, General, Theory, etc.)
makeDefn :: L.DType -> [(String,[LayoutObj])] -> Doc -> Doc
makeDefn _ [] _  = error "L.Empty definition"
makeDefn dt ps l = refwrap l $ table [dtag dt]
  (tr (quote (th (text "Refname")) $$ td (quote(bold l))) $$ makeDRows ps)
  where dtag L.General  = "gdefn"
        dtag L.Instance = "idefn"
        dtag L.Theory   = "tdefn"
        dtag L.Data     = "ddefn"

-- | Helper for making the definition table rows
makeDRows :: [(String,[LayoutObj])] -> Doc
makeDRows []         = error "No fields to create defn table"
makeDRows [(f,d)] = tr (quote (th (text f)) $$ td (vcat $ map printLO d))
makeDRows ((f,d):ps) = tr (quote (th (text f)) $$ td (vcat $ map printLO d)) $$ makeDRows ps

-- | Renders lists
makeList :: ListType -> Bool -> Doc -- FIXME: ref id's should be folded into the li
makeList (Simple items) _      = vcat $ 
  map (\(b,e,l) -> mlref l $ (quote $ pSpec b <> text ": " <> sItem e) $$ quote empty) items
makeList (Desc items) bl       = vcat $ 
  map (\(b,e,l) -> pa $ mlref l $ ba $ pSpec b <> text ": " <> pItem e bl) items
makeList (Ordered items) bl    = vcat $ map (\(i,l) -> mlref l $ pItem i bl) items
makeList (Unordered items) bl  = vcat $ map (\(i,l) -> mlref l $ pItem i bl) items
makeList (Definitions items) _ = ul ["hide-list-style-no-indent"] $ vcat $ 
  map (\(b,e,l) -> li $ mlref l $ quote(pSpec b <> text " is the" <+> sItem e)) items

-- | Helper for setting up references
mlref :: Maybe Label -> Doc -> Doc
mlref = maybe id $ refwrap . pSpec

-- | Helper for rendering list items
pItem :: ItemType ->  Bool -> Doc
pItem (Flat s)     b = quote $ (if b then text " - " else text "- ") <> pSpec s
pItem (Nested s l) _ = vcat [quote $ text "- " <> pSpec s, makeList l True]
  --where listIndent = strBreak "\"" (show $ makeList l)
--indent <> text "\"- " <> pSpec s <> text "\\n\","

sItem :: ItemType -> Doc
sItem (Flat s)     = jf (show (pSpec s)) 
sItem (Nested s l) = vcat [pSpec s, makeList l False]

-- | Renders figures in HTML
makeFigure :: Doc -> Doc -> Doc -> L.MaxWidthPercent -> Doc
makeFigure r c f wp = refwrap r (image f c wp)

-- | Renders assumptions, requirements, likely changes
makeRefList :: Doc -> Doc -> Doc -> Doc
makeRefList a l i = refwrap l $ quote $ jf $ show (i <> text ": " <> a)

makeBib :: BibRef -> Doc
makeBib = vcat .
  zipWith (curry (\(x,(y,z)) -> makeRefList z y x))
  [text $ sqbrac $ show x | x <- [1..] :: [Int]] . map renderCite


