{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_source_length@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_output_mode.txt
 -}

module Sound.AL.Ext.SOFT_source_length
  ( pattern AL_SOFT_SOURCE_LENGTH_EXTENSION_NAME
    -- * Tokens
  , pattern AL_BYTE_LENGTH_SOFT
  , pattern AL_SAMPLE_LENGTH_SOFT

  , pattern AL_SEC_LENGTH_SOFT
  ) where

import           Sound.AL
import           Sound.AL.Ext.SOFT_buffer_samples

import           GHC.Ptr



pattern AL_SOFT_SOURCE_LENGTH_EXTENSION_NAME :: Ptr ALchar
pattern AL_SOFT_SOURCE_LENGTH_EXTENSION_NAME <- (const False -> True)
  where
    AL_SOFT_SOURCE_LENGTH_EXTENSION_NAME = Ptr "AL_SOFT_source_length\0"#
