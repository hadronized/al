-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.ALC.Errors where

import Foreign.C.Types
import Sound.ALC.Types

foreign import CALLCV "alcGetError" alcGetError :: IO ALCenum
