{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_bformat_ex@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_bformat_ex.txt
 -}

module Sound.AL.Ext.SOFT_bformat_ex
  ( pattern AL_SOFT_BFORMAT_EX_EXTENSION_NAME
    -- * Tokens
  , pattern AL_AMBISONIC_LAYOUT_SOFT
  , pattern AL_AMBISONIC_SCALING_SOFT

  , pattern AL_FUMA_SOFT

  , pattern AL_ACN_SOFT

  , pattern AL_SN3D_SOFT
  , pattern AL_N3D_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_BFORMAT_EX_EXTENSION_NAME :: Ptr ALchar
pattern AL_SOFT_BFORMAT_EX_EXTENSION_NAME <- (const False -> True)
  where
    AL_SOFT_BFORMAT_EX_EXTENSION_NAME = Ptr "AL_SOFT_bformat_ex\0"#



pattern AL_AMBISONIC_LAYOUT_SOFT
      , AL_AMBISONIC_SCALING_SOFT
     :: (Eq a, Num a) => a
pattern AL_AMBISONIC_LAYOUT_SOFT  = 0x1997
pattern AL_AMBISONIC_SCALING_SOFT = 0x1998

pattern AL_FUMA_SOFT :: (Eq a, Num a) => a
pattern AL_FUMA_SOFT = 0x0000

pattern AL_ACN_SOFT :: (Eq a, Num a) => a
pattern AL_ACN_SOFT = 0x0001

pattern AL_SN3D_SOFT
      , AL_N3D_SOFT
     :: (Eq a, Num a) => a
pattern AL_SN3D_SOFT = 0x0001
pattern AL_N3D_SOFT  = 0x0002
