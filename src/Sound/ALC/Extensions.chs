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

import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types
import Sound.ALC.Types

foreign import CALLCV "alcIsExtensionSupported" alcIsExtensionSupported :: Ptr ALCdevice -> Ptr ALubyte -> IO ALboolean
foreign import CALLCV "alcGetProcAddress" alcGetProcAddress :: Ptr ALCdevice -> Ptr ALubyte -> IO (Ptr ALvoid)
foreign import CALLCV "alcGetEnumValue" alcGetEnumValue :: Ptr ALCdevice -> Ptr ALubyte -> IO ALenum
