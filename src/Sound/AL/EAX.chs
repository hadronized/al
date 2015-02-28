-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.EAX
    {-# WARNING "EAXGet is not implemented yet! #-}
    {-# WARNING "EAXSet is not implemented yet! #-}
  where

import Sound.AL.Types

#include <al.h>
#include <alc.h>
