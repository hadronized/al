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

module Sound.ALC
  ( -- * Types
    ALCdevice
  , ALCcontext
  , ALCboolean
  , ALCchar
  , ALCbyte
  , ALCubyte
  , ALCshort
  , ALCushort
  , ALCint
  , ALCuint
  , ALCsizei
  , ALCenum
  , ALCfloat
  , ALCdouble
  , ALCvoid
    -- * Enumerant values
    -- ** Booleans
  , pattern ALC_FALSE
  , pattern ALC_TRUE

    -- ** Context creation attributes
  , pattern ALC_FREQUENCY
  , pattern ALC_REFRESH
  , pattern ALC_SYNC
  , pattern ALC_MONO_SOURCES
  , pattern ALC_STEREO_SOURCES

    -- ** Errors
  , pattern ALC_NO_ERROR
  , pattern ALC_INVALID_DEVICE
  , pattern ALC_INVALID_CONTEXT
  , pattern ALC_INVALID_ENUM
  , pattern ALC_INVALID_VALUE
  , pattern ALC_OUT_OF_MEMORY

    -- ** String query
  , pattern ALC_DEFAULT_DEVICE_SPECIFIER
  , pattern ALC_DEVICE_SPECIFIER
  , pattern ALC_EXTENSIONS

    -- ** Version
  , pattern ALC_MAJOR_VERSION
  , pattern ALC_MINOR_VERSION

    -- ** Attributes
  , pattern ALC_ATTRIBUTES_SIZE
  , pattern ALC_ALL_ATTRIBUTES

    -- ** ALC_ENUMERATE_ALL_EXT enums
  , pattern ALC_DEFAULT_ALL_DEVICES_SPECIFIER
  , pattern ALC_ALL_DEVICES_SPECIFIER

    -- ** Capture extension
  , pattern ALC_CAPTURE_DEVICE_SPECIFIER
  , pattern ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER
  , pattern ALC_CAPTURE_SAMPLES

    -- ** Context management
  , alcCreateContext
  , alcMakeContextCurrent
  , alcProcessContext
  , alcSuspendContext
  , alcDestroyContext
  , alcGetCurrentContext
  , alcGetContextsDevice

    -- ** Device management
  , alcOpenDevice
  , alcCloseDevice

    -- ** Error support
  , alcGetError

    -- ** Extension support
    --
    -- | Query for the presence of an extension, and obtain any appropriate
    --     function pointers and enum values.
  , alcIsExtensionPresent
  , alcGetProcAddress
  , alcGetEnumValue

    -- * Query functions
  , alcGetString
  , alcGetIntegerv

    -- * Capture functions
  , alcCaptureOpenDevice
  , alcCaptureCloseDevice
  , alcCaptureStart
  , alcCaptureStop
  , alcCaptureSamples
  ) where

import           Foreign.Ptr

#ifdef mingw32_HOST_OS
  #include <alc.h>
#else
  #include <AL/alc.h>
#endif

