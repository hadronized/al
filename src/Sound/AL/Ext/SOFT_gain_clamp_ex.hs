{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_gain_clamp_ex@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_gain_clamp_ex.txt
 -}

module Sound.AL.Ext.SOFT_gain_clamp_ex
  ( pattern AL_SOFT_GAIN_CLAMP_EX_EXTENSION_NAME
    -- * Tokens
  , pattern AL_GAIN_LIMIT_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_GAIN_CLAMP_EX_EXTENSION_NAME :: Ptr ALchar
pattern AL_SOFT_GAIN_CLAMP_EX_EXTENSION_NAME <- (const False -> True)
  where
    AL_SOFT_GAIN_CLAMP_EX_EXTENSION_NAME = Ptr "AL_SOFT_gain_clamp_ex\0"#



pattern AL_GAIN_LIMIT_SOFT :: (Eq a, Num a) => a
pattern AL_GAIN_LIMIT_SOFT = 0x200E
