{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_buffer_sub_data@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_buffer_sub_data.txt
 -}

module Sound.AL.Ext.SOFT_buffer_sub_data
  ( pattern AL_SOFT_BUFFER_SUB_DATA_EXTENSION_NAME
    -- * Procedures
  , ALBufferSubDataSOFT
  , alFunBufferSubDataSOFT
    -- * Tokens
  , pattern AL_BYTE_RW_OFFSETS_SOFT
  , pattern AL_SAMPLE_RW_OFFSETS_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_BUFFER_SUB_DATA_EXTENSION_NAME :: Ptr ALchar
pattern AL_SOFT_BUFFER_SUB_DATA_EXTENSION_NAME <- (const False -> True)
  where
    AL_SOFT_BUFFER_SUB_DATA_EXTENSION_NAME = Ptr "AL_SOFT_buffer_sub_data\0"#



alFunBufferSubDataSOFT :: ALFun ALBufferSubDataSOFT
alFunBufferSubDataSOFT = ALFun (Ptr "alBufferSubDataSOFT\0"#)

type ALBufferSubDataSOFT =
          ALuint     -- ^ buffer
       -> ALenum     -- ^ format
       -> Ptr ALvoid -- ^ data
       -> ALsizei    -- ^ offset
       -> ALsizei    -- ^ length
       -> IO ()



pattern AL_BYTE_RW_OFFSETS_SOFT
      , AL_SAMPLE_RW_OFFSETS_SOFT
     :: (Eq a, Num a) => a
pattern AL_BYTE_RW_OFFSETS_SOFT   = 0x1031
pattern AL_SAMPLE_RW_OFFSETS_SOFT = 0x1032
