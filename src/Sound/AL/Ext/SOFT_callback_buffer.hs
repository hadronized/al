{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_callback_buffer@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_callback_buffer.txt
 -}

module Sound.AL.Ext.SOFT_callback_buffer
  ( pattern AL_SOFT_CALLBACK_BUFFER_EXTENSION_NAME
    -- * Types
  , ALBufferCallbackTypeSOFT
    -- * Procedures
  , ALBufferCallbackSOFT
  , alFunBufferCallbackSOFT
  , ALGetBufferPtrSOFT
  , alFunGetBufferPtrSOFT
  , ALGetBuffer3PtrSOFT
  , alFunGetBuffer3PtrSOFT
  , ALGetBufferPtrvSOFT
  , alFunGetBufferPtrvSOFT
    -- * Tokens
  , pattern AL_BUFFER_CALLBACK_FUNCTION_SOFT
  , pattern AL_BUFFER_CALLBACK_USER_PARAM_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_CALLBACK_BUFFER_EXTENSION_NAME :: Ptr ALchar
pattern AL_SOFT_CALLBACK_BUFFER_EXTENSION_NAME <- (const False -> True)
  where
    AL_SOFT_CALLBACK_BUFFER_EXTENSION_NAME = Ptr "AL_SOFT_callback_buffer\0"#



type ALBufferCallbackTypeSOFT =
          Ptr ALvoid -- ^ userptr
       -> Ptr ALvoid -- ^ sampledata
       -> ALsizei    -- ^ numbytes
       -> IO ALsizei



alFunBufferCallbackSOFT :: ALFun ALBufferCallbackSOFT
alFunBufferCallbackSOFT = ALFun (Ptr "alBufferCallbackSOFT\0"#)

type ALBufferCallbackSOFT =
          ALuint                          -- ^ buffer
       -> ALenum                          -- ^ format
       -> ALsizei                         -- ^ freq
       -> FunPtr ALBufferCallbackTypeSOFT -- ^ callback
       -> Ptr ALvoid                      -- ^ userptr
       -> IO ()

alFunGetBufferPtrSOFT :: ALFun ALGetBufferPtrSOFT
alFunGetBufferPtrSOFT = ALFun (Ptr "alGetBufferPtrSOFT\0"#)

type ALGetBufferPtrSOFT =
          ALuint           -- ^ buffer
       -> ALenum           -- ^ param
       -> Ptr (Ptr ALvoid) -- ^ ptr
       -> IO ()

alFunGetBuffer3PtrSOFT :: ALFun ALGetBuffer3PtrSOFT
alFunGetBuffer3PtrSOFT = ALFun (Ptr "alGetBuffer3PtrSOFT\0"#)

type ALGetBuffer3PtrSOFT =
          ALuint           -- ^ buffer
       -> ALenum           -- ^ param
       -> Ptr (Ptr ALvoid) -- ^ ptr0
       -> Ptr (Ptr ALvoid) -- ^ ptr1
       -> Ptr (Ptr ALvoid) -- ^ ptr2
       -> IO ()

alFunGetBufferPtrvSOFT :: ALFun ALGetBufferPtrvSOFT
alFunGetBufferPtrvSOFT = ALFun (Ptr "alGetBufferPtrvSOFT\0"#)

type ALGetBufferPtrvSOFT =
          ALuint           -- ^ buffer
       -> ALenum           -- ^ param
       -> Ptr (Ptr ALvoid) -- ^ ptr
       -> IO ()



pattern AL_BUFFER_CALLBACK_FUNCTION_SOFT
      , AL_BUFFER_CALLBACK_USER_PARAM_SOFT
     :: (Eq a, Num a) => a
pattern AL_BUFFER_CALLBACK_FUNCTION_SOFT   = 0x19A0
pattern AL_BUFFER_CALLBACK_USER_PARAM_SOFT = 0x19A1
