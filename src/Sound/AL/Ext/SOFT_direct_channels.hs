{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_direct_channels@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_direct_channels.txt
 -}

module Sound.AL.Ext.SOFT_direct_channels
  ( pattern AL_SOFT_direct_channels
    -- * Tokens
  , pattern AL_DIRECT_CHANNELS_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_direct_channels :: Ptr ALchar
pattern AL_SOFT_direct_channels <- (const False -> True)
  where
    AL_SOFT_direct_channels = Ptr "AL_SOFT_direct_channels\0"#



pattern AL_DIRECT_CHANNELS_SOFT :: (Eq a, Num a) => a
pattern AL_DIRECT_CHANNELS_SOFT = 0x1033
