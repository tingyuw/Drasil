module Drasil.Truss.References where

import Language.Drasil

citations :: BibRef
citations = [mofjWiki, momentWiki]

mofjWiki, momentWiki :: Citation

mofjWiki = cMisc [author [mononym "Wikipedia Contributors"],
  title "MethodofJoint", howPublishedU "https://en.wikibooks.org/wiki/Statics/Method_of_Joints",
  month Dec, year 2019]
  "mofjWiki"

momentWiki = cMisc [author [mononym "Wikipedia Contributors"],
  title "Moment", howPublishedU "https://simple.wikipedia.org/wiki/Moment_(physics)",
  month Dec, year 2019]
  "momentWiki"

