{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_EXT_FLOAT32@ extension.
 -}

module Sound.AL.Ext.EXT_FLOAT32
  ( pattern AL_EXT_FLOAT32_EXTENSION_NAME
    -- * Tokens
  , pattern AL_FORMAT_MONO_FLOAT32
  , pattern AL_FORMAT_STEREO_FLOAT32
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_EXT_FLOAT32_EXTENSION_NAME :: Ptr ALchar
pattern AL_EXT_FLOAT32_EXTENSION_NAME <- (const False -> True)
  where
    AL_EXT_FLOAT32_EXTENSION_NAME = Ptr "AL_EXT_FLOAT32\0"#



pattern AL_FORMAT_MONO_FLOAT32
      , AL_FORMAT_STEREO_FLOAT32
     :: (Eq a, Num a) => a
pattern AL_FORMAT_MONO_FLOAT32   = 0x10010
pattern AL_FORMAT_STEREO_FLOAT32 = 0x10011
