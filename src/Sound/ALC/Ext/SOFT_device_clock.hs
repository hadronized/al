{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @ALC_SOFT_device_clock@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_device_clock.txt
-}

module Sound.ALC.Ext.SOFT_device_clock
  ( pattern ALC_SOFT_DEVICE_CLOCK_EXTENSION_NAME
    -- * Primitive types
  , ALCint64SOFT
  , ALCuint64SOFT
    -- * Procedures
  , alcFunGetInteger64vSOFT
  , ALCGetInteger64vSOFT
    -- * Tokens
  , pattern ALC_DEVICE_CLOCK_SOFT
  , pattern ALC_DEVICE_LATENCY_SOFT
  , pattern ALC_DEVICE_CLOCK_LATENCY_SOFT
  , pattern AL_SAMPLE_OFFSET_CLOCK_SOFT
  , pattern AL_SEC_OFFSET_CLOCK_SOFT
  ) where

import           Sound.ALC

import           Data.Int
import           Data.Word
import           GHC.Ptr



pattern ALC_SOFT_DEVICE_CLOCK_EXTENSION_NAME :: Ptr ALCchar
pattern ALC_SOFT_DEVICE_CLOCK_EXTENSION_NAME <- (const False -> True)
  where
    ALC_SOFT_DEVICE_CLOCK_EXTENSION_NAME = Ptr "ALC_SOFT_device_clock\0"#



type ALCint64SOFT  = Int64
type ALCuint64SOFT = Word64



alcFunGetInteger64vSOFT :: ALCFun ALCGetInteger64vSOFT
alcFunGetInteger64vSOFT = ALCFun (Ptr "alcGetInteger64vSOFT\0"#)

type ALCGetInteger64vSOFT =
          Ptr ALCdevice    -- ^ device
       -> ALCenum          -- ^ pname
       -> ALCsizei         -- ^ size
       -> Ptr ALCint64SOFT -- ^ values
       -> IO ()



pattern ALC_DEVICE_CLOCK_SOFT :: (Eq a, Num a) => a
pattern ALC_DEVICE_CLOCK_SOFT = 0x1600

pattern ALC_DEVICE_LATENCY_SOFT :: (Eq a, Num a) => a
pattern ALC_DEVICE_LATENCY_SOFT = 0x1601

pattern ALC_DEVICE_CLOCK_LATENCY_SOFT :: (Eq a, Num a) => a
pattern ALC_DEVICE_CLOCK_LATENCY_SOFT = 0x1602

pattern AL_SAMPLE_OFFSET_CLOCK_SOFT :: (Eq a, Num a) => a
pattern AL_SAMPLE_OFFSET_CLOCK_SOFT = 0x1202

pattern AL_SEC_OFFSET_CLOCK_SOFT :: (Eq a, Num a) => a
pattern AL_SEC_OFFSET_CLOCK_SOFT = 0x1203
