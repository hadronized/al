{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_effect_target@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_effect_target.txt
 -}

module Sound.AL.Ext.SOFT_effect_target
  ( pattern AL_SOFT_effect_target
    -- * Tokens
  , pattern AL_EFFECTSLOT_TARGET_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_effect_target :: Ptr ALchar
pattern AL_SOFT_effect_target <- (const False -> True)
  where
    AL_SOFT_effect_target = Ptr "AL_SOFT_effect_target\0"#



pattern AL_EFFECTSLOT_TARGET_SOFT :: (Eq a, Num a) => a
pattern AL_EFFECTSLOT_TARGET_SOFT = 0x199C
