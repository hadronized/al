-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.ALC.Defines where

import Sound.ALC.Types

alc_FREQUENCY :: ALCenum
alc_FREQUENCY = {#const ALC_FREQUENCY #}

alc_REFRESH :: ALCenum
alc_REFRESH = {#const ALC_REFRESH #}

alc_SYNC :: ALCenum
alc_SYNC = {#const ALC_SYNC #}
