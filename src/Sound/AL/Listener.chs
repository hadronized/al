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

import Control.Monad.Trans ( MonadIO(..) )
import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types

#include <al.h>

foreign import CALLCV "alListenerf" alListenerf_ :: ALenum -> ALfloat -> IO ()
alListenerf :: (MonadIO m) => ALenum -> ALfloat -> m ()
alListenerf a b = liftIO $ alListenerf_ a b

foreign import CALLCV "alListener3f" alListener3f_ :: ALenum -> ALfloat -> ALfloat -> ALfloat -> IO ()
alListener3f :: (MonadIO m) => ALenum -> ALfloat -> ALfloat -> ALfloat -> m ()
alListener3f a b c d = liftIO $ alListener3f_ a b c d

foreign import CALLCV "alListenerfv" alListenerfv_ :: ALenum -> Ptr ALfloat -> IO ()
alListenerfv :: (MonadIO m) => ALenum -> Ptr ALfloat -> m ()
alListenerfv a b = liftIO $ alListenerfv_ a b

foreign import CALLCV "alListeneri" alListeneri_ :: ALenum -> ALint -> IO ()
alListeneri :: (MonadIO m) => ALenum -> ALint -> m ()
alListeneri a b = liftIO $ alListeneri_ a b

foreign import CALLCV "alGetListenerf" alGetListenerf_ :: ALenum -> Ptr ALfloat -> IO ()
alGetListenerf :: (MonadIO m) => ALenum -> Ptr ALfloat -> m ()
alGetListenerf a b = liftIO $ alGetListenerf_ a b

foreign import CALLCV "alGetListener3f" alGetListener3f_ :: ALenum -> Ptr ALfloat -> Ptr ALfloat -> Ptr ALfloat -> IO ()
alGetListener3f :: (MonadIO m) => ALenum -> Ptr ALfloat -> Ptr ALfloat -> Ptr ALfloat -> m ()
alGetListener3f a b c d = liftIO $ alGetListener3f_ a b c d

foreign import CALLCV "alGetListenerfv" alGetListenerfv_ :: ALenum -> Ptr ALfloat -> IO ()
alGetListenerfv :: (MonadIO m) => ALenum -> Ptr ALfloat -> m ()
alGetListenerfv a b = liftIO $ alGetListenerfv_ a b

foreign import CALLCV "alGetListeneri" alGetListeneri_ :: ALenum -> Ptr ALint -> IO ()
alGetListeneri :: (MonadIO m) => ALenum -> Ptr ALint -> m ()
alGetListeneri a b = liftIO $ alGetListeneri_ a b
