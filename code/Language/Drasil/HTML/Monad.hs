module Language.Drasil.HTML.Monad where

import Language.Drasil.Unicode

-----------------------------------------------------------------------------
-- | Printing "monad".  Don't need context, so Identity (under another name)
-- will do just fine.

newtype PrintHTML = PH {unPH :: String}

instance RenderGreek PrintHTML where
 
  greek Chi_L     = PH "&chi"
  greek Chi       = PH "&Chi"
  greek Ell       = PH "&#8467;"
  greek Nabla     = PH "&nabla;"
  greek Omega_L   = PH "&omega;"
  greek Omega     = PH "&Omega;"
  greek Omicron   = PH "&Omicron;"
  greek Pi_L      = PH "&pi;"
  greek Pi        = PH "&Pi;"
  greek Phi_L     = PH "&phi;"
  greek Phi_V     = PH "&phiv;"
  greek Phi       = PH "&Phi;"
  greek Psi_L     = PH "&psi;"
  greek Psi       = PH "&Psi;"
  greek Rho_L     = PH "&rho;"
  greek Rho       = PH "&Rho;"
  greek Sigma_L   = PH "&sigma;"
  greek Sigma     = PH "&Sigma;"
  greek Tau_L     = PH "&tau;"
  greek Tau       = PH "&Tau;"
  greek Upsilon_L = PH "&upsilon;"
  greek Upsilon   = PH "&Upsilon;"
  
  
instance RenderSpecial PrintHTML where
  special Circle       = PH "&deg;"
  special Partial      = PH "&part;"
  special UScore       = PH "_"
  special Percent      = PH "%"
  special Hash         = PH "#"
  special CurlyBrOpen  = PH "{"
  special CurlyBrClose = PH "}"
  special SqBrOpen     = PH "["
  special SqBrClose    = PH "]"
