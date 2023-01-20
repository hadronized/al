module Main where

import           Sound.AL
import           Sound.AL.Ext.EXT_ALAW
import           Sound.AL.Ext.EXT_BFORMAT
import           Sound.AL.Ext.EXT_DOUBLE
import           Sound.AL.Ext.EXT_FLOAT32
import           Sound.AL.Ext.EXT_IMA4
import           Sound.AL.Ext.EXT_MCFORMATS
import           Sound.AL.Ext.EXT_MULAW_BFORMAT
import           Sound.AL.Ext.EXT_MULAW
import           Sound.AL.Ext.EXT_MULAW_MCFORMATS
import           Sound.AL.Ext.EXT_source_distance_model
import           Sound.AL.Ext.SOFT_bformat_ex
import           Sound.AL.Ext.SOFT_block_alignment
import           Sound.AL.Ext.SOFT_buffer_samples
import           Sound.AL.Ext.SOFT_buffer_sub_data
import           Sound.AL.Ext.SOFT_callback_buffer
import           Sound.AL.Ext.SOFT_deferred_updates
import           Sound.AL.Ext.SOFT_direct_channels
import           Sound.AL.Ext.SOFT_direct_channels_remix
import           Sound.AL.Ext.SOFT_effect_target
import           Sound.AL.Ext.SOFT_events
import           Sound.AL.Ext.SOFT_gain_clamp_ex
import           Sound.AL.Ext.SOFT_loop_points
import           Sound.AL.Ext.SOFT_MSADPCM
import           Sound.AL.Ext.SOFT_source_latency
import           Sound.AL.Ext.SOFT_source_length
import           Sound.AL.Ext.SOFT_source_resampler
import           Sound.AL.Ext.SOFT_source_spatialize
import           Sound.AL.Ext.SOFT_UHJ
import           Sound.AL.Ext.SOFTX_map_buffer

import           Sound.ALC
import           Sound.ALC.Ext.EXT_disconnect
import           Sound.ALC.Ext.EXT_EFX
import           Sound.ALC.Ext.EXT_thread_local_context
import           Sound.ALC.Ext.SOFT_device_clock
import           Sound.ALC.Ext.SOFT_HRTF
import           Sound.ALC.Ext.SOFT_loopback_bformat
import           Sound.ALC.Ext.SOFT_loopback
import           Sound.ALC.Ext.SOFT_output_limiter
import           Sound.ALC.Ext.SOFT_output_mode
import           Sound.ALC.Ext.SOFT_pause_device
import           Sound.ALC.Ext.SOFT_reopen_device

import           Control.Exception
import           Data.Foldable
import           Foreign.C.String
import           Foreign.Ptr
import           System.Exit



withAL :: (Ptr ALCdevice -> Ptr ALCcontext -> IO ()) -> IO ()
withAL f =
  let openDevice = do dev <- alcOpenDevice nullPtr
                      if dev == nullPtr
                        then die "Could not open default device"
                        else return dev

      openContext dev = do ctx <- alcCreateContext dev nullPtr
                           if ctx == nullPtr
                             then die "Could not create a context"
                             else return ctx

      useContext ctx = do res <- alcMakeContextCurrent ctx
                          if res == 0
                            then die "Could not make context current"
                            else return ()

  in bracket openDevice alcCloseDevice $ \dev ->
       bracket (openContext dev) alcDestroyContext $ \ctx ->
         bracket_ (useContext ctx) (alcMakeContextCurrent nullPtr) $
           f dev ctx



alcExtensions :: Ptr ALCdevice -> IO [String]
alcExtensions dev = do
  cstr <- alcGetString dev ALC_EXTENSIONS
  if cstr == nullPtr
    then die "Could not get a list of ALC extensions"
    else do
      raw <- peekCString $ castPtr cstr
      return $ words raw

unalc :: ALCFun a -> Ptr ALCchar
unalc (ALCFun ptr) = ptr

