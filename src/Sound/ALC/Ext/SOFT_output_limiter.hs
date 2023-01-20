{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @ALC_SOFT_output_limiter@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_output_limiter.txt
 -}

module Sound.ALC.Ext.SOFT_output_limiter
  ( pattern ALC_SOFT_output_limiter
    -- * Procedures
  , ALCResetDeviceSOFT
  , alcFunResetDeviceSOFT
    -- * Tokens
  , pattern ALC_OUTPUT_LIMITER_SOFT
  , pattern ALC_DONT_CARE_SOFT
  ) where

import           Sound.ALC
import           Sound.ALC.Ext.SOFT_HRTF

import           GHC.Ptr



pattern ALC_SOFT_output_limiter :: Ptr ALCchar
pattern ALC_SOFT_output_limiter <- (const False -> True)
  where
    ALC_SOFT_output_limiter = Ptr "ALC_SOFT_output_limiter\0"#



pattern ALC_OUTPUT_LIMITER_SOFT :: (Eq a, Num a) => a
pattern ALC_OUTPUT_LIMITER_SOFT = 0x199A
