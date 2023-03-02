{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @ALC_EXT_thread_local_context@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/EXT_thread_local_context.txt
-}

module Sound.ALC.Ext.EXT_thread_local_context
  ( pattern ALC_EXT_THREAD_LOCAL_CONTEXT_EXTENSION_NAME
    -- * Procedures
  , ALCSetThreadContext
  , alcFunSetThreadContext
  , ALCGetThreadContext
  , alcFunGetThreadContext
  ) where

import           Sound.ALC

import           GHC.Ptr



pattern ALC_EXT_THREAD_LOCAL_CONTEXT_EXTENSION_NAME :: Ptr ALCchar
pattern ALC_EXT_THREAD_LOCAL_CONTEXT_EXTENSION_NAME <- (const False -> True)
  where
    ALC_EXT_THREAD_LOCAL_CONTEXT_EXTENSION_NAME = Ptr "ALC_EXT_thread_local_context\0"#



alcFunSetThreadContext :: ALCFun ALCSetThreadContext
alcFunSetThreadContext = ALCFun (Ptr "alcSetThreadContext\0"#)

type ALCSetThreadContext =
          Ptr ALCcontext -- ^ context
       -> IO ALCboolean

alcFunGetThreadContext :: ALCFun ALCGetThreadContext
alcFunGetThreadContext = ALCFun (Ptr "alcGetThreadContext\0"#)

type ALCGetThreadContext =
          IO (Ptr ALCcontext)
