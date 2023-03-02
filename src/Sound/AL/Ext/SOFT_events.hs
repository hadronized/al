{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_events@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_events.txt
 -}

module Sound.AL.Ext.SOFT_events
  ( pattern AL_SOFT_EVENTS_EXTENSION_NAME
    -- * Types
  , ALEventProcSOFT
    -- * Procedures
  , ALEventControlSOFT
  , alFunEventControlSOFT
  , ALEventCallbackSOFT
  , alFunEventCallbackSOFT
  , ALGetPointerSOFT
  , alFunGetPointerSOFT
  , ALGetPointervSOFT
  , alFunGetPointervSOFT
    -- * Tokens
  , pattern AL_EVENT_CALLBACK_FUNCTION_SOFT
  , pattern AL_EVENT_CALLBACK_USER_PARAM_SOFT

  , pattern AL_EVENT_TYPE_BUFFER_COMPLETED_SOFT
  , pattern AL_EVENT_TYPE_SOURCE_STATE_CHANGED_SOFT
  , pattern AL_EVENT_TYPE_DISCONNECTED_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_EVENTS_EXTENSION_NAME :: Ptr ALchar
pattern AL_SOFT_EVENTS_EXTENSION_NAME <- (const False -> True)
  where
    AL_SOFT_EVENTS_EXTENSION_NAME = Ptr "AL_SOFT_events\0"#



type ALEventProcSOFT =
          ALenum     -- ^ eventType
       -> ALuint     -- ^ object
       -> ALuint     -- ^ param
       -> ALsizei    -- ^ length
       -> Ptr ALchar -- ^ message
       -> Ptr ALvoid -- ^ userParam
       -> IO ()



alFunEventControlSOFT :: ALFun ALEventControlSOFT
alFunEventControlSOFT = ALFun (Ptr "alEventControlSOFT\0"#)

type ALEventControlSOFT =
          ALsizei    -- ^ count
       -> Ptr ALenum -- ^ types
       -> ALboolean  -- ^ enable
       -> IO ()

alFunEventCallbackSOFT :: ALFun ALEventCallbackSOFT
alFunEventCallbackSOFT = ALFun (Ptr "alEventCallbackSOFT\0"#)

type ALEventCallbackSOFT =
          FunPtr ALEventProcSOFT -- ^ callback
       -> Ptr ALvoid             -- ^ userParam
       -> IO ()

alFunGetPointerSOFT :: ALFun ALGetPointerSOFT
alFunGetPointerSOFT = ALFun (Ptr "alGetPointerSOFT\0"#)

type ALGetPointerSOFT =
          ALenum          -- ^ pname
       -> IO (Ptr ALvoid)

alFunGetPointervSOFT :: ALFun ALGetPointervSOFT
alFunGetPointervSOFT = ALFun (Ptr "alGetPointervSOFT\0"#)

type ALGetPointervSOFT =
          ALenum           -- ^ pname
       -> Ptr (Ptr ALvoid) -- ^ values
       -> IO ()




pattern AL_EVENT_CALLBACK_FUNCTION_SOFT
      , AL_EVENT_CALLBACK_USER_PARAM_SOFT
     :: (Eq a, Num a) => a
pattern AL_EVENT_CALLBACK_FUNCTION_SOFT   = 0x19A2
pattern AL_EVENT_CALLBACK_USER_PARAM_SOFT = 0x19A3

pattern AL_EVENT_TYPE_BUFFER_COMPLETED_SOFT
      , AL_EVENT_TYPE_SOURCE_STATE_CHANGED_SOFT
      , AL_EVENT_TYPE_DISCONNECTED_SOFT
     :: (Eq a, Num a) => a
pattern AL_EVENT_TYPE_BUFFER_COMPLETED_SOFT     = 0x19A4
pattern AL_EVENT_TYPE_SOURCE_STATE_CHANGED_SOFT = 0x19A5
pattern AL_EVENT_TYPE_DISCONNECTED_SOFT         = 0x19A6
