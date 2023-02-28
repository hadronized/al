{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| Experimental @AL_SOFTX_map_buffer@ extension.

    There is no document for this extension.
    Refer to https://github.com/kcat/openal-soft/issues/579 on how to use it.
 -}

module Sound.AL.Ext.SOFTX_map_buffer
  ( pattern AL_SOFTX_MAP_BUFFER_EXTENSION_NAME
    -- * Primitive types
  , ALbitfieldSOFT
    -- * Procedures
  , ALBufferStorageSOFT
  , alFunBufferStorageSOFT
  , ALMapBufferSOFT
  , alFunMapBufferSOFT
  , ALUnmapBufferSOFT
  , alFunUnmapBufferSOFT
  , ALFlushMappedBufferSOFT
  , alFunFlushMappedBufferSOFT
    -- * Tokens
  , pattern AL_MAP_READ_BIT_SOFT
  , pattern AL_MAP_WRITE_BIT_SOFT
  , pattern AL_MAP_PERSISTENT_BIT_SOFT
  , pattern AL_PRESERVE_DATA_BIT_SOFT
  ) where

import           Sound.AL

import           Data.Word
import           GHC.Ptr



pattern AL_SOFTX_MAP_BUFFER_EXTENSION_NAME :: Ptr ALchar
pattern AL_SOFTX_MAP_BUFFER_EXTENSION_NAME <- (const False -> True)
  where
    AL_SOFTX_MAP_BUFFER_EXTENSION_NAME = Ptr "AL_SOFTX_map_buffer\0"##



type ALbitfieldSOFT = #type unsigned int



alFunBufferStorageSOFT :: ALFun ALBufferStorageSOFT
alFunBufferStorageSOFT = ALFun (Ptr "alBufferStorageSOFT\0"##)

type ALBufferStorageSOFT =
          ALuint         -- ^ buffer
       -> ALenum         -- ^ format
       -> Ptr ALvoid     -- ^ data
       -> ALsizei        -- ^ size
       -> ALsizei        -- ^ freq
       -> ALbitfieldSOFT -- ^ flags
       -> IO ()

alFunMapBufferSOFT :: ALFun ALMapBufferSOFT
alFunMapBufferSOFT = ALFun (Ptr "alMapBufferSOFT\0"##)

type ALMapBufferSOFT =
          ALuint         -- ^ buffer
       -> ALsizei        -- ^ offset
       -> ALsizei        -- ^ length
       -> ALbitfieldSOFT -- ^ access
       -> IO (Ptr ())

alFunUnmapBufferSOFT :: ALFun ALUnmapBufferSOFT
alFunUnmapBufferSOFT = ALFun (Ptr "alUnmapBufferSOFT\0"##)

type ALUnmapBufferSOFT =
          ALuint -- ^ buffer
       -> IO ()

alFunFlushMappedBufferSOFT :: ALFun ALFlushMappedBufferSOFT
alFunFlushMappedBufferSOFT = ALFun (Ptr "alFlushMappedBufferSOFT\0"##)

type ALFlushMappedBufferSOFT =
          ALuint  -- ^ buffer
       -> ALsizei -- ^ offset
       -> ALsizei -- ^ length
       -> IO ()



pattern AL_MAP_READ_BIT_SOFT
      , AL_MAP_WRITE_BIT_SOFT
      , AL_MAP_PERSISTENT_BIT_SOFT
      , AL_PRESERVE_DATA_BIT_SOFT
     :: (Eq a, Num a) => a
pattern AL_MAP_READ_BIT_SOFT       = 0x00000001
pattern AL_MAP_WRITE_BIT_SOFT      = 0x00000002
pattern AL_MAP_PERSISTENT_BIT_SOFT = 0x00000004
pattern AL_PRESERVE_DATA_BIT_SOFT  = 0x00000008
