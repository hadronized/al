-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.Errors where

import Control.Monad.Trans ( MonadIO(..) )
import Foreign.C.Types
import Sound.AL.Types

#include <al.h>

foreign import CALLCV "alGetError" alGetError_ :: IO ALenum
alGetError :: (MonadIO m) => m ALenum
alGetError = liftIO alGetError_
