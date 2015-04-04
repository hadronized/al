-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.ALC.State where

import Control.Monad.Trans ( MonadIO(..) ) 
import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types
import Sound.ALC.Types

foreign import CALLCV "alcGetString" alcGetString_ :: Ptr ALCdevice -> ALenum -> IO (Ptr ALubyte)
alcGetString :: (MonadIO m) => Ptr ALCdevice -> ALenum -> m (Ptr ALubyte)
alcGetString a b = liftIO $ alcGetString_ a b

foreign import CALLCV "alcGetIntegerv" alcGetIntegerv_ :: Ptr ALCdevice -> ALenum -> ALsizei -> Ptr ALint -> IO ()
alcGetIntegerv :: (MonadIO m) => Ptr ALCdevice -> ALenum -> ALsizei -> Ptr ALint -> m ()
alcGetIntegerv a b c d = liftIO $ alcGetIntegerv_ a b c d
