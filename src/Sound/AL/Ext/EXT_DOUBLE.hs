{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_EXT_DOUBLE@ extension.
 -}

module Sound.AL.Ext.EXT_DOUBLE
  ( pattern AL_EXT_DOUBLE_EXTENSION_NAME
    -- * Tokens
  , pattern AL_FORMAT_MONO_DOUBLE_EXT
  , pattern AL_FORMAT_STEREO_DOUBLE_EXT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_EXT_DOUBLE_EXTENSION_NAME :: Ptr ALchar
pattern AL_EXT_DOUBLE_EXTENSION_NAME <- (const False -> True)
  where
    AL_EXT_DOUBLE_EXTENSION_NAME = Ptr "AL_EXT_DOUBLE\0"#



pattern AL_FORMAT_MONO_DOUBLE_EXT
      , AL_FORMAT_STEREO_DOUBLE_EXT
     :: (Eq a, Num a) => a
pattern AL_FORMAT_MONO_DOUBLE_EXT   = 0x10012
pattern AL_FORMAT_STEREO_DOUBLE_EXT = 0x10013
