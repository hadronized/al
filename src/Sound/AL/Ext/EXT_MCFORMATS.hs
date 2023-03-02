{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_EXT_MCFORMATS@ extension.

     Provides support for surround sound buffer formats with 8, 16, and 32-bit
     samples.

     QUAD8: Unsigned 8-bit, Quadraphonic (Front Left, Front Right, Rear Left,
            Rear Right).
     QUAD16: Signed 16-bit, Quadraphonic.
     QUAD32: 32-bit float, Quadraphonic.
     REAR8: Unsigned 8-bit, Rear Stereo (Rear Left, Rear Right).
     REAR16: Signed 16-bit, Rear Stereo.
     REAR32: 32-bit float, Rear Stereo.
     51CHN8: Unsigned 8-bit, 5.1 Surround (Front Left, Front Right, Front Center,
             LFE, Side Left, Side Right). Note that some audio systems may label
             5.1's Side channels as Rear or Surround; they are equivalent for the
             purposes of this extension.
     51CHN16: Signed 16-bit, 5.1 Surround.
     51CHN32: 32-bit float, 5.1 Surround.
     61CHN8: Unsigned 8-bit, 6.1 Surround (Front Left, Front Right, Front Center,
             LFE, Rear Center, Side Left, Side Right).
     61CHN16: Signed 16-bit, 6.1 Surround.
     61CHN32: 32-bit float, 6.1 Surround.
     71CHN8: Unsigned 8-bit, 7.1 Surround (Front Left, Front Right, Front Center,
             LFE, Rear Left, Rear Right, Side Left, Side Right).
     71CHN16: Signed 16-bit, 7.1 Surround.
     71CHN32: 32-bit float, 7.1 Surround.

 -}

module Sound.AL.Ext.EXT_MCFORMATS
  ( pattern AL_EXT_MCFORMATS_EXTENSION_NAME
    -- * Tokens
  , pattern AL_FORMAT_QUAD8
  , pattern AL_FORMAT_QUAD16
  , pattern AL_FORMAT_QUAD32
  , pattern AL_FORMAT_REAR8
  , pattern AL_FORMAT_REAR16
  , pattern AL_FORMAT_REAR32
  , pattern AL_FORMAT_51CHN8
  , pattern AL_FORMAT_51CHN16
  , pattern AL_FORMAT_51CHN32
  , pattern AL_FORMAT_61CHN8
  , pattern AL_FORMAT_61CHN16
  , pattern AL_FORMAT_61CHN32
  , pattern AL_FORMAT_71CHN8
  , pattern AL_FORMAT_71CHN16
  , pattern AL_FORMAT_71CHN32
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_EXT_MCFORMATS_EXTENSION_NAME :: Ptr ALchar
pattern AL_EXT_MCFORMATS_EXTENSION_NAME <- (const False -> True)
  where
    AL_EXT_MCFORMATS_EXTENSION_NAME = Ptr "AL_EXT_MCFORMATS\0"#



pattern AL_FORMAT_QUAD8
      , AL_FORMAT_QUAD16
      , AL_FORMAT_QUAD32
      , AL_FORMAT_REAR8
      , AL_FORMAT_REAR16
      , AL_FORMAT_REAR32
      , AL_FORMAT_51CHN8
      , AL_FORMAT_51CHN16
      , AL_FORMAT_51CHN32
      , AL_FORMAT_61CHN8
      , AL_FORMAT_61CHN16
      , AL_FORMAT_61CHN32
      , AL_FORMAT_71CHN8
      , AL_FORMAT_71CHN16
      , AL_FORMAT_71CHN32
     :: (Eq a, Num a) => a
pattern AL_FORMAT_QUAD8   = 0x1204
pattern AL_FORMAT_QUAD16  = 0x1205
pattern AL_FORMAT_QUAD32  = 0x1206
pattern AL_FORMAT_REAR8   = 0x1207
pattern AL_FORMAT_REAR16  = 0x1208
pattern AL_FORMAT_REAR32  = 0x1209
pattern AL_FORMAT_51CHN8  = 0x120A
pattern AL_FORMAT_51CHN16 = 0x120B
pattern AL_FORMAT_51CHN32 = 0x120C
pattern AL_FORMAT_61CHN8  = 0x120D
pattern AL_FORMAT_61CHN16 = 0x120E
pattern AL_FORMAT_61CHN32 = 0x120F
pattern AL_FORMAT_71CHN8  = 0x1210
pattern AL_FORMAT_71CHN16 = 0x1211
pattern AL_FORMAT_71CHN32 = 0x1212
