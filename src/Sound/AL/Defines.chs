-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

module Sound.AL.Defines where

import Sound.AL.Types

al_BITS :: ALenum
al_BITS = {#const AL_BITS #}

al_BUFFER :: ALenum
al_BUFFER = {#const AL_BUFFER #}

al_BUFFERS_PROCESSED :: ALenum
al_BUFFERS_PROCESSED = {#const AL_BUFFERS_PROCESSED #}

al_BUFFERS_QUEUED :: ALenum
al_BUFFERS_QUEUED = {#const AL_BUFFERS_QUEUED #}

al_CHANNELS :: ALenum
al_CHANNELS = {#const AL_CHANNELS #}

al_CONE_INNER_ANGLE :: ALenum
al_CONE_INNER_ANGLE = {#const AL_CONE_INNER_ANGLE #}

al_CONE_OUTER_ANGLE :: ALenum
al_CONE_OUTER_ANGLE = {#const AL_CONE_OUTER_ANGLE #}

al_CONE_OUTER_GAIN :: ALenum
al_CONE_OUTER_GAIN = {#const AL_CONE_OUTER_GAIN #}

al_DATA :: ALenum
al_DATA = {#const AL_DATA #}

al_DISTANCE_MODEL :: ALenum
al_DISTANCE_MODEL = {#const AL_DISTANCE_MODE #}

al_DOPPLER_FACTOR :: ALenum
al_DOPPLER_FACTOR = {#const AL_DOPPLER_FACTOR #}

al_DOPPLER_VELOCITY :: ALenum
al_DOPPLER_VELOCITY = {#const AL_DOPPLER_VELOCITY #}

al_DIRECTION :: ALenum
al_DIRECTION = {#const AL_DIRECTION #}

al_EXTENSIONS :: ALenum
al_EXTENSIONS = {#const AL_EXTENSIOS #}

al_FALSE :: ALenum
al_TRUE = {#const AL_TRUE #}

al_FORMAT_MONO8 :: ALenum
al_FORMAT_MOO8 = {#const AL_FORMAT_MONO8 #}

al_FORMAT_MONO16 :: ALenum
al_FORMAT_MONO16 = {#const AL_FORMAT_MONO16 #}

al_FORMAT_STEREO8 :: ALenum
al_FORMAT_STEREO8 = {#const AL_FORMA_STEREO8 #}

al_FORMAT_STEREO16 :: ALenum
al_FORMAT_STEREO16 = {#const AL_FORMA_STEREO16 #}

al_FREQUENCY :: ALenum
al_FREQUENCY = {#const AL_FREQUENCY #}

al_GAIN :: ALenum
al_GAIN = {#const AL_GAIN #}

al_INITIAL :: ALenum
al_INITIAL = {#const AL_INITIAL #}

al_INVALID_ENUM :: ALenum
al_INVALID_ENUM = {#const AL_INVALID_ENUM #}

al_INVALID_NAME :: ALenum
al_INVALID_NAME = {#const AL_INVALID_NAME #}

al_INVALID_OPERATION :: ALenum
al_INVALID_OPERATION = {#const AL_INVALID_OPERATION #}

al_INVALID_VALUE :: ALenum
al_INVALID_VALUE = {#const AL_INVALID_VALUE #}

al_INVERSE_DISTANCE :: ALenum
al_INVERSE_DISTANCE = {#const AL_INVERSE_DISTANCE #}

al_INVERSE_DISTANCE_CLAMPED :: ALenum
al_INVERSE_DISTANCE_CLAMPED = {#const AL_INVERSE_DISTANCE_CLAMPED #}

al_LOOPING :: ALenum
al_LOOPING = {#const AL_LOOPING #}

al_MAX_DISTANCE :: ALenum
al_MAX_DISANCE = {#const AL_MAX_DISTANCE #}

al_MAX_GAIN :: ALenum
al_MAX_GAIN = {#const AL_MAX_GAIN #}

al_MIN_GAIN :: ALenum
al_MIN_GAIN = {#const AL_MIN_GAIN #}

al_NONE :: ALenum
al_NONE = {#const AL_NONE #}

al_NO_ERROR :: ALenum
al_NO_ERROR = {#const AL_NO_ERROR #}

al_ORIENTATION :: ALenum
al_ORIENTATION = {#const AL_ORIENTATION #}

al_OUT_OF_MEMORY :: ALenum
al_OUT_OF_MEMORY = {#const AL_OUT_OF_MEMORY #}

al_PAUSED :: ALenum
al_PAUSED = {#const AL_PAUSED #}

al_PITCH :: ALenum
al_PITCH = {#const AL_PITCH #}

al_PLAYING :: ALenum
al_PLAYING = {#const AL_PLAYING #}

al_POSITION :: ALenum
al_POSITION = {#const AL_POSITION #}

al_REFERENCE_DISTANCE :: ALenum
al_REFERENCE_DISTANCE = {#const AL_REFERENCE_DISTANCE #}

al_RENDERER :: ALenum
al_RENDERER = {#const AL_RENDERER #}

al_ROLOFF_FACTOR :: Alenum
al_ROLOFF_FACTOR = {#const AL_ROLOFF_FACTOR #}

al_SIZE :: ALenum
al_SIZE = {#const AL_SIZE #}

al_SOURCE_RELATIVE :: ALenum
al_SOURCE_RELATIVE = {#const AL_SOURCE_RELATIVE #}

al_SOURCE_STATE :: ALenum
al_SOURCE_STATE = {#const AL_SOURCE_STATE #}

al_STOPPED :: ALenum
al_STOPPED = {#const AL_STOPPED #}

al_VELOCITY :: ALenum
al_VELOCITY = {#const AL_VELOCITY #}

al_VENDOR :: ALenum
al_VENDOR = {#const AL_VENDOR #}

al_VERSION :: ALenum
al_VERSION = {#const AL_VERSION #}