efxValidate :: Ptr ALCdevice -> Ptr ALCchar -> [Ptr ALchar] -> IO ()
efxValidate dev name funs = do
  r <- alcIsExtensionPresent dev name
  raw <- peekCString $ castPtr name
  if r == 0
    then putStrLn $ "X " <> raw
    else do
      putStrLn $ "O " <> raw
      for_ funs $ \fun -> do
        ptr <- alGetProcAddress fun
        fraw <- peekCString $ castPtr fun
        putStrLn $ if ptr == nullFunPtr
                     then "  X " <> fraw
                     else "  O " <> fraw



alcValidate :: Ptr ALCdevice -> Ptr ALCchar -> [Ptr ALCchar] -> IO ()
alcValidate dev name funs = do
  r <- alcIsExtensionPresent dev name
  raw <- peekCString $ castPtr name
  if r == 0
    then putStrLn $ "X " <> raw
    else do
      putStrLn $ "O " <> raw
      for_ funs $ \fun -> do
        ptr <- alcGetProcAddress dev fun
        fraw <- peekCString $ castPtr fun
        putStrLn $ if ptr == nullFunPtr
                     then "  X " <> fraw
                     else "  O " <> fraw



alExtensions :: IO [String]
alExtensions = do
  cstr <- alGetString AL_EXTENSIONS
  if cstr == nullPtr
    then die "Could not get a list of AL extensions"
    else do
      raw <- peekCString $ castPtr cstr
      return $ words raw

unal :: ALFun a -> Ptr ALchar
unal (ALFun ptr) = ptr

alValidate :: Ptr ALchar -> [Ptr ALchar] -> IO ()
alValidate name funs = do
  r <- alIsExtensionPresent name
  raw <- peekCString $ castPtr name
  if r == 0
    then putStrLn $ "X " <> raw
    else do
      putStrLn $ "O " <> raw
      for_ funs $ \fun -> do
        ptr <- alGetProcAddress fun
        fraw <- peekCString $ castPtr fun
        putStrLn $ if ptr == nullFunPtr
                     then "  X " <> fraw
                     else "  O " <> fraw



