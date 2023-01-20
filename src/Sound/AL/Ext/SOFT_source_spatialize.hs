{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_source_spatialize@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_source_spatialize.txt
 -}

module Sound.AL.Ext.SOFT_source_spatialize
  ( pattern AL_SOFT_source_spatialize
    -- * Tokens
  , pattern AL_SOURCE_SPATIALIZE_SOFT

  , pattern AL_AUTO_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_source_spatialize :: Ptr ALchar
pattern AL_SOFT_source_spatialize <- (const False -> True)
  where
    AL_SOFT_source_spatialize = Ptr "AL_SOFT_source_spatialize\0"#


pattern AL_SOURCE_SPATIALIZE_SOFT :: (Eq a, Num a) => a
pattern AL_SOURCE_SPATIALIZE_SOFT = 0x1214

pattern AL_AUTO_SOFT :: (Eq a, Num a) => a
pattern AL_AUTO_SOFT = 0x0002
