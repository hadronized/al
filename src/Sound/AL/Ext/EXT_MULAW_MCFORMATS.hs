{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_EXT_MULAW_MCFORMATS@ extension.
 -}

module Sound.AL.Ext.EXT_MULAW_MCFORMATS
  ( pattern AL_EXT_MULAW_MCFORMATS_EXTENSION_NAME
    -- * Tokens
  , pattern AL_FORMAT_MONO_MULAW
  , pattern AL_FORMAT_STEREO_MULAW
  , pattern AL_FORMAT_QUAD_MULAW
  , pattern AL_FORMAT_REAR_MULAW
  , pattern AL_FORMAT_51CHN_MULAW
  , pattern AL_FORMAT_61CHN_MULAW
  , pattern AL_FORMAT_71CHN_MULAW
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_EXT_MULAW_MCFORMATS_EXTENSION_NAME :: Ptr ALchar
pattern AL_EXT_MULAW_MCFORMATS_EXTENSION_NAME <- (const False -> True)
  where
    AL_EXT_MULAW_MCFORMATS_EXTENSION_NAME = Ptr "AL_EXT_MULAW_MCFORMATS\0"#



pattern AL_FORMAT_MONO_MULAW
      , AL_FORMAT_STEREO_MULAW
      , AL_FORMAT_QUAD_MULAW
      , AL_FORMAT_REAR_MULAW
      , AL_FORMAT_51CHN_MULAW
      , AL_FORMAT_61CHN_MULAW
      , AL_FORMAT_71CHN_MULAW
     :: (Eq a, Num a) => a
pattern AL_FORMAT_MONO_MULAW   = 0x10014
pattern AL_FORMAT_STEREO_MULAW = 0x10015
pattern AL_FORMAT_QUAD_MULAW   = 0x10021
pattern AL_FORMAT_REAR_MULAW   = 0x10022
pattern AL_FORMAT_51CHN_MULAW  = 0x10023
pattern AL_FORMAT_61CHN_MULAW  = 0x10024
pattern AL_FORMAT_71CHN_MULAW  = 0x10025
