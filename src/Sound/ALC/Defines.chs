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

alc_DEFAULT_DEVICE_SPECIFIER :: ALCenum
alc_DEFAULT_DEVICE_SPECIFIER = {#const ALC_DEFAULT_DEVICE_SPECIFIER #}

alc_ALL_ATTRIBUTES :: ALCenum
alc_ALL_ATTRIBUTES = {#const ALC_ALL_ATTRIBUTES #}

alc_ATTRIBUTES_SIZE :: ALCenum
alc_ATTRIBUTES_SIZE = {#const ALC_ATTRIBUTES_SIZE $}

alc_DEVICE_SPECIFIER :: ALCenum
alc_DEVICE_SPECIFIER = {#const ALC_DEVICE_SPECIFIER #}

alc_EXTENSIONS :: ALCenum
alc_EXTENSIONS = {#const ALC_EXTENSIONS #}

alc_FREQUENCY :: ALCenum
alc_FREQUENCY = {#const ALC_FREQUENCY #}

alc_MAJOR_VERSION :: ALCenum
alc_MAJOR_VERSION = {#const ALC_MAJOR_VERSION #}

alc_MINOR_VERSION :: ALCenum
alc_MINOR_VERSION = {#const ALC_MINOR_VERSION #}

alc_REFRESH :: ALCenum
alc_REFRESH = {#const ALC_REFRESH #}

alc_SYNC :: ALCenum
alc_SYNC = {#const ALC_SYNC #}
