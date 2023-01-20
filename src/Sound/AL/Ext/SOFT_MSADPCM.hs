{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_MSADPCM@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_MSADPCM.txt
 -}

module Sound.AL.Ext.SOFT_MSADPCM
  ( pattern AL_SOFT_MSADPCM
    -- * Tokens
  , pattern AL_FORMAT_MONO_MSADPCM_SOFT
  , pattern AL_FORMAT_STEREO_MSADPCM_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_MSADPCM :: Ptr ALchar
pattern AL_SOFT_MSADPCM <- (const False -> True)
  where
    AL_SOFT_MSADPCM = Ptr "AL_SOFT_MSADPCM\0"#



pattern AL_FORMAT_MONO_MSADPCM_SOFT
      , AL_FORMAT_STEREO_MSADPCM_SOFT
     :: (Eq a, Num a) => a
pattern AL_FORMAT_MONO_MSADPCM_SOFT   = 0x1302
pattern AL_FORMAT_STEREO_MSADPCM_SOFT = 0x1303