data {-# CTYPE "alc.h" "ALCdevice" #-} ALCdevice

data {-# CTYPE "alc.h" "ALCcontext" #-} ALCcontext

-- | 8-bit boolean
type ALCboolean = {#type ALCboolean #}

-- | character
type ALCchar = {#type ALCchar #}

-- | signed 8-bit 2's complement integer
type ALCbyte = {#type ALCbyte #}

-- | unsigned 8-bit integer
type ALCubyte = {#type ALCubyte #}

-- | signed 16-bit 2's complement integer
type ALCshort = {#type ALCshort #}

-- | unsigned 16-bit integer
type ALCushort = {#type ALCushort #}

-- | signed 32-bit 2's complement integer
type ALCint = {#type ALCint #}

-- | unsigned 32-bit integer
type ALCuint = {#type ALCuint #}

-- | non-negative 32-bit binary integer size
type ALCsizei = {#type ALCsizei #}

-- | enumerated 32-bit value
type ALCenum = {#type ALCenum #}

-- | 32-bit IEEE754 floating-point
type ALCfloat = {#type ALCfloat #}

-- | 64-bit IEEE754 floating-point
type ALCdouble = {#type ALCdouble #}

-- | void type (for opaque pointers only)
type ALCvoid = {#type ALCvoid #}



-- | Boolean False
pattern ALC_FALSE :: (Eq a, Num a) => a
pattern ALC_FALSE = {#const ALC_FALSE #}

-- | Boolean True
pattern ALC_TRUE :: (Eq a, Num a) => a
pattern ALC_TRUE = {#const ALC_TRUE #}

-- | followed by \<int\> Hz
pattern ALC_FREQUENCY :: (Eq a, Num a) => a
pattern ALC_FREQUENCY = {#const ALC_FREQUENCY #}

-- | followed by \<int\> Hz
pattern ALC_REFRESH :: (Eq a, Num a) => a
pattern ALC_REFRESH = {#const ALC_REFRESH #}

-- | followed by AL_TRUE, AL_FALSE
pattern ALC_SYNC :: (Eq a, Num a) => a
pattern ALC_SYNC = {#const ALC_SYNC #}

-- | followed by \<int\> Num of requested Mono (3D) Sources
pattern ALC_MONO_SOURCES :: (Eq a, Num a) => a
pattern ALC_MONO_SOURCES = {#const ALC_MONO_SOURCES #}

-- | followed by \<int\> Num of requested Stereo Sources
pattern ALC_STEREO_SOURCES :: (Eq a, Num a) => a
pattern ALC_STEREO_SOURCES = {#const ALC_STEREO_SOURCES #}

-- | No error
pattern ALC_NO_ERROR :: (Eq a, Num a) => a
pattern ALC_NO_ERROR = {#const ALC_NO_ERROR #}

-- | No device
pattern ALC_INVALID_DEVICE :: (Eq a, Num a) => a
pattern ALC_INVALID_DEVICE = {#const ALC_INVALID_DEVICE #}

-- | invalid context ID
pattern ALC_INVALID_CONTEXT :: (Eq a, Num a) => a
pattern ALC_INVALID_CONTEXT = {#const ALC_INVALID_CONTEXT #}

-- | bad enum
pattern ALC_INVALID_ENUM :: (Eq a, Num a) => a
pattern ALC_INVALID_ENUM = {#const ALC_INVALID_ENUM #}

-- | bad value
pattern ALC_INVALID_VALUE :: (Eq a, Num a) => a
pattern ALC_INVALID_VALUE = {#const ALC_INVALID_VALUE #}

-- | Out of memory
pattern ALC_OUT_OF_MEMORY :: (Eq a, Num a) => a
pattern ALC_OUT_OF_MEMORY = {#const ALC_OUT_OF_MEMORY #}

-- | The Specifier string for default device
pattern ALC_DEFAULT_DEVICE_SPECIFIER :: (Eq a, Num a) => a
pattern ALC_DEFAULT_DEVICE_SPECIFIER = {#const ALC_DEFAULT_DEVICE_SPECIFIER #}

pattern ALC_DEVICE_SPECIFIER
      , ALC_EXTENSIONS
     :: (Eq a, Num a) => a
pattern ALC_DEVICE_SPECIFIER                 = {#const ALC_DEVICE_SPECIFIER #}
pattern ALC_EXTENSIONS                       = {#const ALC_EXTENSIONS #}

pattern ALC_MAJOR_VERSION
      , ALC_MINOR_VERSION
     :: (Eq a, Num a) => a
pattern ALC_MAJOR_VERSION                    = {#const ALC_MAJOR_VERSION #}
pattern ALC_MINOR_VERSION                    = {#const ALC_MINOR_VERSION #}

pattern ALC_ATTRIBUTES_SIZE
      , ALC_ALL_ATTRIBUTES
     :: (Eq a, Num a) => a
pattern ALC_ATTRIBUTES_SIZE                  = {#const ALC_ATTRIBUTES_SIZE #}
pattern ALC_ALL_ATTRIBUTES                   = {#const ALC_ALL_ATTRIBUTES #}

pattern ALC_DEFAULT_ALL_DEVICES_SPECIFIER
      , ALC_ALL_DEVICES_SPECIFIER
     :: (Eq a, Num a) => a
pattern ALC_DEFAULT_ALL_DEVICES_SPECIFIER    = {#const ALC_DEFAULT_ALL_DEVICES_SPECIFIER #}
pattern ALC_ALL_DEVICES_SPECIFIER            = {#const ALC_ALL_DEVICES_SPECIFIER #}

pattern ALC_CAPTURE_DEVICE_SPECIFIER
      , ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER
      , ALC_CAPTURE_SAMPLES
     :: (Eq a, Num a) => a
pattern ALC_CAPTURE_DEVICE_SPECIFIER         = {#const ALC_CAPTURE_DEVICE_SPECIFIER #}
pattern ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER = {#const ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER #}
pattern ALC_CAPTURE_SAMPLES                  = {#const ALC_CAPTURE_SAMPLES #}



foreign import CALLCV "alc.h alcCreateContext"
  alcCreateContext
    :: Ptr ALCdevice       -- ^ device
    -> Ptr ALCint          -- ^ attrlist
    -> IO (Ptr ALCcontext)

foreign import CALLCV "alc.h alcMakeContextCurrent"
  alcMakeContextCurrent
    :: Ptr ALCcontext -- ^ context
    -> IO ALCboolean

foreign import CALLCV "alc.h alcProcessContext"
  alcProcessContext
    :: Ptr ALCcontext -- ^ context
    -> IO ()

foreign import CALLCV "alc.h alcSuspendContext"
  alcSuspendContext
    :: Ptr ALCcontext -- ^ context
    -> IO ()

foreign import CALLCV "alc.h alcDestroyContext"
  alcDestroyContext
    :: Ptr ALCcontext -- ^ context
    -> IO ()

foreign import CALLCV "alc.h alcGetCurrentContext"
  alcGetCurrentContext :: IO (Ptr ALCcontext)

foreign import CALLCV "alc.h alcGetContextsDevice"
  alcGetContextsDevice
    :: Ptr ALCcontext -- ^ context
    -> IO (Ptr ALCdevice)



foreign import CALLCV "alc.h alcOpenDevice"
  alcOpenDevice
    :: Ptr ALCchar -- ^ devicename
    -> IO (Ptr ALCdevice)

foreign import CALLCV "alc.h alcCloseDevice"
  alcCloseDevice
    :: Ptr ALCdevice -- ^ device
    -> IO ALCboolean



-- | Obtain the most recent Context error
foreign import CALLCV "alc.h alcGetError"
  alcGetError
    :: Ptr ALCdevice -- ^ device
    -> IO ALCenum



foreign import CALLCV "alc.h alcIsExtensionPresent"
  alcIsExtensionPresent
    :: Ptr ALCdevice -- ^ device
    -> Ptr ALCchar   -- ^ extname
    -> IO ALCboolean

foreign import CALLCV "alc.h alcGetProcAddress"
  alcGetProcAddress
    :: Ptr ALCdevice -- ^ device
    -> Ptr ALCchar   -- ^ funcname
    -> IO (FunPtr a)

foreign import CALLCV "alc.h alcGetEnumValue"
  alcGetEnumValue
    :: Ptr ALCdevice -- ^ device
    -> Ptr ALCchar   -- ^ enumname
    -> IO ALCenum



foreign import CALLCV "alc.h alcGetString"
  alcGetString
    :: Ptr ALCdevice    -- ^ device
    -> ALCenum          -- ^ param
    -> IO (Ptr ALCchar)

foreign import CALLCV "alc.h alcGetIntegerv"
  alcGetIntegerv
    :: Ptr ALCdevice -- ^ device
    -> ALCenum       -- ^ param
    -> ALCsizei      -- ^ size
    -> Ptr ALCint    -- ^ data
    -> IO ()



foreign import CALLCV "alc.h alcCaptureOpenDevice"
  alcCaptureOpenDevice
    :: Ptr ALCchar        -- ^ devicename
    -> ALCuint            -- ^ frequency
    -> ALCenum            -- ^ format
    -> ALCsizei           -- ^ buffersize
    -> IO (Ptr ALCdevice)

foreign import CALLCV "alc.h alcCaptureCloseDevice"
  alcCaptureCloseDevice
    :: Ptr ALCdevice -- ^ device
    -> IO ALCboolean

foreign import CALLCV "alc.h alcCaptureStart"
  alcCaptureStart
    :: Ptr ALCdevice -- ^ device
    -> IO ()

foreign import CALLCV "alc.h alcCaptureStop"
  alcCaptureStop
    :: Ptr ALCdevice -- ^ device
    -> IO ()

foreign import CALLCV "alc.h alcCaptureSamples"
  alcCaptureSamples
    :: Ptr ALCdevice -- ^ device
    -> Ptr ALCvoid   -- ^ buffer
    -> ALCsizei      -- ^ samples
    -> IO ()
