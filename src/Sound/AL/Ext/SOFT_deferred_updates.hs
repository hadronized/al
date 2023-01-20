{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @AL_SOFT_deferred_updates@ extension.

    Extension document can be found at https://openal-soft.org/openal-extensions/SOFT_deferred_updates.txt
 -}

module Sound.AL.Ext.SOFT_deferred_updates
  ( pattern AL_SOFT_deferred_updates
    -- * Procedures
  , ALDeferUpdatesSOFT
  , alFunDeferUpdatesSOFT
  , ALProcessUpdatesSOFT
  , alFunProcessUpdatesSOFT
    -- * Tokens
  , pattern AL_DEFERRED_UPDATES_SOFT
  ) where

import           Sound.AL

import           GHC.Ptr



pattern AL_SOFT_deferred_updates :: Ptr ALchar
pattern AL_SOFT_deferred_updates <- (const False -> True)
  where
    AL_SOFT_deferred_updates = Ptr "AL_SOFT_deferred_updates\0"#



alFunDeferUpdatesSOFT :: ALFun ALDeferUpdatesSOFT
alFunDeferUpdatesSOFT = ALFun (Ptr "alDeferUpdatesSOFT\0"#)

type ALDeferUpdatesSOFT = IO ()

alFunProcessUpdatesSOFT :: ALFun ALProcessUpdatesSOFT
alFunProcessUpdatesSOFT = ALFun (Ptr "alProcessUpdatesSOFT\0"#)

type ALProcessUpdatesSOFT = IO ()



pattern AL_DEFERRED_UPDATES_SOFT :: (Eq a, Num a) => a
pattern AL_DEFERRED_UPDATES_SOFT = 0xC002
