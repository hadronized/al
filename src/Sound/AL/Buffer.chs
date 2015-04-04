-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.Buffer (
    alGenBuffers
  , alDeleteBuffers
  , alIsBuffer
  , alBufferData
  , alGetBufferf
  , alGetBufferi
  ) where

import Control.Monad.Trans ( MonadIO(..) )
import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types

#include <al.h>

foreign import CALLCV "alGenBuffers" alGenBuffers_ :: ALsizei -> Ptr ALuint -> IO ()
alGenBuffers :: (MonadIO m) => ALsizei -> Ptr ALuint -> m ()
alGenBuffers a b = liftIO $ alGenBuffers_ a b

foreign import CALLCV "alDeleteBuffers" alDeleteBuffers_ :: ALsizei -> Ptr ALuint -> IO ()
alDeleteBuffers :: (MonadIO m) => ALsizei -> Ptr ALuint -> m ()
alDeleteBuffers a b = liftIO $ alDeleteBuffers_ a b

foreign import CALLCV "alIsBuffer" alIsBuffer_ :: ALuint -> IO ALboolean
alIsBuffer :: (MonadIO m) => ALuint -> m ALboolean
alIsBuffer = liftIO . alIsBuffer_

foreign import CALLCV "alBufferData" alBufferData_ :: ALuint -> ALenum -> Ptr a -> ALsizei -> ALsizei -> IO ()
alBufferData :: (MonadIO m) => ALuint -> ALenum -> Ptr a -> ALsizei -> ALsizei -> m ()
alBufferData a b c d e = liftIO $ alBufferData_ a b c d e

foreign import CALLCV "alGetBufferf" alGetBufferf_ :: ALuint -> ALenum -> Ptr ALfloat -> IO ()
alGetBufferf :: (MonadIO m) => ALuint -> ALenum -> Ptr ALfloat -> m ()
alGetBufferf a b c = liftIO $ alGetBufferf_ a b c

foreign import CALLCV "alGetBufferi" alGetBufferi_ :: ALuint -> ALenum -> Ptr ALint -> IO ()
alGetBufferi :: (MonadIO m) => ALuint -> ALenum -> Ptr ALint -> m ()
alGetBufferi a b c = liftIO $ alGetBufferi_ a b c
