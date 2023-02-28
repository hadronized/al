{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_EXT_MULAW@ extension.
 -}

module Sound.AL.Ext.EXT_MULAW
  ( pattern AL_EXT_MULAW_EXTENSION_NAME
    -- * Tokens
  , pattern AL_FORMAT_MONO_MULAW_EXT
  , pattern AL_FORMAT_STEREO_MULAW_EXT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_EXT_MULAW_EXTENSION_NAME :: Ptr ALchar
pattern AL_EXT_MULAW_EXTENSION_NAME <- (const False -> True)
  where
    AL_EXT_MULAW_EXTENSION_NAME = Ptr "AL_EXT_MULAW\0"#



pattern AL_FORMAT_MONO_MULAW_EXT
      , AL_FORMAT_STEREO_MULAW_EXT
     :: (Eq a, Num a) => a
pattern AL_FORMAT_MONO_MULAW_EXT   = 0x10014
pattern AL_FORMAT_STEREO_MULAW_EXT = 0x10015
