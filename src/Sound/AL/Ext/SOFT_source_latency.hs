{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_source_latency@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_source_latency.txt
 -}

module Sound.AL.Ext.SOFT_source_latency
  ( pattern AL_SOFT_source_latency
    -- * Primitive types
  , ALint64SOFT
  , ALuint64SOFT
    -- * Procedures
  , ALSourcedSOFT
  , alFunSourcedSOFT
  , ALSource3dSOFT
  , alFunSource3dSOFT
  , ALSourcedvSOFT
  , alFunSourcedvSOFT
  , ALGetSourcedSOFT
  , alFunGetSourcedSOFT
  , ALGetSource3dSOFT
  , alFunGetSource3dSOFT
  , ALGetSourcedvSOFT
  , alFunGetSourcedvSOFT
  , ALSourcei64SOFT
  , alFunSourcei64SOFT
  , ALSource3i64SOFT
  , alFunSource3i64SOFT
  , ALSourcei64vSOFT
  , alFunSourcei64vSOFT
  , ALGetSourcei64SOFT
  , alFunGetSourcei64SOFT
  , ALGetSource3i64SOFT
  , alFunGetSource3i64SOFT
  , ALGetSourcei64vSOFT
  , alFunGetSourcei64vSOFT
    -- * Tokens
  , pattern AL_SAMPLE_OFFSET_LATENCY_SOFT
  , pattern AL_SEC_OFFSET_LATENCY_SOFT
  ) where

import           Sound.AL

import           Data.Int
import           Data.Word
import           GHC.Ptr



pattern AL_SOFT_source_latency :: Ptr ALchar
pattern AL_SOFT_source_latency <- (const False -> True)
  where
    AL_SOFT_source_latency = Ptr "AL_SOFT_source_latency\0"#



type ALint64SOFT  = Int64

type ALuint64SOFT = Word64



alFunSourcedSOFT :: ALFun ALSourcedSOFT
alFunSourcedSOFT = ALFun (Ptr "alSourcedSOFT\0"#)

type ALSourcedSOFT =
          ALuint   -- ^ source
       -> ALenum   -- ^ param
       -> ALdouble -- ^ value
       -> IO ()

alFunSource3dSOFT :: ALFun ALSource3dSOFT
alFunSource3dSOFT = ALFun (Ptr "alSource3dSOFT\0"#)

type ALSource3dSOFT =
          ALuint   -- ^ source
       -> ALenum   -- ^ param
       -> ALdouble -- ^ value1
       -> ALdouble -- ^ value2
       -> ALdouble -- ^ value3
       -> IO ()

alFunSourcedvSOFT :: ALFun ALSourcedvSOFT
alFunSourcedvSOFT = ALFun (Ptr "alSourcedvSOFT\0"#)

type ALSourcedvSOFT =
          ALuint       -- ^ source
       -> ALenum       -- ^ param
       -> Ptr ALdouble -- ^ values
       -> IO ()

alFunGetSourcedSOFT :: ALFun ALGetSourcedSOFT
alFunGetSourcedSOFT = ALFun (Ptr "alGetSourcedSOFT\0"#)

type ALGetSourcedSOFT =
          ALuint       -- ^ source
       -> ALenum       -- ^ param
       -> Ptr ALdouble -- ^ value
       -> IO ()

alFunGetSource3dSOFT :: ALFun ALGetSource3dSOFT
alFunGetSource3dSOFT = ALFun (Ptr "alGetSource3dSOFT\0"#)

type ALGetSource3dSOFT =
          ALuint       -- ^ source
       -> ALenum       -- ^ param
       -> Ptr ALdouble -- ^ value1
       -> Ptr ALdouble -- ^ value2
       -> Ptr ALdouble -- ^ value3
       -> IO ()

alFunGetSourcedvSOFT :: ALFun ALGetSourcedvSOFT
alFunGetSourcedvSOFT = ALFun (Ptr "alGetSourcedvSOFT\0"#)

type ALGetSourcedvSOFT =
          ALuint       -- ^ source
       -> ALenum       -- ^ param
       -> Ptr ALdouble -- ^ values
       -> IO ()

alFunSourcei64SOFT :: ALFun ALSourcei64SOFT
alFunSourcei64SOFT = ALFun (Ptr "alSourcei64SOFT\0"#)

type ALSourcei64SOFT =
          ALuint      -- ^ source
       -> ALenum      -- ^ param
       -> ALint64SOFT -- ^ value
       -> IO ()

alFunSource3i64SOFT :: ALFun ALSource3i64SOFT
alFunSource3i64SOFT = ALFun (Ptr "alSource3i64SOFT\0"#)

type ALSource3i64SOFT =
          ALuint      -- ^ source
       -> ALenum      -- ^ param
       -> ALint64SOFT -- ^ value1
       -> ALint64SOFT -- ^ value2
       -> ALint64SOFT -- ^ value3
       -> IO ()

alFunSourcei64vSOFT :: ALFun ALSourcei64vSOFT
alFunSourcei64vSOFT = ALFun (Ptr "alSourcei64vSOFT\0"#)

type ALSourcei64vSOFT =
          ALuint          -- ^ source
       -> ALenum          -- ^ param
       -> Ptr ALint64SOFT -- ^ values
       -> IO ()

alFunGetSourcei64SOFT :: ALFun ALGetSourcei64SOFT
alFunGetSourcei64SOFT = ALFun (Ptr "alGetSourcei64SOFT\0"#)

type ALGetSourcei64SOFT =
          ALuint          -- ^ source
       -> ALenum          -- ^ param
       -> Ptr ALint64SOFT -- ^ value
       -> IO ()

alFunGetSource3i64SOFT :: ALFun ALGetSource3i64SOFT
alFunGetSource3i64SOFT = ALFun (Ptr "alGetSource3i64SOFT\0"#)

type ALGetSource3i64SOFT =
          ALuint          -- ^ source
       -> ALenum          -- ^ param
       -> Ptr ALint64SOFT -- ^ value1
       -> Ptr ALint64SOFT -- ^ value2
       -> Ptr ALint64SOFT -- ^ value3
       -> IO ()

alFunGetSourcei64vSOFT :: ALFun ALGetSourcei64vSOFT
alFunGetSourcei64vSOFT = ALFun (Ptr "alGetSourcei64vSOFT\0"#)

type ALGetSourcei64vSOFT =
          ALuint          -- ^ source
       -> ALenum          -- ^ param
       -> Ptr ALint64SOFT -- ^ values
       -> IO ()



pattern AL_SAMPLE_OFFSET_LATENCY_SOFT :: (Eq a, Num a) => a
pattern AL_SAMPLE_OFFSET_LATENCY_SOFT = 0x1200

pattern AL_SEC_OFFSET_LATENCY_SOFT :: (Eq a, Num a) => a
pattern AL_SEC_OFFSET_LATENCY_SOFT = 0x1201
