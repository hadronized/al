{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @ALC_SOFT_loopback@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_loopback.txt
 -}

module Sound.ALC.Ext.SOFT_loopback
  ( pattern ALC_SOFT_LOOPBACK_EXTENSION_NAME
    -- * Procedures
  , ALCLoopbackOpenDeviceSOFT
  , alcFunLoopbackOpenDeviceSOFT
  , ALCIsRenderFormatSupportedSOFT
  , alcFunIsRenderFormatSupportedSOFT
  , ALCRenderSamplesSOFT
  , alcFunRenderSamplesSOFT
    -- * Tokens
  , pattern ALC_BYTE_SOFT
  , pattern ALC_UNSIGNED_BYTE_SOFT
  , pattern ALC_SHORT_SOFT
  , pattern ALC_UNSIGNED_SHORT_SOFT
  , pattern ALC_INT_SOFT
  , pattern ALC_UNSIGNED_INT_SOFT
  , pattern ALC_FLOAT_SOFT

  , pattern ALC_MONO_SOFT
  , pattern ALC_STEREO_SOFT
  , pattern ALC_QUAD_SOFT
  , pattern ALC_5POINT1_SOFT
  , pattern ALC_6POINT1_SOFT
  , pattern ALC_7POINT1_SOFT

  , pattern ALC_FORMAT_CHANNELS_SOFT
  , pattern ALC_FORMAT_TYPE_SOFT
  ) where

import           Sound.ALC

import           GHC.Ptr



pattern ALC_SOFT_LOOPBACK_EXTENSION_NAME :: Ptr ALCchar
pattern ALC_SOFT_LOOPBACK_EXTENSION_NAME <- (const False -> True)
  where
    ALC_SOFT_LOOPBACK_EXTENSION_NAME = Ptr "ALC_SOFT_loopback\0"#



alcFunLoopbackOpenDeviceSOFT :: ALCFun ALCLoopbackOpenDeviceSOFT
alcFunLoopbackOpenDeviceSOFT = ALCFun (Ptr "alcLoopbackOpenDeviceSOFT\0"#)

type ALCLoopbackOpenDeviceSOFT =
          Ptr ALCchar        -- ^ deviceName
       -> IO (Ptr ALCdevice)

alcFunIsRenderFormatSupportedSOFT :: ALCFun ALCIsRenderFormatSupportedSOFT
alcFunIsRenderFormatSupportedSOFT = ALCFun (Ptr "alcIsRenderFormatSupportedSOFT\0"#)

type ALCIsRenderFormatSupportedSOFT =
          Ptr ALCdevice -- ^ device
       -> ALCsizei      -- ^ frequency
       -> ALCenum       -- ^ channels
       -> ALCenum       -- ^ type
       -> IO ALCboolean

alcFunRenderSamplesSOFT :: ALCFun ALCRenderSamplesSOFT
alcFunRenderSamplesSOFT = ALCFun (Ptr "alcRenderSamplesSOFT\0"#)

type ALCRenderSamplesSOFT =
          Ptr ALCdevice -- ^ device
       -> Ptr ALCvoid   -- ^ buffer
       -> ALCsizei      -- ^ samples
       -> IO ()



pattern ALC_BYTE_SOFT
      , ALC_UNSIGNED_BYTE_SOFT
      , ALC_SHORT_SOFT
      , ALC_UNSIGNED_SHORT_SOFT
      , ALC_INT_SOFT
      , ALC_UNSIGNED_INT_SOFT
      , ALC_FLOAT_SOFT
     :: (Eq a, Num a) => a
pattern ALC_BYTE_SOFT           = 0x1400
pattern ALC_UNSIGNED_BYTE_SOFT  = 0x1401
pattern ALC_SHORT_SOFT          = 0x1402
pattern ALC_UNSIGNED_SHORT_SOFT = 0x1403
pattern ALC_INT_SOFT            = 0x1404
pattern ALC_UNSIGNED_INT_SOFT   = 0x1405
pattern ALC_FLOAT_SOFT          = 0x1406

pattern ALC_MONO_SOFT
      , ALC_STEREO_SOFT
      , ALC_QUAD_SOFT
      , ALC_5POINT1_SOFT
      , ALC_6POINT1_SOFT
      , ALC_7POINT1_SOFT
     :: (Eq a, Num a) => a
pattern ALC_MONO_SOFT    = 0x1500
pattern ALC_STEREO_SOFT  = 0x1501
pattern ALC_QUAD_SOFT    = 0x1503
pattern ALC_5POINT1_SOFT = 0x1504
pattern ALC_6POINT1_SOFT = 0x1505
pattern ALC_7POINT1_SOFT = 0x1506

pattern ALC_FORMAT_CHANNELS_SOFT
      , ALC_FORMAT_TYPE_SOFT
     :: (Eq a, Num a) => a
pattern ALC_FORMAT_CHANNELS_SOFT = 0x1990
pattern ALC_FORMAT_TYPE_SOFT     = 0x1991
