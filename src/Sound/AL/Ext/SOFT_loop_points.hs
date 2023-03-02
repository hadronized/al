{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_loop_points@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_loop_points.txt
 -}

module Sound.AL.Ext.SOFT_loop_points
  ( pattern AL_SOFT_LOOP_POINTS_EXTENSION_NAME
    -- * Tokens
  , pattern AL_LOOP_POINTS_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_LOOP_POINTS_EXTENSION_NAME :: Ptr ALchar
pattern AL_SOFT_LOOP_POINTS_EXTENSION_NAME <- (const False -> True)
  where
    AL_SOFT_LOOP_POINTS_EXTENSION_NAME = Ptr "AL_SOFT_loop_points\0"#



pattern AL_LOOP_POINTS_SOFT :: (Eq a, Num a) => a
pattern AL_LOOP_POINTS_SOFT = 0x2015
