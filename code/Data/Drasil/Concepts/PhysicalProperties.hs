module Data.Drasil.Concepts.PhysicalProperties where

import Language.Drasil

gaseous, liquid, solid, ctrOfMass, mass, length :: NamedChunk

gaseous = makeCC "Gas" "gaseous state"
liquid  = makeCC "Liquid" "liquid state"
solid   = makeCC "Solid" "solid state"

ctrOfMass = makeCC "centre of mass" 
  "The mean location of the distribution of mass of the object."

mass = nCC "mass"
length = nCC "length"