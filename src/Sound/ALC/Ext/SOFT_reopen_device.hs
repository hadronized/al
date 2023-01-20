{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @ALC_SOFT_reopen_device@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_reopen_device.txt
-}

module Sound.ALC.Ext.SOFT_reopen_device
  ( pattern ALC_SOFT_reopen_device
    -- * Procedures
  , ALCReopenDeviceSOFT
  , alcFunReopenDeviceSOFT
  ) where

import           Sound.ALC

import           GHC.Ptr



pattern ALC_SOFT_reopen_device :: Ptr ALCchar
pattern ALC_SOFT_reopen_device <- (const False -> True)
  where
    ALC_SOFT_reopen_device = Ptr "ALC_SOFT_reopen_device\0"#



alcFunReopenDeviceSOFT :: ALCFun ALCReopenDeviceSOFT
alcFunReopenDeviceSOFT = ALCFun (Ptr "alcReopenDeviceSOFT\0"#)

type ALCReopenDeviceSOFT =
          Ptr ALCdevice -- ^ device
       -> Ptr ALCchar   -- ^ deviceName
       -> Ptr ALCint    -- ^ attribs
       -> IO ALCboolean
