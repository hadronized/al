-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.Listener where

import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types

#include <al.h>

foreign import CALLCV "alListenerf" alListenerf :: ALenum -> ALfloat -> IO ()
foreign import CALLCV "alListener3f" alListener3f :: ALenum -> ALfloat -> ALfloat -> ALfloat -> IO ()
foreign import CALLCV "alListenerfv" alListenerfv :: ALenum -> Ptr ALfloat -> IO ()
foreign import CALLCV "alListeneri" alListeneri :: ALenum -> ALint -> IO ()
foreign import CALLCV "alGetListenerf" alGetListenerf :: ALenum -> Ptr ALfloat -> IO ()
foreign import CALLCV "alGetListener3f" alGetListener3f :: ALenum -> Ptr ALfloat -> Ptr ALfloat -> Ptr ALfloat -> IO ()
foreign import CALLCV "alGetListenerfv" alGetListenerfv :: ALenum -> Ptr ALfloat -> IO ()
foreign import CALLCV "alGetListeneri" alGetListeneri :: ALenum -> Ptr ALint -> IO ()
