{-# LANGUAGE MagicHash
           , PatternSynonyms
           , ViewPatterns #-}

{-| @ALC_EXT_disconnect@ extension.

    Extension document can be found at https://icculus.org/alextreg/wiki/action=printer&id=ALC_EXT_Disconnect
-}

module Sound.ALC.Ext.EXT_disconnect
  ( pattern ALC_EXT_disconnect
    -- * Tokens
  , pattern ALC_CONNECTED
  ) where

import           Sound.ALC

import           GHC.Ptr



pattern ALC_EXT_disconnect :: Ptr ALCchar
pattern ALC_EXT_disconnect <- (const False -> True)
  where
    ALC_EXT_disconnect = Ptr "ALC_EXT_disconnect\0"#



pattern ALC_CONNECTED :: (Eq a, Num a) => a
pattern ALC_CONNECTED = 0x313
