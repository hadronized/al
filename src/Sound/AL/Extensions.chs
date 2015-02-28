-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.Extensions where

import Sound.AL.Types

#include <al.h>

foreign import CALLCV "alIsExtensionPresent" alIsExtensionPresent :: Ptr ALubyte -> IO ALboolean
foreign import CALLCV "alGetProcAddress" alGetProcAddress :: Ptr ALubyte -> IO (Ptr ()) -- TODO: not sure about Ptr (); should this be FunPtr?
foreign import CALLCV "alGetEnumValue" alGetEnumValue :: Ptr ALubyte -> IO ALenum
