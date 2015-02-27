-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.Buffer where

import Sound.AL.Types

#include <al.h>
#include <alc.h>

foreign import CALLCV "alGenBuffers" alGenBuffers :: ALsizei -> Ptr ALuint -> IO ()
foreign import CALLCV "alDeleteBuffers" alDeleteBuffers :: ALsizei -> Ptr ALuint -> IO ()
foreign import CALLCV "alIsBuffer" alIsBuffer :: ALuint -> IO ALboolean
foreign import CALLCV "alBufferData" alBufferData :: ALuint -> ALenum -> Ptr a -> ALsizei -> ALsizei -> IO ()
foreign import CALLCV "alGetBufferf" alGetBufferf :: ALuint -> ALenum -> Ptr ALfloat -> IO ()
foreign import CALLCV "alGetBufferi" alGetBufferi :: ALuint -> ALenum -> Ptr ALint -> IO ()
