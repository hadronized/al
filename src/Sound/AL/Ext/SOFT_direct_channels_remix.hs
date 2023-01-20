{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_direct_channels_remix@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_direct_channels_remix.txt
 -}

module Sound.AL.Ext.SOFT_direct_channels_remix
  ( pattern AL_SOFT_direct_channels_remix
    -- * Tokens
  , pattern AL_DROP_UNMATCHED_SOFT
  , pattern AL_REMIX_UNMATCHED_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_direct_channels_remix :: Ptr ALchar
pattern AL_SOFT_direct_channels_remix <- (const False -> True)
  where
    AL_SOFT_direct_channels_remix = Ptr "AL_SOFT_direct_channels_remix\0"#



pattern AL_DROP_UNMATCHED_SOFT
      , AL_REMIX_UNMATCHED_SOFT
     :: (Eq a, Num a) => a
pattern AL_DROP_UNMATCHED_SOFT  = 0x0001
pattern AL_REMIX_UNMATCHED_SOFT = 0x0002