main :: IO ()
main =
  withAL $ \dev _ctx -> do
    alcExts <- alcExtensions dev
    putStrLn $ "\nSupported ALC extensions: " <> show alcExts <> "\n"

    alcValidate dev ALC_EXT_disconnect []

    efxValidate dev ALC_EXT_EFX_NAME
      [ unal alFunGenEffects
      , unal alFunDeleteEffects
      , unal alFunIsEffect
      , unal alFunEffecti
      , unal alFunEffectiv
      , unal alFunEffectf
      , unal alFunEffectfv
      , unal alFunGetEffecti
      , unal alFunGetEffectiv
      , unal alFunGetEffectf
      , unal alFunGetEffectfv

      , unal alFunGenFilters
      , unal alFunDeleteFilters
      , unal alFunIsFilter
      , unal alFunFilteri
      , unal alFunFilteriv
      , unal alFunFilterf
      , unal alFunFilterfv
      , unal alFunGetFilteri
      , unal alFunGetFilteriv
      , unal alFunGetFilterf
      , unal alFunGetFilterfv

      , unal alFunGenAuxiliaryEffectSlots
      , unal alFunDeleteAuxiliaryEffectSlots
      , unal alFunIsAuxiliaryEffectSlot
      , unal alFunAuxiliaryEffectSloti
      , unal alFunAuxiliaryEffectSlotiv
      , unal alFunAuxiliaryEffectSlotf
      , unal alFunAuxiliaryEffectSlotfv
      , unal alFunGetAuxiliaryEffectSloti
      , unal alFunGetAuxiliaryEffectSlotiv
      , unal alFunGetAuxiliaryEffectSlotf
      , unal alFunGetAuxiliaryEffectSlotfv
      ]

    alcValidate dev ALC_EXT_thread_local_context
      [ unalc alcFunSetThreadContext
      , unalc alcFunGetThreadContext
      ]

    alcValidate dev ALC_SOFT_device_clock
      [ unalc alcFunGetInteger64vSOFT
      ]

    alcValidate dev ALC_SOFT_HRTF
      [ unalc alcFunGetStringiSOFT
      , unalc alcFunResetDeviceSOFT
      ]

    alcValidate dev ALC_SOFT_loopback
      [ unalc alcFunLoopbackOpenDeviceSOFT
      , unalc alcFunIsRenderFormatSupportedSOFT
      , unalc alcFunRenderSamplesSOFT
      ]

    alcValidate dev ALC_SOFT_loopback_bformat []

    alcValidate dev ALC_SOFT_output_limiter
      [ unalc alcFunResetDeviceSOFT
      ]

    alcValidate dev ALC_SOFT_output_mode []

    alcValidate dev ALC_SOFT_pause_device
      [ unalc alcFunDevicePauseSOFT
      , unalc alcFunDeviceResumeSOFT
      ]

    alcValidate dev ALC_SOFT_reopen_device
      [ unalc alcFunReopenDeviceSOFT
      ]

    alExts <- alExtensions
    putStrLn $ "\nSupported AL extensions: " <> show alExts <> "\n"

    alValidate AL_EXT_ALAW []

    alValidate AL_EXT_BFORMAT []

    alValidate AL_EXT_DOUBLE []

    alValidate AL_EXT_FLOAT32 []

    alValidate AL_EXT_IMA4 []

    alValidate AL_EXT_MCFORMATS []

    alValidate AL_EXT_MULAW_BFORMAT []

    alValidate AL_EXT_MULAW []

    alValidate AL_EXT_MULAW_MCFORMATS []

    alValidate AL_EXT_source_distance_model []

    alValidate AL_SOFT_bformat_ex []

    alValidate AL_SOFT_block_alignment []

    alValidate AL_SOFT_buffer_samples
      [ unal alFunBufferSamplesSOFT
      , unal alFunBufferSubSamplesSOFT
      , unal alFunGetBufferSamplesSOFT
      , unal alFunIsBufferFormatSupportedSOFT
      ]

    alValidate AL_SOFT_buffer_sub_data
      [ unal alFunBufferSubDataSOFT
      ]

    alValidate AL_SOFT_callback_buffer
      [ unal alFunBufferCallbackSOFT
      , unal alFunGetBufferPtrSOFT
      , unal alFunGetBuffer3PtrSOFT
      , unal alFunGetBufferPtrvSOFT
      ]

    alValidate AL_SOFT_deferred_updates
      [ unal alFunDeferUpdatesSOFT
      , unal alFunProcessUpdatesSOFT
      ]

    alValidate AL_SOFT_direct_channels []

    alValidate AL_SOFT_direct_channels_remix []

    alValidate AL_SOFT_effect_target []

    alValidate AL_SOFT_events
      [ unal alFunEventControlSOFT
      , unal alFunEventCallbackSOFT
      , unal alFunGetPointerSOFT
      , unal alFunGetPointervSOFT
      ]

    alValidate AL_SOFT_gain_clamp_ex []

    alValidate AL_SOFT_loop_points []

    alValidate AL_SOFT_MSADPCM []

    alValidate AL_SOFT_source_latency
      [ unal alFunSourcedSOFT
      , unal alFunSource3dSOFT
      , unal alFunSourcedvSOFT
      , unal alFunGetSourcedSOFT
      , unal alFunGetSource3dSOFT
      , unal alFunGetSourcedvSOFT
      , unal alFunSourcei64SOFT
      , unal alFunSource3i64SOFT
      , unal alFunSourcei64vSOFT
      , unal alFunGetSourcei64SOFT
      , unal alFunGetSource3i64SOFT
      , unal alFunGetSourcei64vSOFT
      ]

    alValidate AL_SOFT_source_length []

    alValidate AL_SOFT_source_resampler
      [ unal alFunGetStringiSOFT
      ]

    alValidate AL_SOFT_source_spatialize []

    alValidate AL_SOFT_UHJ []

    alValidate AL_SOFTX_map_buffer
      [ unal alFunBufferStorageSOFT
      , unal alFunMapBufferSOFT
      , unal alFunUnmapBufferSOFT
      , unal alFunFlushMappedBufferSOFT
      ]
