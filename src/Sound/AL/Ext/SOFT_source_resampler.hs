{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_source_resampler@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_source_resampler.txt
 -}

module Sound.AL.Ext.SOFT_source_resampler
  ( pattern AL_SOFT_SOURCE_RESAMPLER_EXTENSION_NAME
    -- * Procedures
  , ALGetStringiSOFT
  , alFunGetStringiSOFT
    -- * Tokens
  , pattern AL_NUM_RESAMPLERS_SOFT
  , pattern AL_DEFAULT_RESAMPLER_SOFT

  , pattern AL_SOURCE_RESAMPLER_SOFT

  , pattern AL_RESAMPLER_NAME_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_SOURCE_RESAMPLER_EXTENSION_NAME :: Ptr ALchar
pattern AL_SOFT_SOURCE_RESAMPLER_EXTENSION_NAME <- (const False -> True)
  where
    AL_SOFT_SOURCE_RESAMPLER_EXTENSION_NAME = Ptr "AL_SOFT_source_resampler\0"#



alFunGetStringiSOFT :: ALFun ALGetStringiSOFT
alFunGetStringiSOFT = ALFun (Ptr "alGetStringiSOFT\0"#)

type ALGetStringiSOFT =
          ALenum          -- ^ pname
       -> ALsizei         -- ^ index
       -> IO (Ptr ALchar)


pattern AL_NUM_RESAMPLERS_SOFT
      , AL_DEFAULT_RESAMPLER_SOFT
     :: (Eq a, Num a) => a
pattern AL_NUM_RESAMPLERS_SOFT    = 0x1210
pattern AL_DEFAULT_RESAMPLER_SOFT = 0x1211

pattern AL_SOURCE_RESAMPLER_SOFT :: (Eq a, Num a) => a
pattern AL_SOURCE_RESAMPLER_SOFT = 0x1212

pattern AL_RESAMPLER_NAME_SOFT :: (Eq a, Num a) => a
pattern AL_RESAMPLER_NAME_SOFT = 0x1213
