{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_UHJ@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_UHJ.txt
 -}

module Sound.AL.Ext.SOFT_UHJ
  ( pattern AL_SOFT_UHJ
    -- * Tokens
  , pattern AL_FORMAT_UHJ2CHN8_SOFT
  , pattern AL_FORMAT_UHJ2CHN16_SOFT
  , pattern AL_FORMAT_UHJ2CHN_FLOAT32_SOFT
  , pattern AL_FORMAT_UHJ3CHN8_SOFT
  , pattern AL_FORMAT_UHJ3CHN16_SOFT
  , pattern AL_FORMAT_UHJ3CHN_FLOAT32_SOFT
  , pattern AL_FORMAT_UHJ4CHN8_SOFT
  , pattern AL_FORMAT_UHJ4CHN16_SOFT
  , pattern AL_FORMAT_UHJ4CHN_FLOAT32_SOFT

  , pattern AL_STEREO_MODE_SOFT

  , pattern AL_SUPER_STEREO_WIDTH_SOFT

  , pattern AL_NORMAL_SOFT
  , pattern AL_SUPER_STEREO_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_UHJ :: Ptr ALchar
pattern AL_SOFT_UHJ <- (const False -> True)
  where
    AL_SOFT_UHJ = Ptr "AL_SOFT_UHJ\0"#


pattern AL_FORMAT_UHJ2CHN8_SOFT
      , AL_FORMAT_UHJ2CHN16_SOFT
      , AL_FORMAT_UHJ2CHN_FLOAT32_SOFT
      , AL_FORMAT_UHJ3CHN8_SOFT
      , AL_FORMAT_UHJ3CHN16_SOFT
      , AL_FORMAT_UHJ3CHN_FLOAT32_SOFT
      , AL_FORMAT_UHJ4CHN8_SOFT
      , AL_FORMAT_UHJ4CHN16_SOFT
      , AL_FORMAT_UHJ4CHN_FLOAT32_SOFT
     :: (Eq a, Num a) => a
pattern AL_FORMAT_UHJ2CHN8_SOFT        = 0x19A2
pattern AL_FORMAT_UHJ2CHN16_SOFT       = 0x19A3
pattern AL_FORMAT_UHJ2CHN_FLOAT32_SOFT = 0x19A4
pattern AL_FORMAT_UHJ3CHN8_SOFT        = 0x19A5
pattern AL_FORMAT_UHJ3CHN16_SOFT       = 0x19A6
pattern AL_FORMAT_UHJ3CHN_FLOAT32_SOFT = 0x19A7
pattern AL_FORMAT_UHJ4CHN8_SOFT        = 0x19A8
pattern AL_FORMAT_UHJ4CHN16_SOFT       = 0x19A9
pattern AL_FORMAT_UHJ4CHN_FLOAT32_SOFT = 0x19AA

pattern AL_STEREO_MODE_SOFT :: (Eq a, Num a) => a
pattern AL_STEREO_MODE_SOFT = 0x19B0

pattern AL_SUPER_STEREO_WIDTH_SOFT :: (Eq a, Num a) => a
pattern AL_SUPER_STEREO_WIDTH_SOFT = 0x19B1

pattern AL_NORMAL_SOFT
      , AL_SUPER_STEREO_SOFT
     :: (Eq a, Num a) => a
pattern AL_NORMAL_SOFT       = 0x0000
pattern AL_SUPER_STEREO_SOFT = 0x0001
