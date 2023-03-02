{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_EXT_BFORMAT@ extension.

    Provides support for B-Format ambisonic buffers (first-order, FuMa scaling
    and layout).

    'BFORMAT2D_8': Unsigned 8-bit, 3-channel non-periphonic (WXY).
    'BFORMAT2D_16': Signed 16-bit, 3-channel non-periphonic (WXY).
    'BFORMAT2D_FLOAT32': 32-bit float, 3-channel non-periphonic (WXY).
    'BFORMAT3D_8': Unsigned 8-bit, 4-channel periphonic (WXYZ).
    'BFORMAT3D_16': Signed 16-bit, 4-channel periphonic (WXYZ).
    'BFORMAT3D_FLOAT32': 32-bit float, 4-channel periphonic (WXYZ).
 -}

module Sound.AL.Ext.EXT_BFORMAT
  ( pattern AL_EXT_BFORMAT_EXTENSION_NAME
    -- * Tokens
  , pattern AL_FORMAT_BFORMAT2D_8
  , pattern AL_FORMAT_BFORMAT2D_16
  , pattern AL_FORMAT_BFORMAT2D_FLOAT32
  , pattern AL_FORMAT_BFORMAT3D_8
  , pattern AL_FORMAT_BFORMAT3D_16
  , pattern AL_FORMAT_BFORMAT3D_FLOAT32
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_EXT_BFORMAT_EXTENSION_NAME :: Ptr ALchar
pattern AL_EXT_BFORMAT_EXTENSION_NAME <- (const False -> True)
  where
    AL_EXT_BFORMAT_EXTENSION_NAME = Ptr "AL_EXT_BFORMAT\0"#



pattern AL_FORMAT_BFORMAT2D_8
      , AL_FORMAT_BFORMAT2D_16
      , AL_FORMAT_BFORMAT2D_FLOAT32
      , AL_FORMAT_BFORMAT3D_8
      , AL_FORMAT_BFORMAT3D_16
      , AL_FORMAT_BFORMAT3D_FLOAT32
     :: (Eq a, Num a) => a
pattern AL_FORMAT_BFORMAT2D_8       = 0x20021
pattern AL_FORMAT_BFORMAT2D_16      = 0x20022
pattern AL_FORMAT_BFORMAT2D_FLOAT32 = 0x20023
pattern AL_FORMAT_BFORMAT3D_8       = 0x20031
pattern AL_FORMAT_BFORMAT3D_16      = 0x20032
pattern AL_FORMAT_BFORMAT3D_FLOAT32 = 0x20033
