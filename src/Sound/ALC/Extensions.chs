-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.ALC.Extensions where

import Control.Monad.Trans ( MonadIO(..) )
import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types
import Sound.ALC.Types

foreign import CALLCV "alcIsExtensionPresent" alcIsExtensionPresent_ :: Ptr ALCdevice -> Ptr ALubyte -> IO ALboolean
alcIsExtensionPresent :: (MonadIO m) => Ptr ALCdevice -> Ptr ALubyte -> m ALboolean
alcIsExtensionPresent a b = liftIO $ alcIsExtensionPresent_ a b

foreign import CALLCV "alcGetProcAddress" alcGetProcAddress_ :: Ptr ALCdevice -> Ptr ALubyte -> IO (Ptr ALvoid)
alcGetProcAddress :: (MonadIO m) => Ptr ALCdevice -> Ptr ALubyte -> m (Ptr ALvoid)
alcGetProcAddress a b = liftIO $ alcGetProcAddress_ a b

foreign import CALLCV "alcGetEnumValue" alcGetEnumValue_ :: Ptr ALCdevice -> Ptr ALubyte -> IO ALenum
alcGetEnumValue :: (MonadIO m) => Ptr ALCdevice -> Ptr ALubyte -> m ALenum
alcGetEnumValue a b = liftIO $ alcGetEnumValue_ a b
