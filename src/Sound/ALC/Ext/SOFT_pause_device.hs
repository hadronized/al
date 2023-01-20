{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @ALC_SOFT_pause_device@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_pause_device.txt
-}

module Sound.ALC.Ext.SOFT_pause_device
  ( pattern ALC_SOFT_pause_device
    -- * Procedures
  , ALCDevicePauseSOFT
  , alcFunDevicePauseSOFT
  , ALCDeviceResumeSOFT
  , alcFunDeviceResumeSOFT
  ) where

import           Sound.ALC

import           GHC.Ptr



pattern ALC_SOFT_pause_device :: Ptr ALCchar
pattern ALC_SOFT_pause_device <- (const False -> True)
  where
    ALC_SOFT_pause_device = Ptr "ALC_SOFT_pause_device\0"#



alcFunDevicePauseSOFT :: ALCFun ALCDevicePauseSOFT
alcFunDevicePauseSOFT = ALCFun (Ptr "alcDevicePauseSOFT\0"#)

type ALCDevicePauseSOFT =
          Ptr ALCdevice -- ^ device
       -> IO ()

alcFunDeviceResumeSOFT :: ALCFun ALCDeviceResumeSOFT
alcFunDeviceResumeSOFT = ALCFun (Ptr "alcDeviceResumeSOFT\0"#)

type ALCDeviceResumeSOFT =
          Ptr ALCdevice -- ^ device
       -> IO ()
