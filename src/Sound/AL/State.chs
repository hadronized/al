-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.State where

import Sound.AL.Types

#include <al.h>
#include <alc.h>

foreign import CALLCV "alEnable" alEnable :: ALenum -> IO ()
foreign import CALLCV "alDisable" alDisable :: ALenum -> IO ()
foreign import CALLCV "alIsEnabled" alIsEnabled :: ALenum -> IO ALboolean
foreign import CALLCV "alGetBoolean" alGetBoolean :: ALenum -> IO ALboolean
foreign import CALLCV "alGetDouble" alGetDouble :: ALenum -> IO ALdouble
foreign import CALLCV "alGetFloat" alGetFloat :: ALenum -> IO ALfloat
foreign import CALLCV "alGetInteger" alGetInteger :: ALenum -> IO ALint
foreign import CALLCV "alGetBooleanv" alGetBooleanv :: ALenum -> Ptr ALboolean -> IO ()
foreign import CALLCV "alGetDoublev" alGetDoublev :: ALenum -> Ptr ALdouble -> IO ()
foreign import CALLCV "alGetFloatv" alGetFloatv :: ALenum -> Ptr ALfloat -> IO ()
foreign import CALLCV "alGetIntegerv" alGetIntegerv :: ALenum -> Ptr ALint -> IO ()
foreign import CALLCV "alGetString" alGetString :: ALenum -> Ptr ALubyte
foreign import CALLCV "alDistanceModel" alDistanceModel :: ALenum -> IO ()
foreign import CALLCV "alDopplerFactor" alDopplerFactor :: ALfloat -> IO ()
foreign import CALLCV "alDopplerVelocity" alDopplerVelocity :: ALfloat -> IO ()
