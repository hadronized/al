{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @ALC_SOFT_HRTF@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_HRTF.txt
-}

module Sound.ALC.Ext.SOFT_HRTF
  ( pattern ALC_SOFT_HRTF
    -- * Procedures
  , ALCGetStringiSOFT
  , alcFunGetStringiSOFT
  , ALCResetDeviceSOFT
  , alcFunResetDeviceSOFT
    -- * Tokens
  , pattern ALC_HRTF_SOFT

  , pattern ALC_HRTF_ID_SOFT

  , pattern ALC_DONT_CARE_SOFT

  , pattern ALC_HRTF_STATUS_SOFT
  , pattern ALC_NUM_HRTF_SPECIFIERS_SOFT

  , pattern ALC_HRTF_SPECIFIER_SOFT

  , pattern ALC_HRTF_DISABLED_SOFT
  , pattern ALC_HRTF_ENABLED_SOFT
  , pattern ALC_HRTF_DENIED_SOFT
  , pattern ALC_HRTF_REQUIRED_SOFT
  , pattern ALC_HRTF_HEADPHONES_DETECTED_SOFT
  , pattern ALC_HRTF_UNSUPPORTED_FORMAT_SOFT
  ) where

import           Sound.ALC

import           GHC.Ptr



pattern ALC_SOFT_HRTF :: Ptr ALCchar
pattern ALC_SOFT_HRTF <- (const False -> True)
  where
    ALC_SOFT_HRTF = Ptr "ALC_SOFT_HRTF\0"#



alcFunGetStringiSOFT :: ALCFun ALCGetStringiSOFT
alcFunGetStringiSOFT = ALCFun (Ptr "alcGetStringiSOFT\0"#)

type ALCGetStringiSOFT =
          Ptr ALCdevice    -- ^ device
       -> ALCenum          -- ^ paramName
       -> ALCsizei         -- ^ index
       -> IO (Ptr ALCchar)

alcFunResetDeviceSOFT :: ALCFun ALCResetDeviceSOFT
alcFunResetDeviceSOFT = ALCFun (Ptr "alcResetDeviceSOFT\0"#)

type ALCResetDeviceSOFT =
          Ptr ALCdevice -- ^ device
       -> Ptr ALCint    -- ^ attrList
       -> IO ALCboolean



pattern ALC_HRTF_SOFT :: (Eq a, Num a) => a
pattern ALC_HRTF_SOFT = 0x1992

pattern ALC_HRTF_ID_SOFT :: (Eq a, Num a) => a
pattern ALC_HRTF_ID_SOFT = 0x1996

pattern ALC_DONT_CARE_SOFT :: (Eq a, Num a) => a
pattern ALC_DONT_CARE_SOFT = 0x0002

pattern ALC_HRTF_STATUS_SOFT
      , ALC_NUM_HRTF_SPECIFIERS_SOFT
     :: (Eq a, Num a) => a
pattern ALC_HRTF_STATUS_SOFT         = 0x1993
pattern ALC_NUM_HRTF_SPECIFIERS_SOFT = 0x1994

pattern ALC_HRTF_SPECIFIER_SOFT :: (Eq a, Num a) => a
pattern ALC_HRTF_SPECIFIER_SOFT = 0x1995

pattern ALC_HRTF_DISABLED_SOFT
      , ALC_HRTF_ENABLED_SOFT
      , ALC_HRTF_DENIED_SOFT
      , ALC_HRTF_REQUIRED_SOFT
      , ALC_HRTF_HEADPHONES_DETECTED_SOFT
      , ALC_HRTF_UNSUPPORTED_FORMAT_SOFT
     :: (Eq a, Num a) => a
pattern ALC_HRTF_DISABLED_SOFT            = 0x0000
pattern ALC_HRTF_ENABLED_SOFT             = 0x0001
pattern ALC_HRTF_DENIED_SOFT              = 0x0002
pattern ALC_HRTF_REQUIRED_SOFT            = 0x0003
pattern ALC_HRTF_HEADPHONES_DETECTED_SOFT = 0x0004
pattern ALC_HRTF_UNSUPPORTED_FORMAT_SOFT  = 0x0005
