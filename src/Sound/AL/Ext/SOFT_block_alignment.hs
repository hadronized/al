{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_block_alignment@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_block_alignment.txt
 -}

module Sound.AL.Ext.SOFT_block_alignment
  ( pattern AL_SOFT_BLOCK_ALIGNMENT_EXTENSION_NAME
    -- * Tokens
  , pattern AL_UNPACK_BLOCK_ALIGNMENT_SOFT
  , pattern AL_PACK_BLOCK_ALIGNMENT_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_BLOCK_ALIGNMENT_EXTENSION_NAME :: Ptr ALchar
pattern AL_SOFT_BLOCK_ALIGNMENT_EXTENSION_NAME <- (const False -> True)
  where
    AL_SOFT_BLOCK_ALIGNMENT_EXTENSION_NAME = Ptr "AL_SOFT_block_alignment\0"#



pattern AL_UNPACK_BLOCK_ALIGNMENT_SOFT
      , AL_PACK_BLOCK_ALIGNMENT_SOFT
     :: (Eq a, Num a) => a
pattern AL_UNPACK_BLOCK_ALIGNMENT_SOFT = 0x200C
pattern AL_PACK_BLOCK_ALIGNMENT_SOFT   = 0x200D
