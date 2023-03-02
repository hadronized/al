{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_EXT_IMA4@ extension.
 -}

module Sound.AL.Ext.EXT_IMA4
  ( pattern AL_EXT_IMA4_EXTENSION_NAME
    -- * Tokens
  , pattern AL_FORMAT_MONO_IMA4
  , pattern AL_FORMAT_STEREO_IMA4
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_EXT_IMA4_EXTENSION_NAME :: Ptr ALchar
pattern AL_EXT_IMA4_EXTENSION_NAME <- (const False -> True)
  where
    AL_EXT_IMA4_EXTENSION_NAME = Ptr "AL_EXT_IMA4\0"#



pattern AL_FORMAT_MONO_IMA4
      , AL_FORMAT_STEREO_IMA4
     :: (Eq a, Num a) => a
pattern AL_FORMAT_MONO_IMA4   = 0x1300
pattern AL_FORMAT_STEREO_IMA4 = 0x1301
