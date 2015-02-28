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

import Sound.AL.Types
import Sound.ALC.Types

foreign import CALLCV "alcCreateContext" alcCreateContext :: Ptr ALCdevice -> Ptr ALint -> IO (Ptr ()) -- TODO: not sure about the Ptr ()
foreign import CALLCV "alcMakeContextCurrent" alcMakeContextCurrent :: Ptr ALvoid -> IO ALCenum
foreign import CALLCV "alcProcessContext" alcProcessContext :: Ptr ALvoid -> IO ()
foreign import CALLCV "alcSuspendContext" alcSuspendContext :: Ptr ALvoid -> IO ()
foreign import CALLCV "alcDestroyContext" alcDestroyContext :: Ptr ALvoid -> IO ALCenum
