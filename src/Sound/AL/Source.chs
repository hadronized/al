-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.Source where

import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types

#include <al.h>

foreign import CALLCV "alGenSources" alGenSources :: ALsizei -> Ptr ALuint -> IO ()
foreign import CALLCV "alDeleteSources" alDeleteSources :: ALsizei -> Ptr ALuint -> IO ()
foreign import CALLCV "alIsSource" alIsSource :: ALuint -> IO ALboolean
foreign import CALLCV "alSourcef" alSourcef :: ALuint -> ALenum -> ALfloat -> IO ()
foreign import CALLCV "alSourcefv" alSourcefv :: ALuint -> ALenum -> Ptr ALfloat -> IO ()
foreign import CALLCV "alSource3f" alSource3f :: ALuint -> ALenum -> ALfloat -> ALfloat -> ALfloat -> IO ()
foreign import CALLCV "alSourcei" alSourcei :: ALuint -> ALenum -> ALint -> IO ()
foreign import CALLCV "alGetSourcef" alGetSourcef :: ALuint -> ALenum -> Ptr ALfloat -> IO ()
foreign import CALLCV "alGetSourcefv" alGetSourcefv :: ALuint -> ALenum -> Ptr ALfloat -> IO ()
foreign import CALLCV "alGetSourcei" alGetSourcei :: ALuint -> ALenum -> Ptr ALint -> IO ()
foreign import CALLCV "alSourcePlay" alSourcePlay :: ALuint -> IO ()
foreign import CALLCV "alSourcePlayv" alSourcePlayv :: ALsizei -> Ptr ALuint -> IO ()
foreign import CALLCV "alSourcePause" alSourcePause :: ALuint -> IO ()
foreign import CALLCV "alSourcePausev" alSourcePausev :: ALsizei -> Ptr ALuint -> IO ()
foreign import CALLCV "alSourceStop" alSourceStop :: ALuint -> IO ()
foreign import CALLCV "alSourceStopv" alSourceStopv :: ALsizei -> Ptr ALuint -> IO ()
foreign import CALLCV "alSourceRewind" alSourceRewind :: ALuint -> IO ()
foreign import CALLCV "alSourceRewindv" alSourceRewindv :: ALsizei -> Ptr ALuint -> IO ()
foreign import CALLCV "alSourceQueueBuffers" alSourceQueueBuffers :: ALuint -> ALsizei -> Ptr ALuint -> IO ()
foreign import CALLCV "alSourceUnqueueBuffers" alSourceUnqueueBuffers :: ALuint -> ALsizei -> Ptr ALuint -> IO ()
