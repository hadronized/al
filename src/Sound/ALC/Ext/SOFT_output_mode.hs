{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @ALC_SOFT_output_mode@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_output_mode.txt
 -}

module Sound.ALC.Ext.SOFT_output_mode
  ( pattern ALC_SOFT_OUTPUT_MODE_EXTENSION_NAME
    -- * Tokens
  , pattern ALC_OUTPUT_MODE_SOFT

  , pattern ALC_ANY_SOFT
  , pattern ALC_MONO_SOFT
  , pattern ALC_STEREO_SOFT
  , pattern ALC_STEREO_BASIC_SOFT
  , pattern ALC_STEREO_UHJ_SOFT
  , pattern ALC_STEREO_HRTF_SOFT
  , pattern ALC_QUAD_SOFT
  , pattern ALC_SURROUND_5_1_SOFT
  , pattern ALC_SURROUND_6_1_SOFT
  , pattern ALC_SURROUND_7_1_SOFT
  ) where

import           Sound.ALC

import           GHC.Ptr



pattern ALC_SOFT_OUTPUT_MODE_EXTENSION_NAME :: Ptr ALCchar
pattern ALC_SOFT_OUTPUT_MODE_EXTENSION_NAME <- (const False -> True)
  where
    ALC_SOFT_OUTPUT_MODE_EXTENSION_NAME = Ptr "ALC_SOFT_output_mode\0"#



pattern ALC_OUTPUT_MODE_SOFT :: (Eq a, Num a) => a
pattern ALC_OUTPUT_MODE_SOFT = 0x19AC

pattern ALC_ANY_SOFT
      , ALC_MONO_SOFT
      , ALC_STEREO_SOFT
      , ALC_STEREO_BASIC_SOFT
      , ALC_STEREO_UHJ_SOFT
      , ALC_STEREO_HRTF_SOFT
      , ALC_QUAD_SOFT
      , ALC_SURROUND_5_1_SOFT
      , ALC_SURROUND_6_1_SOFT
      , ALC_SURROUND_7_1_SOFT
     :: (Eq a, Num a) => a
pattern ALC_ANY_SOFT          = 0x19AD
pattern ALC_MONO_SOFT         = 0x1500
pattern ALC_STEREO_SOFT       = 0x1501
pattern ALC_STEREO_BASIC_SOFT = 0x19AE
pattern ALC_STEREO_UHJ_SOFT   = 0x19AF
pattern ALC_STEREO_HRTF_SOFT  = 0x19B2
pattern ALC_QUAD_SOFT         = 0x1503
pattern ALC_SURROUND_5_1_SOFT = 0x1504
pattern ALC_SURROUND_6_1_SOFT = 0x1505
pattern ALC_SURROUND_7_1_SOFT = 0x1506
