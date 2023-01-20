{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_EXT_MULAW_BFORMAT@ extension.
 -}

module Sound.AL.Ext.EXT_MULAW_BFORMAT
  ( pattern AL_EXT_MULAW_BFORMAT
    -- * Tokens
  , pattern AL_FORMAT_BFORMAT2D_MULAW
  , pattern AL_FORMAT_BFORMAT3D_MULAW
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_EXT_MULAW_BFORMAT :: Ptr ALchar
pattern AL_EXT_MULAW_BFORMAT <- (const False -> True)
  where
    AL_EXT_MULAW_BFORMAT = Ptr "AL_EXT_MULAW_BFORMAT\0"#



pattern AL_FORMAT_BFORMAT2D_MULAW
      , AL_FORMAT_BFORMAT3D_MULAW
     :: (Eq a, Num a) => a
pattern AL_FORMAT_BFORMAT2D_MULAW = 0x10031
pattern AL_FORMAT_BFORMAT3D_MULAW = 0x10032
