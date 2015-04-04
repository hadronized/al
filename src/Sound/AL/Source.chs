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

import Control.Monad.Trans ( MonadIO(..) )
import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types

#include <al.h>

foreign import CALLCV "alGenSources" alGenSources_ :: ALsizei -> Ptr ALuint -> IO ()
alGenSources :: (MonadIO m) => ALsizei -> Ptr ALuint -> m ()
alGenSources a b = liftIO $ alGenSources_ a b

foreign import CALLCV "alDeleteSources" alDeleteSources_ :: ALsizei -> Ptr ALuint -> IO ()
alDeleteSources :: (MonadIO m) => ALsizei -> Ptr ALuint -> m ()
alDeleteSources a b = liftIO $ alDeleteSources_ a b

foreign import CALLCV "alIsSource" alIsSource_ :: ALuint -> IO ALboolean
alIsSource :: (MonadIO m) => ALuint -> m ALboolean
alIsSource = liftIO . alIsSource_

foreign import CALLCV "alSourcef" alSourcef_ :: ALuint -> ALenum -> ALfloat -> IO ()
alSourcef :: (MonadIO m) => ALuint -> ALenum -> ALfloat -> m ()
alSourcef a b c = liftIO $ alSourcef_ a b c

foreign import CALLCV "alSourcefv" alSourcefv_ :: ALuint -> ALenum -> Ptr ALfloat -> IO ()
alSourcefv :: (MonadIO m) => ALuint -> ALenum -> Ptr ALfloat -> m ()
alSourcefv a b c = liftIO $ alSourcefv_ a b c

foreign import CALLCV "alSource3f" alSource3f_ :: ALuint -> ALenum -> ALfloat -> ALfloat -> ALfloat -> IO ()
alSource3f :: (MonadIO m) => ALuint -> ALenum -> ALfloat -> ALfloat -> ALfloat -> m ()
alSource3f a b c d e = liftIO $ alSource3f_ a b c d e

foreign import CALLCV "alSourcei" alSourcei_ :: ALuint -> ALenum -> ALint -> IO ()
alSourcei :: (MonadIO m) => ALuint -> ALenum -> ALint -> m ()
alSourcei a b c = liftIO $ alSourcei_ a b c

foreign import CALLCV "alGetSourcef" alGetSourcef_ :: ALuint -> ALenum -> Ptr ALfloat -> IO ()
alGetSourcef :: (MonadIO m) => ALuint -> ALenum -> Ptr ALfloat -> m ()
alGetSourcef a b c = liftIO $ alGetSourcef_ a b c

foreign import CALLCV "alGetSourcefv" alGetSourcefv_ :: ALuint -> ALenum -> Ptr ALfloat -> IO ()
alGetSourcefv :: (MonadIO m) => ALuint -> ALenum -> Ptr ALfloat -> m ()
alGetSourcefv a b c = liftIO $ alGetSourcefv_ a b c

foreign import CALLCV "alGetSourcei" alGetSourcei_ :: ALuint -> ALenum -> Ptr ALint -> IO ()
alGetSourcei :: (MonadIO m) => ALuint -> ALenum -> Ptr ALint -> m ()
alGetSourcei a b c = liftIO $ alGetSourcei_ a b c

foreign import CALLCV "alSourcePlay" alSourcePlay_ :: ALuint -> IO ()
alSourcePlay :: (MonadIO m) => ALuint -> m ()
alSourcePlay = liftIO . alSourcePlay_

foreign import CALLCV "alSourcePlayv" alSourcePlayv_ :: ALsizei -> Ptr ALuint -> IO ()
alSourcePlayv :: (MonadIO m) => ALsizei -> Ptr ALuint -> m ()
alSourcePlayv a b = liftIO $ alSourcePlayv_ a b

foreign import CALLCV "alSourcePause" alSourcePause_ :: ALuint -> IO ()
alSourcePause :: (MonadIO m) => ALuint -> m ()
alSourcePause = liftIO . alSourcePause_

foreign import CALLCV "alSourcePausev" alSourcePausev_ :: ALsizei -> Ptr ALuint -> IO ()
alSourcePausev :: (MonadIO m) => ALsizei -> Ptr ALuint -> m ()
alSourcePausev a b = liftIO $ alSourcePausev_ a b

foreign import CALLCV "alSourceStop" alSourceStop_ :: ALuint -> IO ()
alSourceStop :: (MonadIO m) => ALuint -> m ()
alSourceStop = liftIO . alSourceStop_

foreign import CALLCV "alSourceStopv" alSourceStopv_ :: ALsizei -> Ptr ALuint -> IO ()
alSourceStopv :: (MonadIO m) => ALsizei -> Ptr ALuint -> m ()
alSourceStopv a b = liftIO $ alSourceStopv_ a b

foreign import CALLCV "alSourceRewind" alSourceRewind_ :: ALuint -> IO ()
alSourceRewind :: (MonadIO m) => ALuint -> m ()
alSourceRewind = liftIO . alSourceRewind_

foreign import CALLCV "alSourceRewindv" alSourceRewindv_ :: ALsizei -> Ptr ALuint -> IO ()
alSourceRewindv :: (MonadIO m) => ALsizei -> Ptr ALuint -> m ()
alSourceRewindv a b = liftIO $ alSourceRewindv_ a b

foreign import CALLCV "alSourceQueueBuffers" alSourceQueueBuffers_ :: ALuint -> ALsizei -> Ptr ALuint -> IO ()
alSourceQueueBuffers :: (MonadIO m) => ALuint -> ALsizei -> Ptr ALuint -> m ()
alSourceQueueBuffers a b c = liftIO $ alSourceQueueBuffers_ a b c

foreign import CALLCV "alSourceUnqueueBuffers" alSourceUnqueueBuffers_ :: ALuint -> ALsizei -> Ptr ALuint -> IO ()
alSourceUnqueueBuffers :: (MonadIO m) => ALuint -> ALsizei -> Ptr ALuint -> m ()
alSourceUnqueueBuffers a b c = liftIO $ alSourceUnqueueBuffers a b c
