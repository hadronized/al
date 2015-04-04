-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.ALC.Context where

import Control.Monad.Trans ( MonadIO(..) )
import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types
import Sound.ALC.Types

foreign import CALLCV "alcCreateContext" alcCreateContext_ :: Ptr ALCdevice -> Ptr ALint -> IO (Ptr ALvoid)
alcCreateContext :: (MonadIO m) => Ptr ALCdevice -> Ptr ALint -> m (Ptr ALvoid)
alcCreateContext a b = liftIO $ alcCreateContext_ a b

foreign import CALLCV "alcMakeContextCurrent" alcMakeContextCurrent_ :: Ptr ALvoid -> IO ALCenum
alcMakeContextCurrent :: (MonadIO m) => Ptr ALvoid -> m ALCenum
alcMakeContextCurrent = liftIO . alcMakeContextCurrent_

foreign import CALLCV "alcProcessContext" alcProcessContext_ :: Ptr ALvoid -> IO ()
alcProcessContext :: (MonadIO m) => Ptr ALvoid -> m ()
alcProcessContext = liftIO . alcProcessContext_

foreign import CALLCV "alcSuspendContext" alcSuspendContext_ :: Ptr ALvoid -> IO ()
alcSuspendContext :: (MonadIO m) => Ptr ALvoid -> m ()
alcSuspendContext = liftIO . alcSuspendContext_

foreign import CALLCV "alcDestroyContext" alcDestroyContext_ :: Ptr ALvoid -> IO ALCenum
alcDestroyContext :: (MonadIO m) => Ptr ALvoid -> m ALCenum
alcDestroyContext = liftIO . alcDestroyContext_

foreign import CALLCV "alcGetCurrentContext" alcGetCurrentContext_ :: IO (Ptr ALvoid)
alcGetCurrentContext :: (MonadIO m) => m (Ptr ALvoid)
alcGetCurrentContext = liftIO alcGetCurrentContext_
