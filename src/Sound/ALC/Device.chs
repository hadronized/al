-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.ALC.Device where

import Control.Monad.Trans ( MonadIO(..) )
import Foreign.Ptr ( Ptr )
import Sound.AL.Types
import Sound.ALC.Types

foreign import CALLCV "alcOpenDevice" alcOpenDevice_ :: Ptr ALubyte -> IO (Ptr ALCdevice)
alcOpenDevice :: (MonadIO m) => Ptr ALubyte -> m (Ptr ALCdevice)
alcOpenDevice = liftIO . alcOpenDevice_

foreign import CALLCV "alcCloseDevice" alcCloseDevice_ :: Ptr ALCdevice -> IO ()
alcCloseDevice  :: (MonadIO m) => Ptr ALCdevice -> m ()
alcCloseDevice = liftIO . alcCloseDevice_
