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

import Control.Monad.Trans ( MonadIO(..) ) 
import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types

#include <al.h>

foreign import CALLCV "alEnable" alEnable_ :: ALenum -> IO ()
alEnable :: (MonadIO m) => ALenum -> m ()
alEnable = liftIO . alEnable_

foreign import CALLCV "alDisable" alDisable_ :: ALenum -> IO ()
alDisable :: (MonadIO m) => ALenum -> m ()
alDisable = liftIO . alDisable_

foreign import CALLCV "alIsEnabled" alIsEnabled_ :: ALenum -> IO ALboolean
alIsEnabled :: (MonadIO m) => ALenum -> m ALboolean
alIsEnabled = liftIO . alIsEnabled_

foreign import CALLCV "alGetBoolean" alGetBoolean_ :: ALenum -> IO ALboolean
alGetBoolean :: (MonadIO m) => ALenum -> m ALboolean
alGetBoolean = liftIO . alGetBoolean_

foreign import CALLCV "alGetDouble" alGetDouble_ :: ALenum -> IO ALdouble
alGetDouble :: (MonadIO m) => ALenum -> m ALdouble
alGetDouble = liftIO . alGetDouble_

foreign import CALLCV "alGetFloat" alGetFloat_ :: ALenum -> IO ALfloat
alGetFloat :: (MonadIO m) => ALenum -> m ALfloat
alGetFloat = liftIO . alGetFloat_

foreign import CALLCV "alGetInteger" alGetInteger_ :: ALenum -> IO ALint
alGetInteger :: (MonadIO m) => ALenum -> m ALint
alGetInteger = liftIO . alGetInteger_

foreign import CALLCV "alGetBooleanv" alGetBooleanv_ :: ALenum -> Ptr ALboolean -> IO ()
alGetBooleanv :: (MonadIO m) => ALenum -> Ptr ALboolean -> m ()
alGetBooleanv a b = liftIO $ alGetBooleanv_ a b

foreign import CALLCV "alGetDoublev" alGetDoublev_ :: ALenum -> Ptr ALdouble -> IO ()
alGetDoublev :: (MonadIO m) => ALenum -> Ptr ALdouble -> m ()
alGetDoublev a b = liftIO $ alGetDoublev_ a b

foreign import CALLCV "alGetFloatv" alGetFloatv_ :: ALenum -> Ptr ALfloat -> IO ()
alGetFloatv :: (MonadIO m) => ALenum -> Ptr ALfloat -> m ()
alGetFloatv a b = liftIO $ alGetFloatv_ a b

foreign import CALLCV "alGetIntegerv" alGetIntegerv_ :: ALenum -> Ptr ALint -> IO ()
alGetIntegerv :: (MonadIO m) => ALenum -> Ptr ALint -> m ()
alGetIntegerv a b = liftIO $ alGetIntegerv_ a b

foreign import CALLCV "alGetString" alGetString_ :: ALenum -> IO (Ptr ALubyte)
alGetString :: (MonadIO m) => ALenum -> m (Ptr ALubyte)
alGetString = liftIO . alGetString_

foreign import CALLCV "alDistanceModel" alDistanceModel_ :: ALenum -> IO ()
alDistanceModel :: (MonadIO m) => ALenum -> m ()
alDistanceModel = liftIO . alDistanceModel_

foreign import CALLCV "alDopplerFactor" alDopplerFactor_ :: ALfloat -> IO ()
alDopplerFactor :: (MonadIO m) => ALfloat -> m ()
alDopplerFactor = liftIO . alDopplerFactor_

foreign import CALLCV "alDopplerVelocity" alDopplerVelocity_ :: ALfloat -> IO ()
alDopplerVelocity :: (MonadIO m) => ALfloat -> m ()
alDopplerVelocity = liftIO . alDopplerVelocity_
