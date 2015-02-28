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

import Foreign.C.Types
import Foreign.Ptr ( Ptr )
import Sound.AL.Types
import Sound.ALC.Types

foreign import CALLCV "alcGetString" alcGetString :: Ptr ALCdevice -> ALenum -> IO (Ptr ALubyte)
foreign import CALLCV "alcGetIntegerv" alcGetIntegerv :: Ptr ALCdevice -> ALenum -> ALsizei -> Ptr ALint -> IO ()
