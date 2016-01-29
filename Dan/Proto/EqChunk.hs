{-# OPTIONS -Wall #-} 
module EqChunk(EqChunk(..), fromEqn) where

import ASTInternal (Expr)
import Chunk
import UnitalChunk
import Control.Lens (Simple, Lens)
import Unit (Unit(..))
import Symbol (Symbol)

data EqChunk = EC 
  { uc :: UnitalChunk
  , equat :: Expr
  }

-- don't export this
ul :: Simple Lens EqChunk UnitalChunk
ul f (EC a b) = fmap (\x -> EC x b) (f a)

-- this works because UnitalChunk is a Chunk
instance Chunk EqChunk where
  name = ul . name

instance Concept EqChunk where
  descr = ul . descr

instance Quantity EqChunk where
  symbol = ul . symbol

instance Unit EqChunk where
  unit = ul . unit

-- useful
fromEqn :: Unit u => String -> String -> Symbol -> u -> Expr -> EqChunk
fromEqn nm desc symb chunk eqn = EC (UC (VC nm desc symb) chunk) eqn
