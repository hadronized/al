{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_EXT_source_distance_model@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/EXT_source_distance_model.txt
 -}

module Sound.AL.Ext.EXT_source_distance_model
  ( pattern AL_EXT_source_distance_model
    -- * Tokens
  , pattern AL_SOURCE_DISTANCE_MODEL
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_EXT_source_distance_model :: Ptr ALchar
pattern AL_EXT_source_distance_model <- (const False -> True)
  where
    AL_EXT_source_distance_model = Ptr "AL_EXT_source_distance_model\0"#



pattern AL_SOURCE_DISTANCE_MODEL :: (Eq a, Num a) => a
pattern AL_SOURCE_DISTANCE_MODEL = 0x200
