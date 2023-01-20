{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @ALC_SOFT_loopback_bformat@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_loopback_bformat.txt
 -}

module Sound.ALC.Ext.SOFT_loopback_bformat
  ( pattern ALC_SOFT_loopback_bformat
    -- * Tokens
  , pattern ALC_BFORMAT3D_SOFT

  , pattern ALC_AMBISONIC_LAYOUT_SOFT
  , pattern ALC_AMBISONIC_SCALING_SOFT
  , pattern ALC_AMBISONIC_ORDER_SOFT

  , pattern ALC_FUMA_SOFT
  , pattern ALC_ACN_SOFT

  , pattern ALC_SN3D_SOFT
  , pattern ALC_N3D_SOFT

  , pattern ALC_MAX_AMBISONIC_ORDER_SOFT
  ) where

import           Sound.ALC

import           GHC.Ptr



pattern ALC_SOFT_loopback_bformat :: Ptr ALCchar
pattern ALC_SOFT_loopback_bformat <- (const False -> True)
  where
    ALC_SOFT_loopback_bformat = Ptr "ALC_SOFT_loopback_bformat\0"#



pattern ALC_BFORMAT3D_SOFT :: (Eq a, Num a) => a
pattern ALC_BFORMAT3D_SOFT = 0x1507

pattern ALC_AMBISONIC_LAYOUT_SOFT
      , ALC_AMBISONIC_SCALING_SOFT
      , ALC_AMBISONIC_ORDER_SOFT
     :: (Eq a, Num a) => a
pattern ALC_AMBISONIC_LAYOUT_SOFT  = 0x1997
pattern ALC_AMBISONIC_SCALING_SOFT = 0x1998
pattern ALC_AMBISONIC_ORDER_SOFT   = 0x1999

pattern ALC_FUMA_SOFT
      , ALC_ACN_SOFT
     :: (Eq a, Num a) => a
pattern ALC_FUMA_SOFT = 0x0000
pattern ALC_ACN_SOFT  = 0x0001

pattern ALC_SN3D_SOFT
      , ALC_N3D_SOFT
     :: (Eq a, Num a) => a
pattern ALC_SN3D_SOFT = 0x0001
pattern ALC_N3D_SOFT  = 0x0002

pattern ALC_MAX_AMBISONIC_ORDER_SOFT :: (Eq a, Num a) => a
pattern ALC_MAX_AMBISONIC_ORDER_SOFT = 0x199B
