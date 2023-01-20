{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_buffer_samples@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_buffer_samples.txt
 -}

module Sound.AL.Ext.SOFT_buffer_samples
  ( pattern AL_SOFT_buffer_samples
    -- * Procedures
  , ALBufferSamplesSOFT
  , alFunBufferSamplesSOFT
  , ALBufferSubSamplesSOFT
  , alFunBufferSubSamplesSOFT
  , ALGetBufferSamplesSOFT
  , alFunGetBufferSamplesSOFT
  , ALIsBufferFormatSupportedSOFT
  , alFunIsBufferFormatSupportedSOFT
    -- * Tokens
  , pattern AL_MONO8_SOFT
  , pattern AL_MONO16_SOFT
  , pattern AL_MONO32F_SOFT
  , pattern AL_STEREO8_SOFT
  , pattern AL_STEREO16_SOFT
  , pattern AL_STEREO32F_SOFT
  , pattern AL_QUAD8_SOFT
  , pattern AL_QUAD16_SOFT
  , pattern AL_QUAD32F_SOFT
  , pattern AL_REAR8_SOFT
  , pattern AL_REAR16_SOFT
  , pattern AL_REAR32F_SOFT
  , pattern AL_5POINT1_8_SOFT
  , pattern AL_5POINT1_16_SOFT
  , pattern AL_5POINT1_32F_SOFT
  , pattern AL_6POINT1_8_SOFT
  , pattern AL_6POINT1_16_SOFT
  , pattern AL_6POINT1_32F_SOFT
  , pattern AL_7POINT1_8_SOFT
  , pattern AL_7POINT1_16_SOFT
  , pattern AL_7POINT1_32F_SOFT

  , pattern AL_MONO_SOFT
  , pattern AL_STEREO_SOFT
  , pattern AL_QUAD_SOFT
  , pattern AL_REAR_SOFT
  , pattern AL_5POINT1_SOFT
  , pattern AL_6POINT1_SOFT
  , pattern AL_7POINT1_SOFT

  , pattern AL_BYTE_SOFT
  , pattern AL_UNSIGNED_BYTE_SOFT
  , pattern AL_SHORT_SOFT
  , pattern AL_UNSIGNED_SHORT_SOFT
  , pattern AL_INT_SOFT
  , pattern AL_UNSIGNED_INT_SOFT
  , pattern AL_FLOAT_SOFT
  , pattern AL_DOUBLE_SOFT
  , pattern AL_BYTE3_SOFT
  , pattern AL_UNSIGNED_BYTE3_SOFT

  , pattern AL_INTERNAL_FORMAT_SOFT
  , pattern AL_BYTE_LENGTH_SOFT
  , pattern AL_SAMPLE_LENGTH_SOFT

  , pattern AL_SEC_LENGTH_SOFT

  , pattern AL_BYTE_RW_OFFSETS_SOFT
  , pattern AL_SAMPLE_RW_OFFSETS_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_buffer_samples :: Ptr ALchar
pattern AL_SOFT_buffer_samples <- (const False -> True)
  where
    AL_SOFT_buffer_samples = Ptr "AL_SOFT_buffer_samples\0"#



alFunBufferSamplesSOFT :: ALFun ALBufferSamplesSOFT
alFunBufferSamplesSOFT = ALFun (Ptr "alBufferSamplesSOFT\0"#)

type ALBufferSamplesSOFT =
          ALuint     -- ^ buffer
       -> ALuint     -- ^ samplerate
       -> ALenum     -- ^ internalformat
       -> ALsizei    -- ^ samples
       -> ALenum     -- ^ channels
       -> ALenum     -- ^ type
       -> Ptr ALvoid -- ^ data
       -> IO ()

alFunBufferSubSamplesSOFT :: ALFun ALBufferSubSamplesSOFT
alFunBufferSubSamplesSOFT = ALFun (Ptr "alBufferSubSamplesSOFT\0"#)

type ALBufferSubSamplesSOFT =
          ALuint     -- ^ buffer
       -> ALsizei    -- ^ offset
       -> ALsizei    -- ^ samples
       -> ALenum     -- ^ channels
       -> ALenum     -- ^ type
       -> Ptr ALvoid -- ^ data
       -> IO ()

alFunGetBufferSamplesSOFT :: ALFun ALGetBufferSamplesSOFT
alFunGetBufferSamplesSOFT = ALFun (Ptr "alGetBufferSamplesSOFT\0"#)

type ALGetBufferSamplesSOFT =
          ALuint     -- ^ buffer
       -> ALsizei    -- ^ offset
       -> ALsizei    -- ^ samples
       -> ALenum     -- ^ channels
       -> ALenum     -- ^ type
       -> Ptr ALvoid -- ^ data
       -> IO ()

alFunIsBufferFormatSupportedSOFT :: ALFun ALIsBufferFormatSupportedSOFT
alFunIsBufferFormatSupportedSOFT = ALFun (Ptr "alIsBufferFormatSupportedSOFT\0"#)

type ALIsBufferFormatSupportedSOFT =
          ALenum -- ^ format
       -> IO ALboolean



pattern AL_MONO8_SOFT
      , AL_MONO16_SOFT
      , AL_MONO32F_SOFT
      , AL_STEREO8_SOFT
      , AL_STEREO16_SOFT
      , AL_STEREO32F_SOFT
      , AL_QUAD8_SOFT
      , AL_QUAD16_SOFT
      , AL_QUAD32F_SOFT
      , AL_REAR8_SOFT
      , AL_REAR16_SOFT
      , AL_REAR32F_SOFT
      , AL_5POINT1_8_SOFT
      , AL_5POINT1_16_SOFT
      , AL_5POINT1_32F_SOFT
      , AL_6POINT1_8_SOFT
      , AL_6POINT1_16_SOFT
      , AL_6POINT1_32F_SOFT
      , AL_7POINT1_8_SOFT
      , AL_7POINT1_16_SOFT
      , AL_7POINT1_32F_SOFT
     :: (Eq a, Num a) => a
pattern AL_MONO8_SOFT       = 0x1100
pattern AL_MONO16_SOFT      = 0x1101
pattern AL_MONO32F_SOFT     = 0x10010
pattern AL_STEREO8_SOFT     = 0x1102
pattern AL_STEREO16_SOFT    = 0x1103
pattern AL_STEREO32F_SOFT   = 0x10011
pattern AL_QUAD8_SOFT       = 0x1204
pattern AL_QUAD16_SOFT      = 0x1205
pattern AL_QUAD32F_SOFT     = 0x1206
pattern AL_REAR8_SOFT       = 0x1207
pattern AL_REAR16_SOFT      = 0x1208
pattern AL_REAR32F_SOFT     = 0x1209
pattern AL_5POINT1_8_SOFT   = 0x120A
pattern AL_5POINT1_16_SOFT  = 0x120B
pattern AL_5POINT1_32F_SOFT = 0x120C
pattern AL_6POINT1_8_SOFT   = 0x120D
pattern AL_6POINT1_16_SOFT  = 0x120E
pattern AL_6POINT1_32F_SOFT = 0x120F
pattern AL_7POINT1_8_SOFT   = 0x1210
pattern AL_7POINT1_16_SOFT  = 0x1211
pattern AL_7POINT1_32F_SOFT = 0x1212

pattern AL_MONO_SOFT
      , AL_STEREO_SOFT
      , AL_QUAD_SOFT
      , AL_REAR_SOFT
      , AL_5POINT1_SOFT
      , AL_6POINT1_SOFT
      , AL_7POINT1_SOFT
     :: (Eq a, Num a) => a
pattern AL_MONO_SOFT    = 0x1500
pattern AL_STEREO_SOFT  = 0x1501
pattern AL_QUAD_SOFT    = 0x1502
pattern AL_REAR_SOFT    = 0x1503
pattern AL_5POINT1_SOFT = 0x1504
pattern AL_6POINT1_SOFT = 0x1505
pattern AL_7POINT1_SOFT = 0x1506

pattern AL_BYTE_SOFT
      , AL_UNSIGNED_BYTE_SOFT
      , AL_SHORT_SOFT
      , AL_UNSIGNED_SHORT_SOFT
      , AL_INT_SOFT
      , AL_UNSIGNED_INT_SOFT
      , AL_FLOAT_SOFT
      , AL_DOUBLE_SOFT
      , AL_BYTE3_SOFT
      , AL_UNSIGNED_BYTE3_SOFT
     :: (Eq a, Num a) => a
pattern AL_BYTE_SOFT           = 0x1400
pattern AL_UNSIGNED_BYTE_SOFT  = 0x1401
pattern AL_SHORT_SOFT          = 0x1402
pattern AL_UNSIGNED_SHORT_SOFT = 0x1403
pattern AL_INT_SOFT            = 0x1404
pattern AL_UNSIGNED_INT_SOFT   = 0x1405
pattern AL_FLOAT_SOFT          = 0x1406
pattern AL_DOUBLE_SOFT         = 0x1407
pattern AL_BYTE3_SOFT          = 0x1408
pattern AL_UNSIGNED_BYTE3_SOFT = 0x1409

pattern AL_INTERNAL_FORMAT_SOFT
      , AL_BYTE_LENGTH_SOFT
      , AL_SAMPLE_LENGTH_SOFT
     :: (Eq a, Num a) => a
pattern AL_INTERNAL_FORMAT_SOFT = 0x2008
pattern AL_BYTE_LENGTH_SOFT     = 0x2009
pattern AL_SAMPLE_LENGTH_SOFT   = 0x200A

pattern AL_SEC_LENGTH_SOFT :: (Eq a, Num a) => a
pattern AL_SEC_LENGTH_SOFT = 0x200B

pattern AL_BYTE_RW_OFFSETS_SOFT
      , AL_SAMPLE_RW_OFFSETS_SOFT
     :: (Eq a, Num a) => a
pattern AL_BYTE_RW_OFFSETS_SOFT   = 0x1031
pattern AL_SAMPLE_RW_OFFSETS_SOFT = 0x1032
