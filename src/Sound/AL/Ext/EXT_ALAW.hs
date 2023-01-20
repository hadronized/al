{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_EXT_ALAW@ extension.
 -}

module Sound.AL.Ext.EXT_ALAW
  ( pattern AL_EXT_ALAW
    -- * Tokens
  , pattern AL_FORMAT_MONO_ALAW_EXT
  , pattern AL_FORMAT_STEREO_ALAW_EXT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_EXT_ALAW :: Ptr ALchar
pattern AL_EXT_ALAW <- (const False -> True)
  where
    AL_EXT_ALAW = Ptr "AL_EXT_ALAW\0"#



pattern AL_FORMAT_MONO_ALAW_EXT
      , AL_FORMAT_STEREO_ALAW_EXT
     :: (Eq a, Num a) => a
pattern AL_FORMAT_MONO_ALAW_EXT   = 0x10016
pattern AL_FORMAT_STEREO_ALAW_EXT = 0x10017
