-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.Types where

import Foreign.C.Types

#include <al.h>

type ALboolean = {#type ALboolean #}
type ALchar = {#type ALchar #}
type ALbyte = {#type ALbyte #}
type ALubyte = {#type ALubyte #}
type ALshort = {#type ALshort #}
type ALushort = {#type ALushort #}
type ALint = {#type ALint #}
type ALuint = {#type ALuint #}
type ALsizei = {#type ALsizei #}
type ALenum = {#type ALenum #}
type ALfloat = {#type ALfloat #}
type ALdouble = {#type ALdouble #}
type ALvoid = {#type ALvoid #}
