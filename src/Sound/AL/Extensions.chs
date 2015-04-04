-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.Extensions where

import Control.Monad.Trans ( MonadIO(..) ) 
import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types

#include <al.h>

foreign import CALLCV "alIsExtensionPresent" alIsExtensionPresent_ :: Ptr ALubyte -> IO ALboolean
alIsExtensionPresent :: (MonadIO m) => Ptr ALubyte -> m ALboolean
alIsExtensionPresent = liftIO . alIsExtensionPresent

foreign import CALLCV "alGetProcAddress" alGetProcAddress_ :: Ptr ALubyte -> IO (Ptr ALvoid)
alGetProcAddress :: (MonadIO m) => Ptr ALubyte -> m (Ptr ALvoid)
alGetProcAddress = liftIO . alGetProcAddress_

foreign import CALLCV "alGetEnumValue" alGetEnumValue_ :: Ptr ALubyte -> IO ALenum
alGetEnumValue :: (MonadIO m) => Ptr ALubyte -> m ALenum
alGetEnumValue = liftIO . alGetEnumValue
