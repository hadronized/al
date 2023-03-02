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

    alcValidate dev ALC_EXT_DISCONNECT_EXTENSION_NAME []

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

    alcValidate dev ALC_EXT_THREAD_LOCAL_CONTEXT_EXTENSION_NAME
      [ unalc alcFunSetThreadContext
      , unalc alcFunGetThreadContext
      ]

    alcValidate dev ALC_SOFT_DEVICE_CLOCK_EXTENSION_NAME
      [ unalc alcFunGetInteger64vSOFT
      ]

    alcValidate dev ALC_SOFT_HRTF_EXTENSION_NAME
      [ unalc alcFunGetStringiSOFT
      , unalc alcFunResetDeviceSOFT
      ]

    alcValidate dev ALC_SOFT_LOOPBACK_EXTENSION_NAME
      [ unalc alcFunLoopbackOpenDeviceSOFT
      , unalc alcFunIsRenderFormatSupportedSOFT
      , unalc alcFunRenderSamplesSOFT
      ]

    alcValidate dev ALC_SOFT_LOOPBACK_BFORMAT_EXTENSION_NAME []

    alcValidate dev ALC_SOFT_OUTPUT_LIMITER_EXTENSION_NAME
      [ unalc alcFunResetDeviceSOFT
      ]

    alcValidate dev ALC_SOFT_OUTPUT_MODE_EXTENSION_NAME []

    alcValidate dev ALC_SOFT_PAUSE_DEVICE_EXTENSION_NAME
      [ unalc alcFunDevicePauseSOFT
      , unalc alcFunDeviceResumeSOFT
      ]

    alcValidate dev ALC_SOFT_REOPEN_DEVICE_EXTENSION_NAME
      [ unalc alcFunReopenDeviceSOFT
      ]

    alExts <- alExtensions
    putStrLn $ "\nSupported AL extensions: " <> show alExts <> "\n"

    alValidate AL_EXT_ALAW_EXTENSION_NAME []

    alValidate AL_EXT_BFORMAT_EXTENSION_NAME []

    alValidate AL_EXT_DOUBLE_EXTENSION_NAME []

    alValidate AL_EXT_FLOAT32_EXTENSION_NAME []

    alValidate AL_EXT_IMA4_EXTENSION_NAME []

    alValidate AL_EXT_MCFORMATS_EXTENSION_NAME []

    alValidate AL_EXT_MULAW_BFORMAT_EXTENSION_NAME []

    alValidate AL_EXT_MULAW_EXTENSION_NAME []

    alValidate AL_EXT_MULAW_MCFORMATS_EXTENSION_NAME []

    alValidate AL_EXT_SOURCE_DISTANCE_MODEL_EXTENSION_NAME []

    alValidate AL_SOFT_BFORMAT_EX_EXTENSION_NAME []

    alValidate AL_SOFT_BLOCK_ALIGNMENT_EXTENSION_NAME []

    alValidate AL_SOFT_BUFFER_SAMPLES_EXTENSION_NAME
      [ unal alFunBufferSamplesSOFT
      , unal alFunBufferSubSamplesSOFT
      , unal alFunGetBufferSamplesSOFT
      , unal alFunIsBufferFormatSupportedSOFT
      ]

    alValidate AL_SOFT_BUFFER_SUB_DATA_EXTENSION_NAME
      [ unal alFunBufferSubDataSOFT
      ]

    alValidate AL_SOFT_CALLBACK_BUFFER_EXTENSION_NAME
      [ unal alFunBufferCallbackSOFT
      , unal alFunGetBufferPtrSOFT
      , unal alFunGetBuffer3PtrSOFT
      , unal alFunGetBufferPtrvSOFT
      ]

    alValidate AL_SOFT_DEFERRED_UPDATES_EXTENSION_NAME
      [ unal alFunDeferUpdatesSOFT
      , unal alFunProcessUpdatesSOFT
      ]

    alValidate AL_SOFT_DIRECT_CHANNELS_EXTENSION_NAME []

    alValidate AL_SOFT_DIRECT_CHANNELS_REMIX_EXTENSION_NAME []

    alValidate AL_SOFT_EFFECT_TARGET_EXTENSION_NAME []

    alValidate AL_SOFT_EVENTS_EXTENSION_NAME
      [ unal alFunEventControlSOFT
      , unal alFunEventCallbackSOFT
      , unal alFunGetPointerSOFT
      , unal alFunGetPointervSOFT
      ]

    alValidate AL_SOFT_GAIN_CLAMP_EX_EXTENSION_NAME []

    alValidate AL_SOFT_LOOP_POINTS_EXTENSION_NAME []

    alValidate AL_SOFT_MSADPCM_EXTENSION_NAME []

    alValidate AL_SOFT_SOURCE_LATENCY_EXTENSION_NAME
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

    alValidate AL_SOFT_SOURCE_LENGTH_EXTENSION_NAME []

    alValidate AL_SOFT_SOURCE_RESAMPLER_EXTENSION_NAME
      [ unal alFunGetStringiSOFT
      ]

    alValidate AL_SOFT_SOURCE_SPATIALIZE_EXTENSION_NAME []

    alValidate AL_SOFT_UHJ_EXTENSION_NAME []

    alValidate AL_SOFTX_MAP_BUFFER_EXTENSION_NAME
      [ unal alFunBufferStorageSOFT
      , unal alFunMapBufferSOFT
      , unal alFunUnmapBufferSOFT
      , unal alFunFlushMappedBufferSOFT
      ]
