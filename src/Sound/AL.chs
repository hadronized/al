-----------------------------------------------------------------------------
-- |
-- Copyright   : (C) 2015 Dimitri Sabadie
--               (C) 2022 Oleksii Divak
-- License     : BSD3
--
-- Maintainer  : Dimitri Sabadie <dimitri.sabadie@gmail.com>
-- Stability   : experimental
-- Portability : portable
----------------------------------------------------------------------------

{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface
           , PatternSynonyms #-}

module Sound.AL
  ( -- * Types
    ALboolean
  , ALchar
  , ALbyte
  , ALubyte
  , ALshort
  , ALushort
  , ALint
  , ALuint
  , ALsizei
  , ALenum
  , ALfloat
  , ALdouble
  , ALvoid
    -- * Enumerant values
  , pattern AL_INVALID
  , pattern AL_NONE

    -- ** Booleans
  , pattern AL_FALSE
  , pattern AL_TRUE

    -- ** Attributes
  , pattern AL_SOURCE_RELATIVE
  , pattern AL_CONE_INNER_ANGLE
  , pattern AL_CONE_OUTER_ANGLE
  , pattern AL_PITCH
  , pattern AL_POSITION
  , pattern AL_DIRECTION
  , pattern AL_VELOCITY
  , pattern AL_LOOPING
  , pattern AL_BUFFER
  , pattern AL_GAIN
  , pattern AL_MIN_GAIN
  , pattern AL_MAX_GAIN
  , pattern AL_ORIENTATION
--, pattern AL_CHANNEL_MASK

    -- ** Source state information.
  , pattern AL_SOURCE_STATE
  , pattern AL_INITIAL
  , pattern AL_PLAYING
  , pattern AL_PAUSED
  , pattern AL_STOPPED

    -- **  Buffer Queue params
  , pattern AL_BUFFERS_QUEUED
  , pattern AL_BUFFERS_PROCESSED

    -- **  Source buffer position information
  , pattern AL_SEC_OFFSET
  , pattern AL_SAMPLE_OFFSET
  , pattern AL_BYTE_OFFSET

    -- ** Source type
    --
    -- | Source is Static if a Buffer has been attached using AL_BUFFER;
    --
    --   Source is Streaming if one or more Buffers have been attached using 'alSourceQueueBuffers';
    --
    --   Source is undetermined when it has the NULL buffer attached.
  , pattern AL_SOURCE_TYPE
  , pattern AL_STATIC
  , pattern AL_STREAMING
  , pattern AL_UNDETERMINED

    -- ** Sound samples: format specifier.
  , pattern AL_FORMAT_MONO8
  , pattern AL_FORMAT_MONO16
  , pattern AL_FORMAT_STEREO8
  , pattern AL_FORMAT_STEREO16

  , pattern AL_REFERENCE_DISTANCE
  , pattern AL_ROLLOFF_FACTOR
  , pattern AL_CONE_OUTER_GAIN
  , pattern AL_MAX_DISTANCE

  , pattern AL_FREQUENCY
  , pattern AL_BITS
  , pattern AL_CHANNELS
  , pattern AL_SIZE

    -- ** Buffer state
    --
    -- | Not supported for public use (yet)
  , pattern AL_UNUSED
  , pattern AL_PENDING
  , pattern AL_PROCESSED

    -- ** Errors
    -- *** No error
  , pattern AL_NO_ERROR

    -- *** Invalid Name paramater passed to AL call.
  , pattern AL_INVALID_NAME

    -- *** Invalid parameter passed to AL call.
  , pattern AL_ILLEGAL_ENUM
  , pattern AL_INVALID_ENUM

    -- *** Invalid enum parameter value.
  , pattern AL_INVALID_VALUE

    -- *** Illegal call
  , pattern AL_ILLEGAL_COMMAND
  , pattern AL_INVALID_OPERATION

    -- *** No mojo.
  , pattern AL_OUT_OF_MEMORY

    -- ** Context strings
  , pattern AL_VENDOR
  , pattern AL_VERSION
  , pattern AL_RENDERER
  , pattern AL_EXTENSIONS

    -- ** Global tweakage
  , pattern AL_DOPPLER_FACTOR
  , pattern AL_DOPPLER_VELOCITY
  , pattern AL_SPEED_OF_SOUND

    -- ** Distance models
    --
    -- | used in conjunction with DistanceModel
    --
    --   implicit: NONE, which disances distance attenuation.
  , pattern AL_DISTANCE_MODEL
  , pattern AL_INVERSE_DISTANCE
  , pattern AL_INVERSE_DISTANCE_CLAMPED
  , pattern AL_LINEAR_DISTANCE
  , pattern AL_LINEAR_DISTANCE_CLAMPED
  , pattern AL_EXPONENT_DISTANCE
  , pattern AL_EXPONENT_DISTANCE_CLAMPED

    -- * Renderer State management
  , alEnable
  , alDisable
  , alIsEnabled

    -- * State retrieval
  , alGetString
  , alGetBooleanv
  , alGetIntegerv
  , alGetFloatv
  , alGetDoublev
  , alGetBoolean
  , alGetInteger
  , alGetFloat
  , alGetDouble

    -- * Error support.
  , alGetError

    -- * Extension support.
    --
    -- | Query for the presence of an extension, and obtain any appropriate
    --     function pointers and enum values.
  , alIsExtensionPresent
  , alGetProcAddress
  , alGetEnumValue

    -- * Listener
    --
    -- | Listener represents the location and orientation of the
    --     \'user\' in 3D-space.
    --
    --   Properties include:
    --
    --   +-------------+----------------+--------------------------------------+
    --   | Gain        | AL_GAIN        | ALfloat                              |
    --   +-------------+----------------+--------------------------------------+
    --   | Position    | AL_POSITION    | ALfloat[3]                           |
    --   +-------------+----------------+--------------------------------------+
    --   | Velocity    | AL_VELOCITY    | ALfloat[3]                           |
    --   +-------------+----------------+--------------------------------------+
    --   | Orientation | AL_ORIENTATION | ALfloat[6] (Forward then Up vectors) |
    --   +-------------+----------------+--------------------------------------+

    -- ** Set parameters
  , alListenerf
  , alListener3f
  , alListenerfv
  , alListeneri
  , alListener3i
  , alListeneriv

    -- ** Get parameters
  , alGetListenerf
  , alGetListener3f
  , alGetListenerfv
  , alGetListeneri
  , alGetListener3i
  , alGetListeneriv

    -- ** Source
    --
    -- | Sources represent individual sound objects in 3D-space.
    --
    --   Sources take the PCM data provided in the specified Buffer,
    --     apply Source-specific modifications, and then
    --     submit them to be mixed according to spatial arrangement etc.
    --
    --   Properties include:
    --
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Gain                           | AL_GAIN               | ALfloat                     |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Min Gain                       | AL_MIN_GAIN           | ALfloat                     |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Max Gain                       | AL_MAX_GAIN           | ALfloat                     |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Position                       | AL_POSITION           | ALfloat[3]                  |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Velocity                       | AL_VELOCITY           | ALfloat[3]                  |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Direction                      | AL_DIRECTION          | ALfloat[3]                  |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Head Relative Mode             | AL_SOURCE_RELATIVE    | ALint (AL_TRUE or AL_FALSE) |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Reference Distance             | AL_REFERENCE_DISTANCE | ALfloat                     |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Max Distance                   | AL_MAX_DISTANCE       | ALfloat                     |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | RollOff Factor                 | AL_ROLLOFF_FACTOR     | ALfloat                     |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Inner Angle                    | AL_CONE_INNER_ANGLE   | ALint or ALfloat            |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Outer Angle                    | AL_CONE_OUTER_ANGLE   | ALint or ALfloat            |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Cone Outer Gain                | AL_CONE_OUTER_GAIN    | ALint or ALfloat            |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Pitch                          | AL_PITCH              | ALfloat                     |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Looping                        | AL_LOOPING            | ALint (AL_TRUE or AL_FALSE) |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | MS Offset                      | AL_MSEC_OFFSET        | ALint or ALfloat            |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Byte Offset                    | AL_BYTE_OFFSET        | ALint or ALfloat            |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Sample Offset                  | AL_SAMPLE_OFFSET      | ALint or ALfloat            |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Attached Buffer                | AL_BUFFER             | ALint                       |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | State (Query only)             | AL_SOURCE_STATE       | ALint                       |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Buffers Queued (Query only)    | AL_BUFFERS_QUEUED     | ALint                       |
    --   +--------------------------------+-----------------------+-----------------------------+
    --   | Buffers Processed (Query only) | AL_BUFFERS_PROCESSED  | ALint                       |
    --   +--------------------------------+-----------------------+-----------------------------+
  , alGenSources
  , alDeleteSources
  , alIsSource

    -- ** Set parameters
  , alSourcef
  , alSource3f
  , alSourcefv
  , alSourcei
  , alSource3i
  , alSourceiv

    -- ** Get Source parameters
  , alGetSourcef
  , alGetSource3f
  , alGetSourcefv
  , alGetSourcei
  , alGetSource3i
  , alGetSourceiv

    -- ** Vector-based playback calls
  , alSourcePlayv
  , alSourceStopv
  , alSourceRewindv
  , alSourcePausev

    -- ** Source-based playback calls
  , alSourcePlay
  , alSourceStop
  , alSourceRewind
  , alSourcePause

    -- ** Source Queuing
  , alSourceQueueBuffers
  , alSourceUnqueueBuffers


    -- * Buffer
    -- | Buffer objects are storage space for sample data.
    --
    --   Buffers are referred to by Sources. One Buffer can be used
    --     by multiple Sources.
    --
    --   Properties include:
    --
    --   +------------------------+--------------+-------+
    --   | Frequency (Query only) | AL_FREQUENCY | ALint |
    --   +------------------------+--------------+-------+
    --   | Size (Query only)      | AL_SIZE      | ALint |
    --   +------------------------+--------------+-------+
    --   | Bits (Query only)      | AL_BITS      | ALint |
    --   +------------------------+--------------+-------+
    --   | Channels (Query only)  | AL_CHANNELS  | ALint |
    --   +------------------------+--------------+-------+
  , alGenBuffers
  , alDeleteBuffers
  , alIsBuffer
  , alBufferData

    -- ** Set parameters
  , alBufferf
  , alBuffer3f
  , alBufferfv
  , alBufferi
  , alBuffer3i
  , alBufferiv

    -- ** Get parameters
  , alGetBufferf
  , alGetBuffer3f
  , alGetBufferfv
  , alGetBufferi
  , alGetBuffer3i
  , alGetBufferiv

    -- * Global parameters
  , alDopplerFactor
  , alDopplerVelocity
  , alSpeedOfSound
  , alDistanceModel
  ) where

import           Foreign.Ptr

#ifdef mingw32_HOST_OS
  #include <al.h>
#else
  #include <AL/al.h>
#endif

-- | 8-bit boolean
type ALboolean = {#type ALboolean #}

-- | character
type ALchar = {#type ALchar #}

-- | signed 8-bit 2's complement integer
type ALbyte = {#type ALbyte #}

-- | unsigned 8-bit integer
type ALubyte = {#type ALubyte #}

-- | signed 16-bit 2's complement integer
type ALshort = {#type ALshort #}

-- | unsigned 16-bit integer
type ALushort = {#type ALushort #}

-- | signed 32-bit 2's complement integer
type ALint = {#type ALint #}

-- | unsigned 32-bit integer
type ALuint = {#type ALuint #}

-- | non-negative 32-bit binary integer size
type ALsizei = {#type ALsizei #}

-- | enumerated 32-bit value
type ALenum = {#type ALenum #}

-- | 32-bit IEEE754 floating-point
type ALfloat = {#type ALfloat #}

-- | 64-bit IEEE754 floating-point
type ALdouble = {#type ALdouble #}

-- | void type (for opaque pointers only)
type ALvoid = {#type ALvoid #}



-- | Bad value
pattern AL_INVALID :: (Eq a, Num a) => a
pattern AL_INVALID = {#const AL_INVALID #}

pattern AL_NONE :: (Eq a, Num a) => a
pattern AL_NONE = {#const AL_NONE #}

-- | Boolean False
pattern AL_FALSE :: (Eq a, Num a) => a
pattern AL_FALSE = {#const AL_FALSE #}

-- | Boolean True
pattern AL_TRUE :: (Eq a, Num a) => a
pattern AL_TRUE = {#const AL_TRUE #}

-- | Indicate Source has relative coordinates
pattern AL_SOURCE_RELATIVE :: (Eq a, Num a) => a
pattern AL_SOURCE_RELATIVE = {#const AL_SOURCE_RELATIVE #}

{- | Directional source, inner cone angle, in degrees.

     Range:    [0-360]

     Default:  360
-}
pattern AL_CONE_INNER_ANGLE :: (Eq a, Num a) => a
pattern AL_CONE_INNER_ANGLE = {#const AL_CONE_INNER_ANGLE #}

{- | Directional source, outer cone angle, in degrees.

     Range:    [0-360]

     Default:  360
-}
pattern AL_CONE_OUTER_ANGLE :: (Eq a, Num a) => a
pattern AL_CONE_OUTER_ANGLE = {#const AL_CONE_OUTER_ANGLE #}

{- | Specify the pitch to be applied, either at source, or on mixer results, at listener.

     Range:   [0.5-2.0]

     Default: 1.0
-}
pattern AL_PITCH :: (Eq a, Num a) => a
pattern AL_PITCH = {#const AL_PITCH #}

{- | Specify the current location in three dimensional space.

     OpenAL, like OpenGL, uses a right handed coordinate system,
       where in a frontal default view X (thumb) points right,
       Y points up (index finger), and Z points towards the
       viewer/camera (middle finger).

     To switch from a left handed coordinate system, flip the
       sign on the Z coordinate.

     Listener position is always in the world coordinate system.
-}
pattern AL_POSITION :: (Eq a, Num a) => a
pattern AL_POSITION = {#const AL_POSITION #}

-- | Specify the current direction.
pattern AL_DIRECTION :: (Eq a, Num a) => a
pattern AL_DIRECTION = {#const AL_DIRECTION #}

-- | Specify the current velocity in three dimensional space.
pattern AL_VELOCITY :: (Eq a, Num a) => a
pattern AL_VELOCITY = {#const AL_VELOCITY #}

{- | Indicate whether source is looping.

     Type: 'ALboolean'?

     Range:   [AL_TRUE, AL_FALSE]

     Default: FALSE.
-}
pattern AL_LOOPING :: (Eq a, Num a) => a
pattern AL_LOOPING = {#const AL_LOOPING #}

{- | Indicate the buffer to provide sound samples.

     Type: 'ALuint'.

     Range: any valid Buffer id.
-}
pattern AL_BUFFER :: (Eq a, Num a) => a
pattern AL_BUFFER = {#const AL_BUFFER #}

{- | Indicate the gain (volume amplification) applied.

     Type:   'ALfloat'.

     Range:  [0.0-  ]

     A value of 1.0 means un-attenuated/unchanged.

     Each division by 2 equals an attenuation of -6dB.

     Each multiplicaton with 2 equals an amplification of +6dB.

     A value of 0.0 is meaningless with respect to a logarithmic
       scale; it is interpreted as zero volume - the channel
       is effectively disabled.
-}
pattern AL_GAIN :: (Eq a, Num a) => a
pattern AL_GAIN = {#const AL_GAIN #}

{- | Indicate minimum source attenuation

     Type: 'ALfloat'

     Range:  [0.0 - 1.0]

     Logarthmic
-}
pattern AL_MIN_GAIN :: (Eq a, Num a) => a
pattern AL_MIN_GAIN = {#const AL_MIN_GAIN #}

{- | Indicate maximum source attenuation

     Type: 'ALfloat'

     Range:  [0.0 - 1.0]

     Logarthmic
-}
pattern AL_MAX_GAIN :: (Eq a, Num a) => a
pattern AL_MAX_GAIN = {#const AL_MAX_GAIN #}

{- | Indicate listener orientation.

     at/up
-}
pattern AL_ORIENTATION :: (Eq a, Num a) => a
pattern AL_ORIENTATION = {#const AL_ORIENTATION #}

{- | Specify the channel mask. (Creative)

     Type: 'ALuint'

     Range: [0 - 255]

pattern AL_CHANNEL_MASK :: (Eq a, Num a) => a
pattern AL_CHANNEL_MASK = {#const AL_CHANNEL_MASK #}
-}

pattern AL_SOURCE_STATE
      , AL_INITIAL
      , AL_PLAYING
      , AL_PAUSED
      , AL_STOPPED
     :: (Eq a, Num a) => a
pattern AL_SOURCE_STATE = {#const AL_SOURCE_STATE #}
pattern AL_INITIAL      = {#const AL_INITIAL #}
pattern AL_PLAYING      = {#const AL_PLAYING #}
pattern AL_PAUSED       = {#const AL_PAUSED #}
pattern AL_STOPPED      = {#const AL_STOPPED #}

pattern AL_BUFFERS_QUEUED
      , AL_BUFFERS_PROCESSED
     :: (Eq a, Num a) => a
pattern AL_BUFFERS_QUEUED    = {#const AL_BUFFERS_QUEUED #}
pattern AL_BUFFERS_PROCESSED = {#const AL_BUFFERS_PROCESSED #}

pattern AL_SEC_OFFSET
      , AL_SAMPLE_OFFSET
      , AL_BYTE_OFFSET
     :: (Eq a, Num a) => a
pattern AL_SEC_OFFSET    = {#const AL_SEC_OFFSET #}
pattern AL_SAMPLE_OFFSET = {#const AL_SAMPLE_OFFSET #}
pattern AL_BYTE_OFFSET   = {#const AL_BYTE_OFFSET #}


pattern AL_SOURCE_TYPE
      , AL_STATIC
      , AL_STREAMING
      , AL_UNDETERMINED
     :: (Eq a, Num a) => a
pattern AL_SOURCE_TYPE  = {#const AL_SOURCE_TYPE #}
pattern AL_STATIC       = {#const AL_STATIC #}
pattern AL_STREAMING    = {#const AL_STREAMING #}
pattern AL_UNDETERMINED = {#const AL_UNDETERMINED #}

pattern AL_FORMAT_MONO8
      , AL_FORMAT_MONO16
      , AL_FORMAT_STEREO8
      , AL_FORMAT_STEREO16
     :: (Eq a, Num a) => a
pattern AL_FORMAT_MONO8    = {#const AL_FORMAT_MONO8 #}
pattern AL_FORMAT_MONO16   = {#const AL_FORMAT_MONO16 #}
pattern AL_FORMAT_STEREO8  = {#const AL_FORMAT_STEREO8 #}
pattern AL_FORMAT_STEREO16 = {#const AL_FORMAT_STEREO16 #}

{- | source specific reference distance

     Type: 'ALfloat'

     Range:  0.0 - +inf

     At 0.0, no distance attenuation occurs. Default is 1.0.
-}
pattern AL_REFERENCE_DISTANCE :: (Eq a, Num a) => a
pattern AL_REFERENCE_DISTANCE = {#const AL_REFERENCE_DISTANCE #}

{- | source specific rolloff factor

     Type: 'ALfloat'

     Range:  0.0 - +inf
-}
pattern AL_ROLLOFF_FACTOR :: (Eq a, Num a) => a
pattern AL_ROLLOFF_FACTOR = {#const AL_ROLLOFF_FACTOR #}

{- | Directional source, outer cone gain.

     Default:  0.0

     Range:    [0.0 - 1.0]

     Logarithmic
-}
pattern AL_CONE_OUTER_GAIN :: (Eq a, Num a) => a
pattern AL_CONE_OUTER_GAIN = {#const AL_CONE_OUTER_GAIN #}

{- | Indicate distance above which sources are not
     attenuated using the inverse clamped distance model.

     Default: +inf

     Type: 'ALfloat'

     Range:  0.0 - +inf
-}
pattern AL_MAX_DISTANCE :: (Eq a, Num a) => a
pattern AL_MAX_DISTANCE = {#const AL_MAX_DISTANCE #}

{- | Sound samples: frequency, in units of Hertz [Hz].

     This is the number of samples per second. Half of the
       sample frequency marks the maximum significant
       frequency component.
-}
pattern AL_FREQUENCY :: (Eq a, Num a) => a
pattern AL_FREQUENCY = {#const AL_FREQUENCY #}

pattern AL_BITS
      , AL_CHANNELS
      , AL_SIZE
     :: (Eq a, Num a) => a
pattern AL_BITS     = {#const AL_BITS #}
pattern AL_CHANNELS = {#const AL_CHANNELS #}
pattern AL_SIZE     = {#const AL_SIZE #}

pattern AL_UNUSED
      , AL_PENDING
      , AL_PROCESSED
     :: (Eq a, Num a) => a
pattern AL_UNUSED    = {#const AL_UNUSED #}
pattern AL_PENDING   = {#const AL_PENDING #}
pattern AL_PROCESSED = {#const AL_PROCESSED #}

pattern AL_NO_ERROR :: (Eq a, Num a) => a
pattern AL_NO_ERROR = {#const AL_NO_ERROR #}

pattern AL_INVALID_NAME :: (Eq a, Num a) => a
pattern AL_INVALID_NAME = {#const AL_INVALID_NAME #}

pattern AL_ILLEGAL_ENUM
      , AL_INVALID_ENUM
     :: (Eq a, Num a) => a
pattern AL_ILLEGAL_ENUM = {#const AL_ILLEGAL_ENUM #}
pattern AL_INVALID_ENUM = {#const AL_INVALID_ENUM #}

pattern AL_INVALID_VALUE :: (Eq a, Num a) => a
pattern AL_INVALID_VALUE = {#const AL_INVALID_VALUE #}

pattern AL_ILLEGAL_COMMAND
      , AL_INVALID_OPERATION
     :: (Eq a, Num a) => a
pattern AL_ILLEGAL_COMMAND   = {#const AL_ILLEGAL_COMMAND #}
pattern AL_INVALID_OPERATION = {#const AL_INVALID_OPERATION #}

pattern AL_OUT_OF_MEMORY :: (Eq a, Num a) => a
pattern AL_OUT_OF_MEMORY = {#const AL_OUT_OF_MEMORY #}

pattern AL_VENDOR
      , AL_VERSION
      , AL_RENDERER
      , AL_EXTENSIONS
     :: (Eq a, Num a) => a
pattern AL_VENDOR     = {#const AL_VENDOR #}
pattern AL_VERSION    = {#const AL_VERSION #}
pattern AL_RENDERER   = {#const AL_RENDERER #}
pattern AL_EXTENSIONS = {#const AL_EXTENSIONS #}



-- | Doppler scale.  Default 1.0
pattern AL_DOPPLER_FACTOR :: (Eq a, Num a) => a
pattern AL_DOPPLER_FACTOR = {#const AL_DOPPLER_FACTOR #}

-- | Tweaks speed of propagation.
pattern AL_DOPPLER_VELOCITY :: (Eq a, Num a) => a
pattern AL_DOPPLER_VELOCITY = {#const AL_DOPPLER_VELOCITY #}

-- | Speed of Sound in units per second
pattern AL_SPEED_OF_SOUND :: (Eq a, Num a) => a
pattern AL_SPEED_OF_SOUND = {#const AL_SPEED_OF_SOUND #}

/**
 * Distance models
 *
 * used in conjunction with DistanceModel
 *
 * implicit: NONE, which disances distance attenuation.
 */
pattern AL_DISTANCE_MODEL
      , AL_INVERSE_DISTANCE
      , AL_INVERSE_DISTANCE_CLAMPED
      , AL_LINEAR_DISTANCE
      , AL_LINEAR_DISTANCE_CLAMPED
      , AL_EXPONENT_DISTANCE
      , AL_EXPONENT_DISTANCE_CLAMPED
     :: (Eq a, Num a) => a
pattern AL_DISTANCE_MODEL            = {#const AL_DISTANCE_MODEL #}
pattern AL_INVERSE_DISTANCE          = {#const AL_INVERSE_DISTANCE #}
pattern AL_INVERSE_DISTANCE_CLAMPED  = {#const AL_INVERSE_DISTANCE_CLAMPED #}
pattern AL_LINEAR_DISTANCE           = {#const AL_LINEAR_DISTANCE #}
pattern AL_LINEAR_DISTANCE_CLAMPED   = {#const AL_LINEAR_DISTANCE_CLAMPED #}
pattern AL_EXPONENT_DISTANCE         = {#const AL_EXPONENT_DISTANCE #}
pattern AL_EXPONENT_DISTANCE_CLAMPED = {#const AL_EXPONENT_DISTANCE_CLAMPED #}



foreign import CALLCV "al.h alEnable"
  alEnable
    :: ALenum -- ^ capability
    -> IO ()

foreign import CALLCV "al.h alDisable"
  alDisable
    :: ALenum -- ^ capability
    -> IO ()

foreign import CALLCV "al.h alIsEnabled"
  alIsEnabled
    :: ALenum -- ^ capability
    -> IO ()



foreign import CALLCV "al.h alGetString"
  alGetString
    :: ALenum          -- ^ param
    -> IO (Ptr ALchar)

foreign import CALLCV "al.h alGetBooleanv"
  alGetBooleanv
    :: ALenum        -- ^ param
    -> Ptr ALboolean -- ^ data
    -> IO ()

foreign import CALLCV "al.h alGetIntegerv"
  alGetIntegerv
    :: ALenum    -- ^ param
    -> Ptr ALint -- ^ data
    -> IO ()

foreign import CALLCV "al.h alGetFloatv"
  alGetFloatv
    :: ALenum      -- ^ param
    -> Ptr ALfloat -- ^ data
    -> IO ()

foreign import CALLCV "al.h alGetDoublev"
  alGetDoublev
    :: ALenum       -- ^ param
    -> Ptr ALdouble -- ^ data
    -> IO ()

foreign import CALLCV "al.h alGetBoolean"
  alGetBoolean
    :: ALenum       -- ^ param
    -> IO ALboolean

foreign import CALLCV "al.h alGetInteger"
  alGetInteger
    :: ALenum   -- ^ param
    -> IO ALint

foreign import CALLCV "al.h alGetFloat"
  alGetFloat
    :: ALenum     -- ^ param
    -> IO ALfloat

foreign import CALLCV "al.h alGetDouble"
  alGetDouble
    :: ALenum      -- ^ param
    -> IO ALdouble


-- | Obtain the most recent error generated in the AL state machine.
foreign import CALLCV "al.h alGetError"
  alGetError :: IO ALenum



foreign import CALLCV "al.h alIsExtensionPresent"
  alIsExtensionPresent
    :: Ptr ALchar   -- ^ extname
    -> IO ALboolean

foreign import CALLCV "al.h alGetProcAddress"
  alGetProcAddress
    :: Ptr ALchar    -- ^ fname
    -> IO (FunPtr a)

foreign import CALLCV "al.h alGetEnumValue"
  alGetEnumValue
    :: Ptr ALchar -- ^ ename
    -> IO ALenum



foreign import CALLCV "al.h alListenerf"
  alListenerf
    :: ALenum  -- ^ param
    -> ALfloat -- ^ value
    -> IO ()

foreign import CALLCV "al.h alListener3f"
  alListener3f
    :: ALenum  -- ^ param
    -> ALfloat -- ^ value1
    -> ALfloat -- ^ value2
    -> ALfloat -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alListenerfv"
  alListenerfv
    :: ALenum      -- ^ param
    -> Ptr ALfloat -- ^ values
    -> IO ()

foreign import CALLCV "al.h alListeneri"
  alListeneri
    :: ALenum -- ^ param
    -> ALint  -- ^ value
    -> IO ()

foreign import CALLCV "al.h alListener3i"
  alListener3i
    :: ALenum -- ^ param
    -> ALint  -- ^ value1
    -> ALint  -- ^ value2
    -> ALint  -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alListeneriv"
  alListeneriv
    :: ALenum    -- ^ param
    -> Ptr ALint -- ^ values
    -> IO ()

foreign import CALLCV "al.h alGetListenerf"
  alGetListenerf
    :: ALenum      -- ^ param
    -> Ptr ALfloat -- ^ value
    -> IO ()

foreign import CALLCV "al.h alGetListener3f"
  alGetListener3f
    :: ALenum      -- ^ param
    -> Ptr ALfloat -- ^ value1
    -> Ptr ALfloat -- ^ value2
    -> Ptr ALfloat -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alGetListenerfv"
  alGetListenerfv
    :: ALenum      -- ^ param
    -> Ptr ALfloat -- ^ values
    -> IO ()

foreign import CALLCV "al.h alGetListeneri"
  alGetListeneri
    :: ALenum    -- ^ param
    -> Ptr ALint -- ^ value
    -> IO ()

foreign import CALLCV "al.h alGetListener3i"
  alGetListener3i
    :: ALenum    -- ^ param
    -> Ptr ALint -- ^ value1
    -> Ptr ALint -- ^ value2
    -> Ptr ALint -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alGetListeneriv"
  alGetListeneriv
    :: ALenum    -- ^ param
    -> Ptr ALint -- ^ values
    -> IO ()



-- | Create Source objects
foreign import CALLCV "al.h alGenSources"
  alGenSources
    :: ALsizei    -- ^ n
    -> Ptr ALuint -- ^ source
    -> IO ()

-- | Delete Source objects
foreign import CALLCV "al.h alDeleteSources"
  alDeleteSources
    :: ALsizei    -- ^ n
    -> Ptr ALuint -- ^ sources
    -> IO ()

-- | Verify a handle is a valid Source
foreign import CALLCV "al.h alIsSource"
  alIsSource
    :: ALuint -- ^ sid
    -> IO ALboolean

foreign import CALLCV "al.h alSourcef"
  alSourcef
    :: ALuint  -- ^ sid
    -> ALenum  -- ^ param
    -> ALfloat -- ^ value
    -> IO ()

foreign import CALLCV "al.h alSource3f"
  alSource3f
    :: ALuint  -- ^ sid
    -> ALenum  -- ^ param
    -> ALfloat -- ^ value1
    -> ALfloat -- ^ value2
    -> ALfloat -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alSourcefv"
  alSourcefv
    :: ALuint      -- ^ sid
    -> ALenum      -- ^ param
    -> Ptr ALfloat -- ^ values
    -> IO ()

foreign import CALLCV "al.h alSourcei"
  alSourcei
    :: ALuint -- ^ sid
    -> ALenum -- ^ param
    -> ALint  -- ^ value
    -> IO ()

foreign import CALLCV "al.h alSource3i"
  alSource3i
    :: ALuint -- ^ sid
    -> ALenum -- ^ param
    -> ALint  -- ^ value1
    -> ALint  -- ^ value2
    -> ALint  -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alSourceiv"
  alSourceiv
    :: ALuint    -- ^ sid
    -> ALenum    -- ^ param
    -> Ptr ALint -- ^ values
    -> IO ()

foreign import CALLCV "al.h alGetSourcef"
  alGetSourcef
    :: ALuint      -- ^ sid
    -> ALenum      -- ^ param
    -> Ptr ALfloat -- ^ value
    -> IO ()

foreign import CALLCV "al.h alGetSource3f"
  alGetSource3f
    :: ALuint      -- ^ sid
    -> ALenum      -- ^ param
    -> Ptr ALfloat -- ^ value1
    -> Ptr ALfloat -- ^ value2
    -> Ptr ALfloat -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alGetSourcefv"
  alGetSourcefv
    :: ALuint      -- ^ sid
    -> ALenum      -- ^ param
    -> Ptr ALfloat -- ^ values
    -> IO ()

foreign import CALLCV "al.h alGetSourcei"
  alGetSourcei
    :: ALuint    -- ^ sid
    -> ALenum    -- ^ param
    -> Ptr ALint -- ^ value
    -> IO ()

foreign import CALLCV "al.h alGetSource3i"
  alGetSource3i
    :: ALuint    -- ^ sid
    -> ALenum    -- ^ param
    -> Ptr ALint -- ^ value1
    -> Ptr ALint -- ^ value2
    -> Ptr ALint -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alGetSourceiv"
  alGetSourceiv
    :: ALuint    -- ^ sid
    -> ALenum    -- ^ param
    -> Ptr ALint -- ^ values
    -> IO ()



-- | Play, replay, or resume (if paused) a list of Sources
foreign import CALLCV "al.h alSourcePlayv"
  alSourcePlayv
    :: ALsizei    -- ^ ns
    -> Ptr ALuint -- ^ sids
    -> IO ()

-- | Stop a list of Sources
foreign import CALLCV "al.h alSourceStopv"
  alSourceStopv
    :: ALsizei    -- ^ ns
    -> Ptr ALuint -- ^ sids
    -> IO ()

-- | Rewind a list of Sources
foreign import CALLCV "al.h alSourceRewindv"
  alSourceRewindv
    :: ALsizei    -- ^ ns
    -> Ptr ALuint -- ^ sids
    -> IO ()

-- | Pause a list of Sources
foreign import CALLCV "al.h alSourcePausev"
  alSourcePausev
    :: ALsizei    -- ^ ns
    -> Ptr ALuint -- ^ sids
    -> IO ()

-- | Play, replay, or resume a Source
foreign import CALLCV "al.h alSourcePlay"
  alSourcePlay
    :: ALuint -- ^ sid
    -> IO ()

-- | Stop a Source
foreign import CALLCV "al.h alSourceStop"
  alSourceStop
    :: ALuint -- ^ sid
    -> IO ()

-- | Rewind a Source (set playback postiton to beginning)
foreign import CALLCV "al.h alSourceRewind"
  alSourceRewind
    :: ALuint -- ^ sid
    -> IO ()

-- | Pause a Source
foreign import CALLCV "al.h alSourcePause"
  alSourcePause
    :: ALuint -- ^ sid
    -> IO ()

foreign import CALLCV "al.h alSourceQueueBuffers"
  alSourceQueueBuffers
    :: ALuint     -- ^ sid
    -> ALsizei    -- ^ numEntries
    -> Ptr ALuint -- ^ bids
    -> IO ()

foreign import CALLCV "al.h alSourceUnqueueBuffers"
  alSourceUnqueueBuffers
    :: ALuint     -- ^ sid
    -> ALsizei    -- ^ numEntries
    -> Ptr ALuint -- ^ bids
    -> IO ()



-- | Create Buffer objects
foreign import CALLCV "al.h alGenBuffers"
  alGenBuffers
    :: ALsizei    -- ^ n
    -> Ptr ALuint -- ^ buffers
    -> IO ()

-- | Delete Buffer objects
foreign import CALLCV "al.h alDeleteBuffers"
  alDeleteBuffers
    :: ALsizei    -- ^ n
    -> Ptr ALuint -- ^ buffers
    -> IO ()

-- | Verify a handle is a valid Buffer
foreign import CALLCV "al.h alIsBuffer"
  alIsBuffer
    :: ALuint       -- ^ bid
    -> IO ALboolean

-- | Specify the data to be copied into a buffer
foreign import CALLCV "al.h alBufferData"
  alBufferData
    :: ALuint     -- ^ bid
    -> ALenum     -- ^ format
    -> Ptr ALvoid -- ^ data
    -> ALsizei    -- ^ size
    -> ALsizei    -- ^ freq
    -> IO ()

foreign import CALLCV "al.h alBufferf"
  alBufferf
    :: ALuint  -- ^ bid
    -> ALenum  -- ^ param
    -> ALfloat -- ^ value
    -> IO ()

foreign import CALLCV "al.h alBuffer3f"
  alBuffer3f
    :: ALuint  -- ^ bid
    -> ALenum  -- ^ param
    -> ALfloat -- ^ value1
    -> ALfloat -- ^ value2
    -> ALfloat -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alBufferfv"
  alBufferfv
    :: ALuint      -- ^ bid
    -> ALenum      -- ^ param
    -> Ptr ALfloat -- ^ values
    -> IO ()

foreign import CALLCV "al.h alBufferi"
  alBufferi
    :: ALuint -- ^ bid
    -> ALenum -- ^ param
    -> ALint  -- ^ value
    -> IO ()

foreign import CALLCV "al.h alBuffer3i"
  alBuffer3i
    :: ALuint -- ^ bid
    -> ALenum -- ^ param
    -> ALint  -- ^ value1
    -> ALint  -- ^ value2
    -> ALint  -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alBufferiv"
  alBufferiv
    :: ALuint    -- ^ bid
    -> ALenum    -- ^ param
    -> Ptr ALint -- ^ values
    -> IO ()

foreign import CALLCV "al.h alGetBufferf"
  alGetBufferf
    :: ALuint      -- ^ bid
    -> ALenum      -- ^ param
    -> Ptr ALfloat -- ^ value
    -> IO ()

foreign import CALLCV "al.h alGetBuffer3f"
  alGetBuffer3f
    :: ALuint      -- ^ bid
    -> ALenum      -- ^ param
    -> Ptr ALfloat -- ^ value1
    -> Ptr ALfloat -- ^ value2
    -> Ptr ALfloat -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alGetBufferfv"
  alGetBufferfv
    :: ALuint      -- ^ bid
    -> ALenum      -- ^ param
    -> Ptr ALfloat -- ^ values
    -> IO ()

foreign import CALLCV "al.h alGetBufferi"
  alGetBufferi
    :: ALuint    -- ^ bid
    -> ALenum    -- ^ param
    -> Ptr ALint -- ^ value
    -> IO ()

foreign import CALLCV "al.h alGetBuffer3i"
  alGetBuffer3i
    :: ALuint    -- ^ bid
    -> ALenum    -- ^ param
    -> Ptr ALint -- ^ value1
    -> Ptr ALint -- ^ value2
    -> Ptr ALint -- ^ value3
    -> IO ()

foreign import CALLCV "al.h alGetBufferiv"
  alGetBufferiv
    :: ALuint    -- ^ bid
    -> ALenum    -- ^ param
    -> Ptr ALint -- ^ values
    -> IO ()



foreign import CALLCV "al.h alDopplerFactor"
  alDopplerFactor
    :: ALfloat -- ^ value
    -> IO ()

foreign import CALLCV "al.h alDopplerVelocity"
  alDopplerVelocity
    :: ALfloat -- ^ value
    -> IO ()

foreign import CALLCV "al.h alSpeedOfSound"
  alSpeedOfSound
    :: ALfloat -- ^ value
    -> IO ()

foreign import CALLCV "al.h alDistanceModel"
  alDistanceModel
    :: ALenum -- ^ distanceModel
    -> IO ()
