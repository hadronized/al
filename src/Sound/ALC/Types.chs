-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.ALC.Types where

import Sound.AL.Types

#include <alc.h>

type ALCdevice = {#type ALCdevice #}
type ALCenum = {#type ALCenum #}
