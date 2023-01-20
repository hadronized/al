{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface
           , MagicHash
           , PatternSynonyms
           , ScopedTypeVariables
           , ViewPatterns #-}

{-| @ALC_EXT_EFX@ extension.

    Guide can be found at https://openal-soft.org/misc-downloads/Effects%20Extension%20Guide.pdf.

    NOTE: Enumerations with @EAX@ in the name are not part of the original
    OpenAL 1.1 @efx.h@ header.
 -}

module Sound.ALC.Ext.EXT_EFX
  ( pattern ALC_EXT_EFX_NAME
  , pattern ALC_EFX_MAJOR_VERSION
  , pattern ALC_EFX_MINOR_VERSION
  , pattern ALC_MAX_AUXILIARY_SENDS

    -- * Listener properties
  , pattern AL_METERS_PER_UNIT

    -- * Source properties
  , pattern AL_DIRECT_FILTER
  , pattern AL_AUXILIARY_SEND_FILTER
  , pattern AL_AIR_ABSORPTION_FACTOR
  , pattern AL_ROOM_ROLLOFF_FACTOR
  , pattern AL_CONE_OUTER_GAINHF
  , pattern AL_DIRECT_FILTER_GAINHF_AUTO
  , pattern AL_AUXILIARY_SEND_FILTER_GAIN_AUTO
  , pattern AL_AUXILIARY_SEND_FILTER_GAINHF_AUTO

    -- * Effect properties

    -- ** Reverb effect parameters
  , pattern AL_REVERB_DENSITY
  , pattern AL_REVERB_DIFFUSION
  , pattern AL_REVERB_GAIN
  , pattern AL_REVERB_GAINHF
  , pattern AL_REVERB_DECAY_TIME
  , pattern AL_REVERB_DECAY_HFRATIO
  , pattern AL_REVERB_REFLECTIONS_GAIN
  , pattern AL_REVERB_REFLECTIONS_DELAY
  , pattern AL_REVERB_LATE_REVERB_GAIN
  , pattern AL_REVERB_LATE_REVERB_DELAY
  , pattern AL_REVERB_AIR_ABSORPTION_GAINHF
  , pattern AL_REVERB_ROOM_ROLLOFF_FACTOR
  , pattern AL_REVERB_DECAY_HFLIMIT

    -- ** EAX Reverb effect parameters
  , pattern AL_EAXREVERB_DENSITY
  , pattern AL_EAXREVERB_DIFFUSION
  , pattern AL_EAXREVERB_GAIN
  , pattern AL_EAXREVERB_GAINHF
  , pattern AL_EAXREVERB_GAINLF
  , pattern AL_EAXREVERB_DECAY_TIME
  , pattern AL_EAXREVERB_DECAY_HFRATIO
  , pattern AL_EAXREVERB_DECAY_LFRATIO
  , pattern AL_EAXREVERB_REFLECTIONS_GAIN
  , pattern AL_EAXREVERB_REFLECTIONS_DELAY
  , pattern AL_EAXREVERB_REFLECTIONS_PAN
  , pattern AL_EAXREVERB_LATE_REVERB_GAIN
  , pattern AL_EAXREVERB_LATE_REVERB_DELAY
  , pattern AL_EAXREVERB_LATE_REVERB_PAN
  , pattern AL_EAXREVERB_ECHO_TIME
  , pattern AL_EAXREVERB_ECHO_DEPTH
  , pattern AL_EAXREVERB_MODULATION_TIME
  , pattern AL_EAXREVERB_MODULATION_DEPTH
  , pattern AL_EAXREVERB_AIR_ABSORPTION_GAINHF
  , pattern AL_EAXREVERB_HFREFERENCE
  , pattern AL_EAXREVERB_LFREFERENCE
  , pattern AL_EAXREVERB_ROOM_ROLLOFF_FACTOR
  , pattern AL_EAXREVERB_DECAY_HFLIMIT

    -- ** Chorus effect parameters
  , pattern AL_CHORUS_WAVEFORM
  , pattern AL_CHORUS_PHASE
  , pattern AL_CHORUS_RATE
  , pattern AL_CHORUS_DEPTH
  , pattern AL_CHORUS_FEEDBACK
  , pattern AL_CHORUS_DELAY

    -- ** Distortion effect parameters
  , pattern AL_DISTORTION_EDGE
  , pattern AL_DISTORTION_GAIN
  , pattern AL_DISTORTION_LOWPASS_CUTOFF
  , pattern AL_DISTORTION_EQCENTER
  , pattern AL_DISTORTION_EQBANDWIDTH

    -- ** Echo effect parameters
  , pattern AL_ECHO_DELAY
  , pattern AL_ECHO_LRDELAY
  , pattern AL_ECHO_DAMPING
  , pattern AL_ECHO_FEEDBACK
  , pattern AL_ECHO_SPREAD

    -- ** Flanger effect parameters
  , pattern AL_FLANGER_WAVEFORM
  , pattern AL_FLANGER_PHASE
  , pattern AL_FLANGER_RATE
  , pattern AL_FLANGER_DEPTH
  , pattern AL_FLANGER_FEEDBACK
  , pattern AL_FLANGER_DELAY

    -- ** Frequency shifter effect parameters
  , pattern AL_FREQUENCY_SHIFTER_FREQUENCY
  , pattern AL_FREQUENCY_SHIFTER_LEFT_DIRECTION
  , pattern AL_FREQUENCY_SHIFTER_RIGHT_DIRECTION

    -- ** Vocal morpher effect parameters
  , pattern AL_VOCAL_MORPHER_PHONEMEA
  , pattern AL_VOCAL_MORPHER_PHONEMEA_COARSE_TUNING
  , pattern AL_VOCAL_MORPHER_PHONEMEB
  , pattern AL_VOCAL_MORPHER_PHONEMEB_COARSE_TUNING
  , pattern AL_VOCAL_MORPHER_WAVEFORM
  , pattern AL_VOCAL_MORPHER_RATE

    -- ** Pitchshifter effect parameters
  , pattern AL_PITCH_SHIFTER_COARSE_TUNE
  , pattern AL_PITCH_SHIFTER_FINE_TUNE

    -- ** Ringmodulator effect parameters
  , pattern AL_RING_MODULATOR_FREQUENCY
  , pattern AL_RING_MODULATOR_HIGHPASS_CUTOFF
  , pattern AL_RING_MODULATOR_WAVEFORM

    -- ** Autowah effects parameters
  , pattern AL_AUTOWAH_ATTACK_TIME
  , pattern AL_AUTOWAH_RELEASE_TIME
  , pattern AL_AUTOWAH_RESONANCE
  , pattern AL_AUTOWAH_PEAK_GAIN

    -- ** Compressor effect parameters
  , pattern AL_COMPRESSOR_ONOFF

    -- ** Equalizer effect parameters
  , pattern AL_EQUALIZER_LOW_GAIN
  , pattern AL_EQUALIZER_LOW_CUTOFF
  , pattern AL_EQUALIZER_MID1_GAIN
  , pattern AL_EQUALIZER_MID1_CENTER
  , pattern AL_EQUALIZER_MID1_WIDTH
  , pattern AL_EQUALIZER_MID2_GAIN
  , pattern AL_EQUALIZER_MID2_CENTER
  , pattern AL_EQUALIZER_MID2_WIDTH
  , pattern AL_EQUALIZER_HIGH_GAIN
  , pattern AL_EQUALIZER_HIGH_CUTOFF

    -- ** Effect type
  , pattern AL_EFFECT_FIRST_PARAMETER
  , pattern AL_EFFECT_LAST_PARAMETER
  , pattern AL_EFFECT_TYPE

    -- *** Used with 'AL_EFFECT_TYPE' property
  , pattern AL_EFFECT_NULL
  , pattern AL_EFFECT_REVERB
  , pattern AL_EFFECT_CHORUS
  , pattern AL_EFFECT_DISTORTION
  , pattern AL_EFFECT_ECHO
  , pattern AL_EFFECT_FLANGER
  , pattern AL_EFFECT_FREQUENCY_SHIFTER
  , pattern AL_EFFECT_VOCAL_MORPHER
  , pattern AL_EFFECT_PITCH_SHIFTER
  , pattern AL_EFFECT_RING_MODULATOR
  , pattern AL_EFFECT_AUTOWAH
  , pattern AL_EFFECT_COMPRESSOR
  , pattern AL_EFFECT_EQUALIZER
  , pattern AL_EFFECT_EAXREVERB

    -- ** Auxiliary Slot object properties
  , pattern AL_EFFECTSLOT_EFFECT
  , pattern AL_EFFECTSLOT_GAIN
  , pattern AL_EFFECTSLOT_AUXILIARY_SEND_AUTO
  , pattern AL_EFFECTSLOT_NULL

    -- * Filter properties

    -- ** Lowpass filter parameters
  , pattern AL_LOWPASS_GAIN
  , pattern AL_LOWPASS_GAINHF

    -- ** Highpass filter parameters
  , pattern AL_HIGHPASS_GAIN
  , pattern AL_HIGHPASS_GAINLF

    -- ** Bandpass filter parameters
  , pattern AL_BANDPASS_GAIN
  , pattern AL_BANDPASS_GAINLF
  , pattern AL_BANDPASS_GAINHF

    -- ** Filter type
  , pattern AL_FILTER_FIRST_PARAMETER
  , pattern AL_FILTER_LAST_PARAMETER
  , pattern AL_FILTER_TYPE

    -- *** Used with 'AL_FILTER_TYPE' property
  , pattern AL_FILTER_NULL
  , pattern AL_FILTER_LOWPASS
  , pattern AL_FILTER_HIGHPASS
  , pattern AL_FILTER_BANDPASS

    -- * Effect object functions

    -- ** Create
  , ALGenEffects
  , alFunGenEffects

    -- ** Delete
  , ALDeleteEffects
  , alFunDeleteEffects

    -- ** Verify
  , ALIsEffect
  , alFunIsEffect

    -- ** Set an integer parameter
  , ALEffecti
  , alFunEffecti
  , ALEffectiv
  , alFunEffectiv

    -- ** Set a floating point parameter
  , ALEffectf
  , alFunEffectf
  , ALEffectfv
  , alFunEffectfv

    -- ** Get an integer parameter
  , ALGetEffecti
  , alFunGetEffecti
  , ALGetEffectiv
  , alFunGetEffectiv

    -- ** Get a floating point parameter
  , ALGetEffectf
  , alFunGetEffectf
  , ALGetEffectfv
  , alFunGetEffectfv

    -- * Filter object functions

    -- ** Create
  , ALGenFilters
  , alFunGenFilters

    -- ** Delete
  , ALDeleteFilters
  , alFunDeleteFilters

    -- ** Verify
  , ALIsFilter
  , alFunIsFilter

    -- ** Set an integer parameter
  , ALFilteri
  , alFunFilteri
  , ALFilteriv
  , alFunFilteriv

    -- ** Set a floating point parameter
  , ALFilterf
  , alFunFilterf
  , ALFilterfv
  , alFunFilterfv

    -- ** Get an integer parameter
  , ALGetFilteri
  , alFunGetFilteri
  , ALGetFilteriv
  , alFunGetFilteriv

    -- ** Get a floating point parameter
  , ALGetFilterf
  , alFunGetFilterf
  , ALGetFilterfv
  , alFunGetFilterfv

    -- * Auxiliary Slot object functions

    -- ** Create
  , ALGenAuxiliaryEffectSlots
  , alFunGenAuxiliaryEffectSlots

    -- ** Delete
  , ALDeleteAuxiliaryEffectSlots
  , alFunDeleteAuxiliaryEffectSlots

    -- ** Verify
  , ALIsAuxiliaryEffectSlot
  , alFunIsAuxiliaryEffectSlot

    -- ** Set an integer parameter
  , ALAuxiliaryEffectSloti
  , alFunAuxiliaryEffectSloti
  , ALAuxiliaryEffectSlotiv
  , alFunAuxiliaryEffectSlotiv

    -- ** Set a floating point parameter
  , ALAuxiliaryEffectSlotf
  , alFunAuxiliaryEffectSlotf
  , ALAuxiliaryEffectSlotfv
  , alFunAuxiliaryEffectSlotfv

    -- ** Get an integer parameter
  , ALGetAuxiliaryEffectSloti
  , alFunGetAuxiliaryEffectSloti
  , ALGetAuxiliaryEffectSlotiv
  , alFunGetAuxiliaryEffectSlotiv

    -- ** Get a floating point parameter
  , ALGetAuxiliaryEffectSlotf
  , alFunGetAuxiliaryEffectSlotf
  , ALGetAuxiliaryEffectSlotfv
  , alFunGetAuxiliaryEffectSlotfv

    -- * Filter ranges and defaults

    -- ** Lowpass filter
  , pattern LOWPASS_MIN_GAIN
  , pattern LOWPASS_MAX_GAIN
  , pattern LOWPASS_DEFAULT_GAIN

  , pattern LOWPASS_MIN_GAINHF
  , pattern LOWPASS_MAX_GAINHF
  , pattern LOWPASS_DEFAULT_GAINHF

    -- ** Highpass filter
  , pattern HIGHPASS_MIN_GAIN
  , pattern HIGHPASS_MAX_GAIN
  , pattern HIGHPASS_DEFAULT_GAIN

  , pattern HIGHPASS_MIN_GAINLF
  , pattern HIGHPASS_MAX_GAINLF
  , pattern HIGHPASS_DEFAULT_GAINLF

    -- ** Bandpass filter
  , pattern BANDPASS_MIN_GAIN
  , pattern BANDPASS_MAX_GAIN
  , pattern BANDPASS_DEFAULT_GAIN

  , pattern BANDPASS_MIN_GAINHF
  , pattern BANDPASS_MAX_GAINHF
  , pattern BANDPASS_DEFAULT_GAINHF

  , pattern BANDPASS_MIN_GAINLF
  , pattern BANDPASS_MAX_GAINLF
  , pattern BANDPASS_DEFAULT_GAINLF

    -- * Effect parameter

    -- ** Standard reverb effect
  , pattern AL_REVERB_MIN_DENSITY
  , pattern AL_REVERB_MAX_DENSITY
  , pattern AL_REVERB_DEFAULT_DENSITY

  , pattern AL_REVERB_MIN_DIFFUSION
  , pattern AL_REVERB_MAX_DIFFUSION
  , pattern AL_REVERB_DEFAULT_DIFFUSION

  , pattern AL_REVERB_MIN_GAIN
  , pattern AL_REVERB_MAX_GAIN
  , pattern AL_REVERB_DEFAULT_GAIN

  , pattern AL_REVERB_MIN_GAINHF
  , pattern AL_REVERB_MAX_GAINHF
  , pattern AL_REVERB_DEFAULT_GAINHF

  , pattern AL_REVERB_MIN_DECAY_TIME
  , pattern AL_REVERB_MAX_DECAY_TIME
  , pattern AL_REVERB_DEFAULT_DECAY_TIME

  , pattern AL_REVERB_MIN_DECAY_HFRATIO
  , pattern AL_REVERB_MAX_DECAY_HFRATIO
  , pattern AL_REVERB_DEFAULT_DECAY_HFRATIO

  , pattern AL_REVERB_MIN_REFLECTIONS_GAIN
  , pattern AL_REVERB_MAX_REFLECTIONS_GAIN
  , pattern AL_REVERB_DEFAULT_REFLECTIONS_GAIN

  , pattern AL_REVERB_MIN_REFLECTIONS_DELAY
  , pattern AL_REVERB_MAX_REFLECTIONS_DELAY
  , pattern AL_REVERB_DEFAULT_REFLECTIONS_DELAY

  , pattern AL_REVERB_MIN_LATE_REVERB_GAIN
  , pattern AL_REVERB_MAX_LATE_REVERB_GAIN
  , pattern AL_REVERB_DEFAULT_LATE_REVERB_GAIN

  , pattern AL_REVERB_MIN_LATE_REVERB_DELAY
  , pattern AL_REVERB_MAX_LATE_REVERB_DELAY
  , pattern AL_REVERB_DEFAULT_LATE_REVERB_DELAY

  , pattern AL_REVERB_MIN_AIR_ABSORPTION_GAINHF
  , pattern AL_REVERB_MAX_AIR_ABSORPTION_GAINHF
  , pattern AL_REVERB_DEFAULT_AIR_ABSORPTION_GAINHF

  , pattern AL_REVERB_MIN_ROOM_ROLLOFF_FACTOR
  , pattern AL_REVERB_MAX_ROOM_ROLLOFF_FACTOR
  , pattern AL_REVERB_DEFAULT_ROOM_ROLLOFF_FACTOR

  , pattern AL_REVERB_MIN_DECAY_HFLIMIT
  , pattern AL_REVERB_MAX_DECAY_HFLIMIT
  , pattern AL_REVERB_DEFAULT_DECAY_HFLIMIT

    -- ** EAX reverb effect
  , pattern AL_EAXREVERB_MIN_DENSITY
  , pattern AL_EAXREVERB_MAX_DENSITY
  , pattern AL_EAXREVERB_DEFAULT_DENSITY

  , pattern AL_EAXREVERB_MIN_DIFFUSION
  , pattern AL_EAXREVERB_MAX_DIFFUSION
  , pattern AL_EAXREVERB_DEFAULT_DIFFUSION

  , pattern AL_EAXREVERB_MIN_GAIN
  , pattern AL_EAXREVERB_MAX_GAIN
  , pattern AL_EAXREVERB_DEFAULT_GAIN

  , pattern AL_EAXREVERB_MIN_GAINHF
  , pattern AL_EAXREVERB_MAX_GAINHF
  , pattern AL_EAXREVERB_DEFAULT_GAINHF

  , pattern AL_EAXREVERB_MIN_GAINLF
  , pattern AL_EAXREVERB_MAX_GAINLF
  , pattern AL_EAXREVERB_DEFAULT_GAINLF

  , pattern AL_EAXREVERB_MIN_DECAY_TIME
  , pattern AL_EAXREVERB_MAX_DECAY_TIME
  , pattern AL_EAXREVERB_DEFAULT_DECAY_TIME

  , pattern AL_EAXREVERB_MIN_DECAY_HFRATIO
  , pattern AL_EAXREVERB_MAX_DECAY_HFRATIO
  , pattern AL_EAXREVERB_DEFAULT_DECAY_HFRATIO

  , pattern AL_EAXREVERB_MIN_DECAY_LFRATIO
  , pattern AL_EAXREVERB_MAX_DECAY_LFRATIO
  , pattern AL_EAXREVERB_DEFAULT_DECAY_LFRATIO

  , pattern AL_EAXREVERB_MIN_REFLECTIONS_GAIN
  , pattern AL_EAXREVERB_MAX_REFLECTIONS_GAIN
  , pattern AL_EAXREVERB_DEFAULT_REFLECTIONS_GAIN

  , pattern AL_EAXREVERB_MIN_REFLECTIONS_DELAY
  , pattern AL_EAXREVERB_MAX_REFLECTIONS_DELAY
  , pattern AL_EAXREVERB_DEFAULT_REFLECTIONS_DELAY

  , pattern AL_EAXREVERB_DEFAULT_REFLECTIONS_PAN_XYZ

  , pattern AL_EAXREVERB_MIN_LATE_REVERB_GAIN
  , pattern AL_EAXREVERB_MAX_LATE_REVERB_GAIN
  , pattern AL_EAXREVERB_DEFAULT_LATE_REVERB_GAIN

  , pattern AL_EAXREVERB_MIN_LATE_REVERB_DELAY
  , pattern AL_EAXREVERB_MAX_LATE_REVERB_DELAY
  , pattern AL_EAXREVERB_DEFAULT_LATE_REVERB_DELAY

  , pattern AL_EAXREVERB_DEFAULT_LATE_REVERB_PAN_XYZ

  , pattern AL_EAXREVERB_MIN_ECHO_TIME
  , pattern AL_EAXREVERB_MAX_ECHO_TIME
  , pattern AL_EAXREVERB_DEFAULT_ECHO_TIME

  , pattern AL_EAXREVERB_MIN_ECHO_DEPTH
  , pattern AL_EAXREVERB_MAX_ECHO_DEPTH
  , pattern AL_EAXREVERB_DEFAULT_ECHO_DEPTH

  , pattern AL_EAXREVERB_MIN_MODULATION_TIME
  , pattern AL_EAXREVERB_MAX_MODULATION_TIME
  , pattern AL_EAXREVERB_DEFAULT_MODULATION_TIME

  , pattern AL_EAXREVERB_MIN_MODULATION_DEPTH
  , pattern AL_EAXREVERB_MAX_MODULATION_DEPTH
  , pattern AL_EAXREVERB_DEFAULT_MODULATION_DEPTH

  , pattern AL_EAXREVERB_MIN_AIR_ABSORPTION_GAINHF
  , pattern AL_EAXREVERB_MAX_AIR_ABSORPTION_GAINHF
  , pattern AL_EAXREVERB_DEFAULT_AIR_ABSORPTION_GAINHF

  , pattern AL_EAXREVERB_MIN_HFREFERENCE
  , pattern AL_EAXREVERB_MAX_HFREFERENCE
  , pattern AL_EAXREVERB_DEFAULT_HFREFERENCE

  , pattern AL_EAXREVERB_MIN_LFREFERENCE
  , pattern AL_EAXREVERB_MAX_LFREFERENCE
  , pattern AL_EAXREVERB_DEFAULT_LFREFERENCE

  , pattern AL_EAXREVERB_MIN_ROOM_ROLLOFF_FACTOR
  , pattern AL_EAXREVERB_MAX_ROOM_ROLLOFF_FACTOR
  , pattern AL_EAXREVERB_DEFAULT_ROOM_ROLLOFF_FACTOR

  , pattern AL_EAXREVERB_MIN_DECAY_HFLIMIT
  , pattern AL_EAXREVERB_MAX_DECAY_HFLIMIT
  , pattern AL_EAXREVERB_DEFAULT_DECAY_HFLIMIT

    -- ** Chorus effect
  , pattern AL_CHORUS_MIN_WAVEFORM
  , pattern AL_CHORUS_MAX_WAVEFORM
  , pattern AL_CHORUS_DEFAULT_WAVEFORM

  , pattern AL_CHORUS_WAVEFORM_SINUSOID
  , pattern AL_CHORUS_WAVEFORM_TRIANGLE

  , pattern AL_CHORUS_MIN_PHASE
  , pattern AL_CHORUS_MAX_PHASE
  , pattern AL_CHORUS_DEFAULT_PHASE

  , pattern AL_CHORUS_MIN_RATE
  , pattern AL_CHORUS_MAX_RATE
  , pattern AL_CHORUS_DEFAULT_RATE

  , pattern AL_CHORUS_MIN_DEPTH
  , pattern AL_CHORUS_MAX_DEPTH
  , pattern AL_CHORUS_DEFAULT_DEPTH

  , pattern AL_CHORUS_MIN_FEEDBACK
  , pattern AL_CHORUS_MAX_FEEDBACK
  , pattern AL_CHORUS_DEFAULT_FEEDBACK

  , pattern AL_CHORUS_MIN_DELAY
  , pattern AL_CHORUS_MAX_DELAY
  , pattern AL_CHORUS_DEFAULT_DELAY

    -- ** Distortion effect
  , pattern AL_DISTORTION_MIN_EDGE
  , pattern AL_DISTORTION_MAX_EDGE
  , pattern AL_DISTORTION_DEFAULT_EDGE

  , pattern AL_DISTORTION_MIN_GAIN
  , pattern AL_DISTORTION_MAX_GAIN
  , pattern AL_DISTORTION_DEFAULT_GAIN

  , pattern AL_DISTORTION_MIN_LOWPASS_CUTOFF
  , pattern AL_DISTORTION_MAX_LOWPASS_CUTOFF
  , pattern AL_DISTORTION_DEFAULT_LOWPASS_CUTOFF

  , pattern AL_DISTORTION_MIN_EQCENTER
  , pattern AL_DISTORTION_MAX_EQCENTER
  , pattern AL_DISTORTION_DEFAULT_EQCENTER

  , pattern AL_DISTORTION_MIN_EQBANDWIDTH
  , pattern AL_DISTORTION_MAX_EQBANDWIDTH
  , pattern AL_DISTORTION_DEFAULT_EQBANDWIDTH

    -- ** Echo effect
  , pattern AL_ECHO_MIN_DELAY
  , pattern AL_ECHO_MAX_DELAY
  , pattern AL_ECHO_DEFAULT_DELAY

  , pattern AL_ECHO_MIN_LRDELAY
  , pattern AL_ECHO_MAX_LRDELAY
  , pattern AL_ECHO_DEFAULT_LRDELAY

  , pattern AL_ECHO_MIN_DAMPING
  , pattern AL_ECHO_MAX_DAMPING
  , pattern AL_ECHO_DEFAULT_DAMPING

  , pattern AL_ECHO_MIN_FEEDBACK
  , pattern AL_ECHO_MAX_FEEDBACK
  , pattern AL_ECHO_DEFAULT_FEEDBACK

  , pattern AL_ECHO_MIN_SPREAD
  , pattern AL_ECHO_MAX_SPREAD
  , pattern AL_ECHO_DEFAULT_SPREAD

    -- ** Flanger effect
  , pattern AL_FLANGER_MIN_WAVEFORM
  , pattern AL_FLANGER_MAX_WAVEFORM
  , pattern AL_FLANGER_DEFAULT_WAVEFORM

  , pattern AL_FLANGER_WAVEFORM_SINUSOID
  , pattern AL_FLANGER_WAVEFORM_TRIANGLE

  , pattern AL_FLANGER_MIN_PHASE
  , pattern AL_FLANGER_MAX_PHASE
  , pattern AL_FLANGER_DEFAULT_PHASE

  , pattern AL_FLANGER_MIN_RATE
  , pattern AL_FLANGER_MAX_RATE
  , pattern AL_FLANGER_DEFAULT_RATE

  , pattern AL_FLANGER_MIN_DEPTH
  , pattern AL_FLANGER_MAX_DEPTH
  , pattern AL_FLANGER_DEFAULT_DEPTH

  , pattern AL_FLANGER_MIN_FEEDBACK
  , pattern AL_FLANGER_MAX_FEEDBACK
  , pattern AL_FLANGER_DEFAULT_FEEDBACK

  , pattern AL_FLANGER_MIN_DELAY
  , pattern AL_FLANGER_MAX_DELAY
  , pattern AL_FLANGER_DEFAULT_DELAY

    -- ** Frequency shifter effect
  , pattern AL_FREQUENCY_SHIFTER_MIN_FREQUENCY
  , pattern AL_FREQUENCY_SHIFTER_MAX_FREQUENCY
  , pattern AL_FREQUENCY_SHIFTER_DEFAULT_FREQUENCY

  , pattern AL_FREQUENCY_SHIFTER_MIN_LEFT_DIRECTION
  , pattern AL_FREQUENCY_SHIFTER_MAX_LEFT_DIRECTION
  , pattern AL_FREQUENCY_SHIFTER_DEFAULT_LEFT_DIRECTION

  , pattern AL_FREQUENCY_SHIFTER_MIN_RIGHT_DIRECTION
  , pattern AL_FREQUENCY_SHIFTER_MAX_RIGHT_DIRECTION
  , pattern AL_FREQUENCY_SHIFTER_DEFAULT_RIGHT_DIRECTION

  , pattern AL_FREQUENCY_SHIFTER_DIRECTION_DOWN
  , pattern AL_FREQUENCY_SHIFTER_DIRECTION_UP
  , pattern AL_FREQUENCY_SHIFTER_DIRECTION_OFF

    -- ** Vocal morpher effect
  , pattern AL_VOCAL_MORPHER_MIN_PHONEMEA
  , pattern AL_VOCAL_MORPHER_MAX_PHONEMEA
  , pattern AL_VOCAL_MORPHER_DEFAULT_PHONEMEA

  , pattern AL_VOCAL_MORPHER_MIN_PHONEMEA_COARSE_TUNING
  , pattern AL_VOCAL_MORPHER_MAX_PHONEMEA_COARSE_TUNING
  , pattern AL_VOCAL_MORPHER_DEFAULT_PHONEMEA_COARSE_TUNING

  , pattern AL_VOCAL_MORPHER_MIN_PHONEMEB
  , pattern AL_VOCAL_MORPHER_MAX_PHONEMEB
  , pattern AL_VOCAL_MORPHER_DEFAULT_PHONEMEB

  , pattern AL_VOCAL_MORPHER_PHONEME_A
  , pattern AL_VOCAL_MORPHER_PHONEME_E
  , pattern AL_VOCAL_MORPHER_PHONEME_I
  , pattern AL_VOCAL_MORPHER_PHONEME_O
  , pattern AL_VOCAL_MORPHER_PHONEME_U
  , pattern AL_VOCAL_MORPHER_PHONEME_AA
  , pattern AL_VOCAL_MORPHER_PHONEME_AE
  , pattern AL_VOCAL_MORPHER_PHONEME_AH
  , pattern AL_VOCAL_MORPHER_PHONEME_AO
  , pattern AL_VOCAL_MORPHER_PHONEME_EH
  , pattern AL_VOCAL_MORPHER_PHONEME_ER
  , pattern AL_VOCAL_MORPHER_PHONEME_IH
  , pattern AL_VOCAL_MORPHER_PHONEME_IY
  , pattern AL_VOCAL_MORPHER_PHONEME_UH
  , pattern AL_VOCAL_MORPHER_PHONEME_UW
  , pattern AL_VOCAL_MORPHER_PHONEME_B
  , pattern AL_VOCAL_MORPHER_PHONEME_D
  , pattern AL_VOCAL_MORPHER_PHONEME_F
  , pattern AL_VOCAL_MORPHER_PHONEME_G
  , pattern AL_VOCAL_MORPHER_PHONEME_J
  , pattern AL_VOCAL_MORPHER_PHONEME_K
  , pattern AL_VOCAL_MORPHER_PHONEME_L
  , pattern AL_VOCAL_MORPHER_PHONEME_M
  , pattern AL_VOCAL_MORPHER_PHONEME_N
  , pattern AL_VOCAL_MORPHER_PHONEME_P
  , pattern AL_VOCAL_MORPHER_PHONEME_R
  , pattern AL_VOCAL_MORPHER_PHONEME_S
  , pattern AL_VOCAL_MORPHER_PHONEME_T
  , pattern AL_VOCAL_MORPHER_PHONEME_V
  , pattern AL_VOCAL_MORPHER_PHONEME_Z

  , pattern AL_VOCAL_MORPHER_MIN_PHONEMEB_COARSE_TUNING
  , pattern AL_VOCAL_MORPHER_MAX_PHONEMEB_COARSE_TUNING
  , pattern AL_VOCAL_MORPHER_DEFAULT_PHONEMEB_COARSE_TUNING

  , pattern AL_VOCAL_MORPHER_MIN_WAVEFORM
  , pattern AL_VOCAL_MORPHER_MAX_WAVEFORM
  , pattern AL_VOCAL_MORPHER_DEFAULT_WAVEFORM

  , pattern AL_VOCAL_MORPHER_WAVEFORM_SINUSOID
  , pattern AL_VOCAL_MORPHER_WAVEFORM_TRIANGLE
  , pattern AL_VOCAL_MORPHER_WAVEFORM_SAWTOOTH

  , pattern AL_VOCAL_MORPHER_MIN_RATE
  , pattern AL_VOCAL_MORPHER_MAX_RATE
  , pattern AL_VOCAL_MORPHER_DEFAULT_RATE

    -- ** Pitch shifter effect
  , pattern AL_PITCH_SHIFTER_MIN_COARSE_TUNE
  , pattern AL_PITCH_SHIFTER_MAX_COARSE_TUNE
  , pattern AL_PITCH_SHIFTER_DEFAULT_COARSE_TUNE

  , pattern AL_PITCH_SHIFTER_MIN_FINE_TUNE
  , pattern AL_PITCH_SHIFTER_MAX_FINE_TUNE
  , pattern AL_PITCH_SHIFTER_DEFAULT_FINE_TUNE

    -- ** Ring modulator effect
  , pattern AL_RING_MODULATOR_MIN_FREQUENCY
  , pattern AL_RING_MODULATOR_MAX_FREQUENCY
  , pattern AL_RING_MODULATOR_DEFAULT_FREQUENCY

  , pattern AL_RING_MODULATOR_MIN_HIGHPASS_CUTOFF
  , pattern AL_RING_MODULATOR_MAX_HIGHPASS_CUTOFF
  , pattern AL_RING_MODULATOR_DEFAULT_HIGHPASS_CUTOFF

  , pattern AL_RING_MODULATOR_MIN_WAVEFORM
  , pattern AL_RING_MODULATOR_MAX_WAVEFORM
  , pattern AL_RING_MODULATOR_DEFAULT_WAVEFORM

  , pattern AL_RING_MODULATOR_SINUSOID
  , pattern AL_RING_MODULATOR_SAWTOOTH
  , pattern AL_RING_MODULATOR_SQUARE

    -- ** Autowah effect
  , pattern AL_AUTOWAH_MIN_ATTACK_TIME
  , pattern AL_AUTOWAH_MAX_ATTACK_TIME
  , pattern AL_AUTOWAH_DEFAULT_ATTACK_TIME

  , pattern AL_AUTOWAH_MIN_RELEASE_TIME
  , pattern AL_AUTOWAH_MAX_RELEASE_TIME
  , pattern AL_AUTOWAH_DEFAULT_RELEASE_TIME

  , pattern AL_AUTOWAH_MIN_RESONANCE
  , pattern AL_AUTOWAH_MAX_RESONANCE
  , pattern AL_AUTOWAH_DEFAULT_RESONANCE

  , pattern AL_AUTOWAH_MIN_PEAK_GAIN
  , pattern AL_AUTOWAH_MAX_PEAK_GAIN
  , pattern AL_AUTOWAH_DEFAULT_PEAK_GAIN

    -- ** Compressor effect
  , pattern AL_COMPRESSOR_MIN_ONOFF
  , pattern AL_COMPRESSOR_MAX_ONOFF
  , pattern AL_COMPRESSOR_DEFAULT_ONOFF

    -- ** Equalizer effect
  , pattern AL_EQUALIZER_MIN_LOW_GAIN
  , pattern AL_EQUALIZER_MAX_LOW_GAIN
  , pattern AL_EQUALIZER_DEFAULT_LOW_GAIN

  , pattern AL_EQUALIZER_MIN_LOW_CUTOFF
  , pattern AL_EQUALIZER_MAX_LOW_CUTOFF
  , pattern AL_EQUALIZER_DEFAULT_LOW_CUTOFF

  , pattern AL_EQUALIZER_MIN_MID1_GAIN
  , pattern AL_EQUALIZER_MAX_MID1_GAIN
  , pattern AL_EQUALIZER_DEFAULT_MID1_GAIN

  , pattern AL_EQUALIZER_MIN_MID1_CENTER
  , pattern AL_EQUALIZER_MAX_MID1_CENTER
  , pattern AL_EQUALIZER_DEFAULT_MID1_CENTER

  , pattern AL_EQUALIZER_MIN_MID1_WIDTH
  , pattern AL_EQUALIZER_MAX_MID1_WIDTH
  , pattern AL_EQUALIZER_DEFAULT_MID1_WIDTH

  , pattern AL_EQUALIZER_MIN_MID2_GAIN
  , pattern AL_EQUALIZER_MAX_MID2_GAIN
  , pattern AL_EQUALIZER_DEFAULT_MID2_GAIN

  , pattern AL_EQUALIZER_MIN_MID2_CENTER
  , pattern AL_EQUALIZER_MAX_MID2_CENTER
  , pattern AL_EQUALIZER_DEFAULT_MID2_CENTER

  , pattern AL_EQUALIZER_MIN_MID2_WIDTH
  , pattern AL_EQUALIZER_MAX_MID2_WIDTH
  , pattern AL_EQUALIZER_DEFAULT_MID2_WIDTH

  , pattern AL_EQUALIZER_MIN_HIGH_GAIN
  , pattern AL_EQUALIZER_MAX_HIGH_GAIN
  , pattern AL_EQUALIZER_DEFAULT_HIGH_GAIN

  , pattern AL_EQUALIZER_MIN_HIGH_CUTOFF
  , pattern AL_EQUALIZER_MAX_HIGH_CUTOFF
  , pattern AL_EQUALIZER_DEFAULT_HIGH_CUTOFF

    -- ** Source parameter
  , pattern AL_MIN_AIR_ABSORPTION_FACTOR
  , pattern AL_MAX_AIR_ABSORPTION_FACTOR
  , pattern AL_DEFAULT_AIR_ABSORPTION_FACTOR

  , pattern AL_MIN_ROOM_ROLLOFF_FACTOR
  , pattern AL_MAX_ROOM_ROLLOFF_FACTOR
  , pattern AL_DEFAULT_ROOM_ROLLOFF_FACTOR

  , pattern AL_MIN_CONE_OUTER_GAINHF
  , pattern AL_MAX_CONE_OUTER_GAINHF
  , pattern AL_DEFAULT_CONE_OUTER_GAINHF

  , pattern AL_MIN_DIRECT_FILTER_GAINHF_AUTO
  , pattern AL_MAX_DIRECT_FILTER_GAINHF_AUTO
  , pattern AL_DEFAULT_DIRECT_FILTER_GAINHF_AUTO

  , pattern AL_MIN_AUXILIARY_SEND_FILTER_GAIN_AUTO
  , pattern AL_MAX_AUXILIARY_SEND_FILTER_GAIN_AUTO
  , pattern AL_DEFAULT_AUXILIARY_SEND_FILTER_GAIN_AUTO

  , pattern AL_MIN_AUXILIARY_SEND_FILTER_GAINHF_AUTO
  , pattern AL_MAX_AUXILIARY_SEND_FILTER_GAINHF_AUTO
  , pattern AL_DEFAULT_AUXILIARY_SEND_FILTER_GAINHF_AUTO

    -- ** Listener parameter
  , pattern AL_MIN_METERS_PER_UNIT
  , pattern AL_MAX_METERS_PER_UNIT
  , pattern AL_DEFAULT_METERS_PER_UNIT

  ) where

import           Sound.AL
import           Sound.ALC

import           GHC.Ptr



pattern ALC_EXT_EFX_NAME :: Ptr ALCchar
pattern ALC_EXT_EFX_NAME <- (const False -> True)
  where
    ALC_EXT_EFX_NAME = Ptr "ALC_EXT_EFX\0"#

pattern ALC_EFX_MAJOR_VERSION
      , ALC_EFX_MINOR_VERSION
      , ALC_MAX_AUXILIARY_SENDS
     :: (Eq a, Num a) => a
pattern ALC_EFX_MAJOR_VERSION   = 0x20001
pattern ALC_EFX_MINOR_VERSION   = 0x20002
pattern ALC_MAX_AUXILIARY_SENDS = 0x20003

pattern AL_METERS_PER_UNIT :: (Eq a, Num a) => a
pattern AL_METERS_PER_UNIT = 0x20004

pattern AL_DIRECT_FILTER
      , AL_AUXILIARY_SEND_FILTER
      , AL_AIR_ABSORPTION_FACTOR
      , AL_ROOM_ROLLOFF_FACTOR
      , AL_CONE_OUTER_GAINHF
      , AL_DIRECT_FILTER_GAINHF_AUTO
      , AL_AUXILIARY_SEND_FILTER_GAIN_AUTO
      , AL_AUXILIARY_SEND_FILTER_GAINHF_AUTO
     :: (Eq a, Num a) => a
pattern AL_DIRECT_FILTER                     = 0x20005
pattern AL_AUXILIARY_SEND_FILTER             = 0x20006
pattern AL_AIR_ABSORPTION_FACTOR             = 0x20007
pattern AL_ROOM_ROLLOFF_FACTOR               = 0x20008
pattern AL_CONE_OUTER_GAINHF                 = 0x20009
pattern AL_DIRECT_FILTER_GAINHF_AUTO         = 0x2000A
pattern AL_AUXILIARY_SEND_FILTER_GAIN_AUTO   = 0x2000B
pattern AL_AUXILIARY_SEND_FILTER_GAINHF_AUTO = 0x2000C

pattern AL_REVERB_DENSITY
      , AL_REVERB_DIFFUSION
      , AL_REVERB_GAIN
      , AL_REVERB_GAINHF
      , AL_REVERB_DECAY_TIME
      , AL_REVERB_DECAY_HFRATIO
      , AL_REVERB_REFLECTIONS_GAIN
      , AL_REVERB_REFLECTIONS_DELAY
      , AL_REVERB_LATE_REVERB_GAIN
      , AL_REVERB_LATE_REVERB_DELAY
      , AL_REVERB_AIR_ABSORPTION_GAINHF
      , AL_REVERB_ROOM_ROLLOFF_FACTOR
      , AL_REVERB_DECAY_HFLIMIT
     :: (Eq a, Num a) => a
pattern AL_REVERB_DENSITY               = 0x0001
pattern AL_REVERB_DIFFUSION             = 0x0002
pattern AL_REVERB_GAIN                  = 0x0003
pattern AL_REVERB_GAINHF                = 0x0004
pattern AL_REVERB_DECAY_TIME            = 0x0005
pattern AL_REVERB_DECAY_HFRATIO         = 0x0006
pattern AL_REVERB_REFLECTIONS_GAIN      = 0x0007
pattern AL_REVERB_REFLECTIONS_DELAY     = 0x0008
pattern AL_REVERB_LATE_REVERB_GAIN      = 0x0009
pattern AL_REVERB_LATE_REVERB_DELAY     = 0x000A
pattern AL_REVERB_AIR_ABSORPTION_GAINHF = 0x000B
pattern AL_REVERB_ROOM_ROLLOFF_FACTOR   = 0x000C
pattern AL_REVERB_DECAY_HFLIMIT         = 0x000D

pattern AL_EAXREVERB_DENSITY
      , AL_EAXREVERB_DIFFUSION
      , AL_EAXREVERB_GAIN
      , AL_EAXREVERB_GAINHF
      , AL_EAXREVERB_GAINLF
      , AL_EAXREVERB_DECAY_TIME
      , AL_EAXREVERB_DECAY_HFRATIO
      , AL_EAXREVERB_DECAY_LFRATIO
      , AL_EAXREVERB_REFLECTIONS_GAIN
      , AL_EAXREVERB_REFLECTIONS_DELAY
      , AL_EAXREVERB_REFLECTIONS_PAN
      , AL_EAXREVERB_LATE_REVERB_GAIN
      , AL_EAXREVERB_LATE_REVERB_DELAY
      , AL_EAXREVERB_LATE_REVERB_PAN
      , AL_EAXREVERB_ECHO_TIME
      , AL_EAXREVERB_ECHO_DEPTH
      , AL_EAXREVERB_MODULATION_TIME
      , AL_EAXREVERB_MODULATION_DEPTH
      , AL_EAXREVERB_AIR_ABSORPTION_GAINHF
      , AL_EAXREVERB_HFREFERENCE
      , AL_EAXREVERB_LFREFERENCE
      , AL_EAXREVERB_ROOM_ROLLOFF_FACTOR
      , AL_EAXREVERB_DECAY_HFLIMIT
     :: (Eq a, Num a) => a
pattern AL_EAXREVERB_DENSITY               = 0x0001
pattern AL_EAXREVERB_DIFFUSION             = 0x0002
pattern AL_EAXREVERB_GAIN                  = 0x0003
pattern AL_EAXREVERB_GAINHF                = 0x0004
pattern AL_EAXREVERB_GAINLF                = 0x0005
pattern AL_EAXREVERB_DECAY_TIME            = 0x0006
pattern AL_EAXREVERB_DECAY_HFRATIO         = 0x0007
pattern AL_EAXREVERB_DECAY_LFRATIO         = 0x0008
pattern AL_EAXREVERB_REFLECTIONS_GAIN      = 0x0009
pattern AL_EAXREVERB_REFLECTIONS_DELAY     = 0x000A
pattern AL_EAXREVERB_REFLECTIONS_PAN       = 0x000B
pattern AL_EAXREVERB_LATE_REVERB_GAIN      = 0x000C
pattern AL_EAXREVERB_LATE_REVERB_DELAY     = 0x000D
pattern AL_EAXREVERB_LATE_REVERB_PAN       = 0x000E
pattern AL_EAXREVERB_ECHO_TIME             = 0x000F
pattern AL_EAXREVERB_ECHO_DEPTH            = 0x0010
pattern AL_EAXREVERB_MODULATION_TIME       = 0x0011
pattern AL_EAXREVERB_MODULATION_DEPTH      = 0x0012
pattern AL_EAXREVERB_AIR_ABSORPTION_GAINHF = 0x0013
pattern AL_EAXREVERB_HFREFERENCE           = 0x0014
pattern AL_EAXREVERB_LFREFERENCE           = 0x0015
pattern AL_EAXREVERB_ROOM_ROLLOFF_FACTOR   = 0x0016
pattern AL_EAXREVERB_DECAY_HFLIMIT         = 0x0017

pattern AL_CHORUS_WAVEFORM
      , AL_CHORUS_PHASE
      , AL_CHORUS_RATE
      , AL_CHORUS_DEPTH
      , AL_CHORUS_FEEDBACK
      , AL_CHORUS_DELAY
     :: (Eq a, Num a) => a
pattern AL_CHORUS_WAVEFORM = 0x0001
pattern AL_CHORUS_PHASE    = 0x0002
pattern AL_CHORUS_RATE     = 0x0003
pattern AL_CHORUS_DEPTH    = 0x0004
pattern AL_CHORUS_FEEDBACK = 0x0005
pattern AL_CHORUS_DELAY    = 0x0006

pattern AL_DISTORTION_EDGE
      , AL_DISTORTION_GAIN
      , AL_DISTORTION_LOWPASS_CUTOFF
      , AL_DISTORTION_EQCENTER
      , AL_DISTORTION_EQBANDWIDTH
     :: (Eq a, Num a) => a
pattern AL_DISTORTION_EDGE           = 0x0001
pattern AL_DISTORTION_GAIN           = 0x0002
pattern AL_DISTORTION_LOWPASS_CUTOFF = 0x0003
pattern AL_DISTORTION_EQCENTER       = 0x0004
pattern AL_DISTORTION_EQBANDWIDTH    = 0x0005

pattern AL_ECHO_DELAY
      , AL_ECHO_LRDELAY
      , AL_ECHO_DAMPING
      , AL_ECHO_FEEDBACK
      , AL_ECHO_SPREAD
     :: (Eq a, Num a) => a
pattern AL_ECHO_DELAY    = 0x0001
pattern AL_ECHO_LRDELAY  = 0x0002
pattern AL_ECHO_DAMPING  = 0x0003
pattern AL_ECHO_FEEDBACK = 0x0004
pattern AL_ECHO_SPREAD   = 0x0005

pattern AL_FLANGER_WAVEFORM
      , AL_FLANGER_PHASE
      , AL_FLANGER_RATE
      , AL_FLANGER_DEPTH
      , AL_FLANGER_FEEDBACK
      , AL_FLANGER_DELAY
     :: (Eq a, Num a) => a
pattern AL_FLANGER_WAVEFORM = 0x0001
pattern AL_FLANGER_PHASE    = 0x0002
pattern AL_FLANGER_RATE     = 0x0003
pattern AL_FLANGER_DEPTH    = 0x0004
pattern AL_FLANGER_FEEDBACK = 0x0005
pattern AL_FLANGER_DELAY    = 0x0006

pattern AL_FREQUENCY_SHIFTER_FREQUENCY
      , AL_FREQUENCY_SHIFTER_LEFT_DIRECTION
      , AL_FREQUENCY_SHIFTER_RIGHT_DIRECTION
     :: (Eq a, Num a) => a
pattern AL_FREQUENCY_SHIFTER_FREQUENCY       = 0x0001
pattern AL_FREQUENCY_SHIFTER_LEFT_DIRECTION  = 0x0002
pattern AL_FREQUENCY_SHIFTER_RIGHT_DIRECTION = 0x0003

pattern AL_VOCAL_MORPHER_PHONEMEA
      , AL_VOCAL_MORPHER_PHONEMEA_COARSE_TUNING
      , AL_VOCAL_MORPHER_PHONEMEB
      , AL_VOCAL_MORPHER_PHONEMEB_COARSE_TUNING
      , AL_VOCAL_MORPHER_WAVEFORM
      , AL_VOCAL_MORPHER_RATE
     :: (Eq a, Num a) => a
pattern AL_VOCAL_MORPHER_PHONEMEA               = 0x0001
pattern AL_VOCAL_MORPHER_PHONEMEA_COARSE_TUNING = 0x0002
pattern AL_VOCAL_MORPHER_PHONEMEB               = 0x0003
pattern AL_VOCAL_MORPHER_PHONEMEB_COARSE_TUNING = 0x0004
pattern AL_VOCAL_MORPHER_WAVEFORM               = 0x0005
pattern AL_VOCAL_MORPHER_RATE                   = 0x0006

pattern AL_PITCH_SHIFTER_COARSE_TUNE
      , AL_PITCH_SHIFTER_FINE_TUNE
     :: (Eq a, Num a) => a
pattern AL_PITCH_SHIFTER_COARSE_TUNE = 0x0001
pattern AL_PITCH_SHIFTER_FINE_TUNE   = 0x0002

pattern AL_RING_MODULATOR_FREQUENCY
      , AL_RING_MODULATOR_HIGHPASS_CUTOFF
      , AL_RING_MODULATOR_WAVEFORM
     :: (Eq a, Num a) => a
pattern AL_RING_MODULATOR_FREQUENCY       = 0x0001
pattern AL_RING_MODULATOR_HIGHPASS_CUTOFF = 0x0002
pattern AL_RING_MODULATOR_WAVEFORM        = 0x0003

pattern AL_AUTOWAH_ATTACK_TIME
      , AL_AUTOWAH_RELEASE_TIME
      , AL_AUTOWAH_RESONANCE
      , AL_AUTOWAH_PEAK_GAIN
     :: (Eq a, Num a) => a
pattern AL_AUTOWAH_ATTACK_TIME  = 0x0001
pattern AL_AUTOWAH_RELEASE_TIME = 0x0002
pattern AL_AUTOWAH_RESONANCE    = 0x0003
pattern AL_AUTOWAH_PEAK_GAIN    = 0x0004

pattern AL_COMPRESSOR_ONOFF :: (Eq a, Num a) => a
pattern AL_COMPRESSOR_ONOFF = 0x0001

pattern AL_EQUALIZER_LOW_GAIN
      , AL_EQUALIZER_LOW_CUTOFF
      , AL_EQUALIZER_MID1_GAIN
      , AL_EQUALIZER_MID1_CENTER
      , AL_EQUALIZER_MID1_WIDTH
      , AL_EQUALIZER_MID2_GAIN
      , AL_EQUALIZER_MID2_CENTER
      , AL_EQUALIZER_MID2_WIDTH
      , AL_EQUALIZER_HIGH_GAIN
      , AL_EQUALIZER_HIGH_CUTOFF
     :: (Eq a, Num a) => a
pattern AL_EQUALIZER_LOW_GAIN    = 0x0001
pattern AL_EQUALIZER_LOW_CUTOFF  = 0x0002
pattern AL_EQUALIZER_MID1_GAIN   = 0x0003
pattern AL_EQUALIZER_MID1_CENTER = 0x0004
pattern AL_EQUALIZER_MID1_WIDTH  = 0x0005
pattern AL_EQUALIZER_MID2_GAIN   = 0x0006
pattern AL_EQUALIZER_MID2_CENTER = 0x0007
pattern AL_EQUALIZER_MID2_WIDTH  = 0x0008
pattern AL_EQUALIZER_HIGH_GAIN   = 0x0009
pattern AL_EQUALIZER_HIGH_CUTOFF = 0x000A

pattern AL_EFFECT_FIRST_PARAMETER
      , AL_EFFECT_LAST_PARAMETER
      , AL_EFFECT_TYPE
     :: (Eq a, Num a) => a
pattern AL_EFFECT_FIRST_PARAMETER = 0x0000
pattern AL_EFFECT_LAST_PARAMETER  = 0x8000
pattern AL_EFFECT_TYPE            = 0x8001

pattern AL_EFFECT_NULL
      , AL_EFFECT_REVERB
      , AL_EFFECT_CHORUS
      , AL_EFFECT_DISTORTION
      , AL_EFFECT_ECHO
      , AL_EFFECT_FLANGER
      , AL_EFFECT_FREQUENCY_SHIFTER
      , AL_EFFECT_VOCAL_MORPHER
      , AL_EFFECT_PITCH_SHIFTER
      , AL_EFFECT_RING_MODULATOR
      , AL_EFFECT_AUTOWAH
      , AL_EFFECT_COMPRESSOR
      , AL_EFFECT_EQUALIZER
      , AL_EFFECT_EAXREVERB
     :: (Eq a, Num a) => a
pattern AL_EFFECT_NULL              = 0x0000
pattern AL_EFFECT_REVERB            = 0x0001
pattern AL_EFFECT_CHORUS            = 0x0002
pattern AL_EFFECT_DISTORTION        = 0x0003
pattern AL_EFFECT_ECHO              = 0x0004
pattern AL_EFFECT_FLANGER           = 0x0005
pattern AL_EFFECT_FREQUENCY_SHIFTER = 0x0006
pattern AL_EFFECT_VOCAL_MORPHER     = 0x0007
pattern AL_EFFECT_PITCH_SHIFTER     = 0x0008
pattern AL_EFFECT_RING_MODULATOR    = 0x0009
pattern AL_EFFECT_AUTOWAH           = 0x000A
pattern AL_EFFECT_COMPRESSOR        = 0x000B
pattern AL_EFFECT_EQUALIZER         = 0x000C
pattern AL_EFFECT_EAXREVERB         = 0x8000

pattern AL_EFFECTSLOT_EFFECT
      , AL_EFFECTSLOT_GAIN
      , AL_EFFECTSLOT_AUXILIARY_SEND_AUTO
     :: (Eq a, Num a) => a
pattern AL_EFFECTSLOT_EFFECT              = 0x0001
pattern AL_EFFECTSLOT_GAIN                = 0x0002
pattern AL_EFFECTSLOT_AUXILIARY_SEND_AUTO = 0x0003

-- | NULL Auxiliary Slot ID to disable a source send.
pattern AL_EFFECTSLOT_NULL :: (Eq a, Num a) => a
pattern AL_EFFECTSLOT_NULL = 0x0000

pattern AL_LOWPASS_GAIN
      , AL_LOWPASS_GAINHF
     :: (Eq a, Num a) => a
pattern AL_LOWPASS_GAIN   = 0x0001
pattern AL_LOWPASS_GAINHF = 0x0002

pattern AL_HIGHPASS_GAIN
      , AL_HIGHPASS_GAINLF
     :: (Eq a, Num a) => a
pattern AL_HIGHPASS_GAIN   = 0x0001
pattern AL_HIGHPASS_GAINLF = 0x0002

pattern AL_BANDPASS_GAIN
      , AL_BANDPASS_GAINLF
      , AL_BANDPASS_GAINHF
     :: (Eq a, Num a) => a
pattern AL_BANDPASS_GAIN   = 0x0001
pattern AL_BANDPASS_GAINLF = 0x0002
pattern AL_BANDPASS_GAINHF = 0x0003

pattern AL_FILTER_FIRST_PARAMETER
      , AL_FILTER_LAST_PARAMETER
      , AL_FILTER_TYPE
     :: (Eq a, Num a) => a
pattern AL_FILTER_FIRST_PARAMETER = 0x0000
pattern AL_FILTER_LAST_PARAMETER  = 0x8000
pattern AL_FILTER_TYPE            = 0x8001

pattern AL_FILTER_NULL
      , AL_FILTER_LOWPASS
      , AL_FILTER_HIGHPASS
      , AL_FILTER_BANDPASS
     :: (Eq a, Num a) => a
pattern AL_FILTER_NULL     = 0x0000
pattern AL_FILTER_LOWPASS  = 0x0001
pattern AL_FILTER_HIGHPASS = 0x0002
pattern AL_FILTER_BANDPASS = 0x0003



alFunGenEffects :: ALFun ALGenEffects
alFunGenEffects = ALFun (Ptr "alGenEffects\0"#)

type ALGenEffects =
          ALsizei    -- ^ n
       -> Ptr ALuint -- ^ effects
       -> IO ()

alFunDeleteEffects :: ALFun ALDeleteEffects
alFunDeleteEffects = ALFun (Ptr "alDeleteEffects\0"#)

type ALDeleteEffects =
          ALsizei    -- ^ n
       -> Ptr ALuint -- ^ effects
       -> IO ()

alFunIsEffect :: ALFun ALIsEffect
alFunIsEffect = ALFun (Ptr "alIsEffect\0"#)

type ALIsEffect =
          ALuint       -- ^ eid
       -> IO ALboolean

alFunEffecti :: ALFun ALEffecti
alFunEffecti = ALFun (Ptr "alEffecti\0"#)

type ALEffecti =
          ALuint -- ^ eid
       -> ALenum -- ^ param
       -> ALint  -- ^ value
       -> IO ()

alFunEffectiv :: ALFun ALEffectiv
alFunEffectiv = ALFun (Ptr "alEffectiv\0"#)

type ALEffectiv =
          ALuint    -- ^ eid
       -> ALenum    -- ^ param
       -> Ptr ALint -- ^ values
       -> IO ()

alFunEffectf :: ALFun ALEffectf
alFunEffectf = ALFun (Ptr "alEffectf\0"#)

type ALEffectf =
          ALuint  -- ^ eid
       -> ALenum  -- ^ param
       -> ALfloat -- ^ value
       -> IO ()

alFunEffectfv :: ALFun ALEffectfv
alFunEffectfv = ALFun (Ptr "alEffectfv\0"#)

type ALEffectfv =
          ALuint      -- ^ eid
       -> ALenum      -- ^ param
       -> Ptr ALfloat -- ^ values
       -> IO ()

alFunGetEffecti :: ALFun ALGetEffecti
alFunGetEffecti = ALFun (Ptr "alGetEffecti\0"#)

type ALGetEffecti =
          ALuint    -- ^ eid
       -> ALenum    -- ^ pname
       -> Ptr ALint -- ^ value
       -> IO ()

alFunGetEffectiv :: ALFun ALGetEffectiv
alFunGetEffectiv = ALFun (Ptr "alGetEffectiv\0"#)

type ALGetEffectiv =
          ALuint    -- ^ eid
       -> ALenum    -- ^ pname
       -> Ptr ALint -- ^ values
       -> IO ()

alFunGetEffectf :: ALFun ALGetEffectf
alFunGetEffectf = ALFun (Ptr "alGetEffectf\0"#)

type ALGetEffectf =
          ALuint      -- ^ eid
       -> ALenum      -- ^ pname
       -> Ptr ALfloat -- ^ value
       -> IO ()

alFunGetEffectfv :: ALFun ALGetEffectfv
alFunGetEffectfv = ALFun (Ptr "alGetEffectfv\0"#)

type ALGetEffectfv =
          ALuint      -- ^ eid
       -> ALenum      -- ^ pname
       -> Ptr ALfloat -- ^ values
       -> IO ()



alFunGenFilters :: ALFun ALGenFilters
alFunGenFilters = ALFun (Ptr "alGenFilters\0"#)

type ALGenFilters =
          ALsizei    -- ^ n
       -> Ptr ALuint -- ^ filters
       -> IO ()

alFunDeleteFilters :: ALFun ALDeleteFilters
alFunDeleteFilters = ALFun (Ptr "alDeleteFilters\0"#)

type ALDeleteFilters =
          ALsizei    -- ^ n
       -> Ptr ALuint -- ^ filters
       -> IO ()

alFunIsFilter :: ALFun ALIsFilter
alFunIsFilter = ALFun (Ptr "alIsFilter\0"#)

type ALIsFilter =
          ALuint       -- ^ fid
       -> IO ALboolean

alFunFilteri :: ALFun ALFilteri
alFunFilteri = ALFun (Ptr "alFilteri\0"#)

type ALFilteri =
          ALuint -- ^ fid
       -> ALenum -- ^ param
       -> ALint  -- ^ value
       -> IO ()

alFunFilteriv :: ALFun ALFilteriv
alFunFilteriv = ALFun (Ptr "alFilteriv\0"#)

type ALFilteriv =
          ALuint    -- ^ fid
       -> ALenum    -- ^ param
       -> Ptr ALint -- ^ values
       -> IO ()

alFunFilterf :: ALFun ALFilterf
alFunFilterf = ALFun (Ptr "alFilterf\0"#)

type ALFilterf =
          ALuint  -- ^ fid
       -> ALenum  -- ^ param
       -> ALfloat -- ^ value
       -> IO ()

alFunFilterfv :: ALFun ALFilterfv
alFunFilterfv = ALFun (Ptr "alFilterfv\0"#)

type ALFilterfv =
          ALuint      -- ^ fid
       -> ALenum      -- ^ param
       -> Ptr ALfloat -- ^ values
       -> IO ()

alFunGetFilteri :: ALFun ALGetFilteri
alFunGetFilteri = ALFun (Ptr "alGetFilteri\0"#)

type ALGetFilteri =
          ALuint    -- ^ fid
       -> ALenum    -- ^ pname
       -> Ptr ALint -- ^ value
       -> IO ()

alFunGetFilteriv :: ALFun ALGetFilteriv
alFunGetFilteriv = ALFun (Ptr "alGetFilteriv\0"#)

type ALGetFilteriv =
          ALuint    -- ^ fid
       -> ALenum    -- ^ pname
       -> Ptr ALint -- ^ values
       -> IO ()

alFunGetFilterf :: ALFun ALGetFilterf
alFunGetFilterf = ALFun (Ptr "alGetFilterf\0"#)

type ALGetFilterf =
          ALuint      -- ^ fid
       -> ALenum      -- ^ pname
       -> Ptr ALfloat -- ^ value
       -> IO ()

alFunGetFilterfv :: ALFun ALGetFilterfv
alFunGetFilterfv = ALFun (Ptr "alGetFilterfv\0"#)

type ALGetFilterfv =
          ALuint  -- ^ fid
       -> ALenum  -- ^ pname
       -> ALfloat -- ^ values
       -> IO ()



alFunGenAuxiliaryEffectSlots :: ALFun ALGenAuxiliaryEffectSlots
alFunGenAuxiliaryEffectSlots = ALFun (Ptr "alGenAuxiliaryEffectSlots\0"#)

type ALGenAuxiliaryEffectSlots =
          ALsizei    -- ^ n
       -> Ptr ALuint -- ^ slots
       -> IO ()

alFunDeleteAuxiliaryEffectSlots :: ALFun ALDeleteAuxiliaryEffectSlots
alFunDeleteAuxiliaryEffectSlots = ALFun (Ptr "alDeleteAuxiliaryEffectSlots\0"#)

type ALDeleteAuxiliaryEffectSlots =
          ALsizei    -- ^ n
       -> Ptr ALuint -- ^ slots
       -> IO ()

alFunIsAuxiliaryEffectSlot :: ALFun ALIsAuxiliaryEffectSlot
alFunIsAuxiliaryEffectSlot = ALFun (Ptr "alIsAuxiliaryEffectSlot\0"#)

type ALIsAuxiliaryEffectSlot =
          ALuint       -- ^ slot
       -> IO ALboolean

alFunAuxiliaryEffectSloti :: ALFun ALAuxiliaryEffectSloti
alFunAuxiliaryEffectSloti = ALFun (Ptr "alAuxiliaryEffectSloti\0"#)

type ALAuxiliaryEffectSloti =
          ALuint -- ^ asid
       -> ALenum -- ^ param
       -> ALint  -- ^ value
       -> IO ()

alFunAuxiliaryEffectSlotiv :: ALFun ALAuxiliaryEffectSlotiv
alFunAuxiliaryEffectSlotiv = ALFun (Ptr "alAuxiliaryEffectSlotiv\0"#)

type ALAuxiliaryEffectSlotiv =
          ALuint    -- ^ asid
       -> ALenum    -- ^ param
       -> Ptr ALint -- ^ values
       -> IO ()

alFunAuxiliaryEffectSlotf :: ALFun ALAuxiliaryEffectSlotf
alFunAuxiliaryEffectSlotf = ALFun (Ptr "alAuxiliaryEffectSlotf\0"#)

type ALAuxiliaryEffectSlotf =
          ALuint  -- ^ asid
       -> ALenum  -- ^ param
       -> ALfloat -- ^ value
       -> IO ()

alFunAuxiliaryEffectSlotfv :: ALFun ALAuxiliaryEffectSlotfv
alFunAuxiliaryEffectSlotfv = ALFun (Ptr "alAuxiliaryEffectSlotfv\0"#)

type ALAuxiliaryEffectSlotfv =
          ALuint      -- ^ asid
       -> ALenum      -- ^ param
       -> Ptr ALfloat -- ^ values
       -> IO ()

alFunGetAuxiliaryEffectSloti :: ALFun ALGetAuxiliaryEffectSloti
alFunGetAuxiliaryEffectSloti = ALFun (Ptr "alGetAuxiliaryEffectSloti\0"#)

type ALGetAuxiliaryEffectSloti =
          ALuint    -- ^ asid
       -> ALenum    -- ^ pname
       -> Ptr ALint -- ^ value
       -> IO ()

alFunGetAuxiliaryEffectSlotiv :: ALFun ALGetAuxiliaryEffectSlotiv
alFunGetAuxiliaryEffectSlotiv = ALFun (Ptr "alGetAuxiliaryEffectSlotiv\0"#)

type ALGetAuxiliaryEffectSlotiv =
          ALuint    -- ^ asid
       -> ALenum    -- ^ pname
       -> Ptr ALint -- ^ values
       -> IO ()

alFunGetAuxiliaryEffectSlotf :: ALFun ALGetAuxiliaryEffectSlotf
alFunGetAuxiliaryEffectSlotf = ALFun (Ptr "alGetAuxiliaryEffectSlotf\0"#)

type ALGetAuxiliaryEffectSlotf =
          ALuint      -- ^ asid
       -> ALenum      -- ^ pname
       -> Ptr ALfloat -- ^ value
       -> IO ()

alFunGetAuxiliaryEffectSlotfv :: ALFun ALGetAuxiliaryEffectSlotfv
alFunGetAuxiliaryEffectSlotfv = ALFun (Ptr "alGetAuxiliaryEffectSlotfv\0"#)

type ALGetAuxiliaryEffectSlotfv =
          ALuint      -- ^ asid
       -> ALenum      -- ^ pname
       -> Ptr ALfloat -- ^ values
       -> IO ()



pattern LOWPASS_MIN_GAIN
      , LOWPASS_MAX_GAIN
      , LOWPASS_DEFAULT_GAIN
     :: (Eq a, Fractional a) => a
pattern LOWPASS_MIN_GAIN     = 0.0
pattern LOWPASS_MAX_GAIN     = 1.0
pattern LOWPASS_DEFAULT_GAIN = 1.0

pattern LOWPASS_MIN_GAINHF
      , LOWPASS_MAX_GAINHF
      , LOWPASS_DEFAULT_GAINHF
     :: (Eq a, Fractional a) => a
pattern LOWPASS_MIN_GAINHF     = 0.0
pattern LOWPASS_MAX_GAINHF     = 1.0
pattern LOWPASS_DEFAULT_GAINHF = 1.0



pattern HIGHPASS_MIN_GAIN
      , HIGHPASS_MAX_GAIN
      , HIGHPASS_DEFAULT_GAIN
     :: (Eq a, Fractional a) => a
pattern HIGHPASS_MIN_GAIN     = 0.0
pattern HIGHPASS_MAX_GAIN     = 1.0
pattern HIGHPASS_DEFAULT_GAIN = 1.0

pattern HIGHPASS_MIN_GAINLF
      , HIGHPASS_MAX_GAINLF
      , HIGHPASS_DEFAULT_GAINLF
     :: (Eq a, Fractional a) => a
pattern HIGHPASS_MIN_GAINLF     = 0.0
pattern HIGHPASS_MAX_GAINLF     = 1.0
pattern HIGHPASS_DEFAULT_GAINLF = 1.0



pattern BANDPASS_MIN_GAIN
      , BANDPASS_MAX_GAIN
      , BANDPASS_DEFAULT_GAIN
     :: (Eq a, Fractional a) => a
pattern BANDPASS_MIN_GAIN     = 0.0
pattern BANDPASS_MAX_GAIN     = 1.0
pattern BANDPASS_DEFAULT_GAIN = 1.0

pattern BANDPASS_MIN_GAINHF
      , BANDPASS_MAX_GAINHF
      , BANDPASS_DEFAULT_GAINHF
     :: (Eq a, Fractional a) => a
pattern BANDPASS_MIN_GAINHF     = 0.0
pattern BANDPASS_MAX_GAINHF     = 1.0
pattern BANDPASS_DEFAULT_GAINHF = 1.0

pattern BANDPASS_MIN_GAINLF
      , BANDPASS_MAX_GAINLF
      , BANDPASS_DEFAULT_GAINLF
     :: (Eq a, Fractional a) => a
pattern BANDPASS_MIN_GAINLF     = 0.0
pattern BANDPASS_MAX_GAINLF     = 1.0
pattern BANDPASS_DEFAULT_GAINLF = 1.0



pattern AL_REVERB_MIN_DENSITY
      , AL_REVERB_MAX_DENSITY
      , AL_REVERB_DEFAULT_DENSITY
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_DENSITY     = 0.0
pattern AL_REVERB_MAX_DENSITY     = 1.0
pattern AL_REVERB_DEFAULT_DENSITY = 1.0

pattern AL_REVERB_MIN_DIFFUSION
      , AL_REVERB_MAX_DIFFUSION
      , AL_REVERB_DEFAULT_DIFFUSION
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_DIFFUSION     = 0.0
pattern AL_REVERB_MAX_DIFFUSION     = 1.0
pattern AL_REVERB_DEFAULT_DIFFUSION = 1.0

pattern AL_REVERB_MIN_GAIN
      , AL_REVERB_MAX_GAIN
      , AL_REVERB_DEFAULT_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_GAIN     = 0.0
pattern AL_REVERB_MAX_GAIN     = 1.0
pattern AL_REVERB_DEFAULT_GAIN = 0.32

pattern AL_REVERB_MIN_GAINHF
      , AL_REVERB_MAX_GAINHF
      , AL_REVERB_DEFAULT_GAINHF
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_GAINHF     = 0.0
pattern AL_REVERB_MAX_GAINHF     = 1.0
pattern AL_REVERB_DEFAULT_GAINHF = 0.89

pattern AL_REVERB_MIN_DECAY_TIME
      , AL_REVERB_MAX_DECAY_TIME
      , AL_REVERB_DEFAULT_DECAY_TIME
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_DECAY_TIME     = 0.1
pattern AL_REVERB_MAX_DECAY_TIME     = 20.0
pattern AL_REVERB_DEFAULT_DECAY_TIME = 1.49

pattern AL_REVERB_MIN_DECAY_HFRATIO
      , AL_REVERB_MAX_DECAY_HFRATIO
      , AL_REVERB_DEFAULT_DECAY_HFRATIO
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_DECAY_HFRATIO     = 0.1
pattern AL_REVERB_MAX_DECAY_HFRATIO     = 2.0
pattern AL_REVERB_DEFAULT_DECAY_HFRATIO = 0.83

pattern AL_REVERB_MIN_REFLECTIONS_GAIN
      , AL_REVERB_MAX_REFLECTIONS_GAIN
      , AL_REVERB_DEFAULT_REFLECTIONS_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_REFLECTIONS_GAIN     = 0.0
pattern AL_REVERB_MAX_REFLECTIONS_GAIN     = 3.16
pattern AL_REVERB_DEFAULT_REFLECTIONS_GAIN = 0.05

pattern AL_REVERB_MIN_REFLECTIONS_DELAY
      , AL_REVERB_MAX_REFLECTIONS_DELAY
      , AL_REVERB_DEFAULT_REFLECTIONS_DELAY
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_REFLECTIONS_DELAY     = 0.0
pattern AL_REVERB_MAX_REFLECTIONS_DELAY     = 0.3
pattern AL_REVERB_DEFAULT_REFLECTIONS_DELAY = 0.007

pattern AL_REVERB_MIN_LATE_REVERB_GAIN
      , AL_REVERB_MAX_LATE_REVERB_GAIN
      , AL_REVERB_DEFAULT_LATE_REVERB_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_LATE_REVERB_GAIN     = 0.0
pattern AL_REVERB_MAX_LATE_REVERB_GAIN     = 10.0
pattern AL_REVERB_DEFAULT_LATE_REVERB_GAIN = 1.26

pattern AL_REVERB_MIN_LATE_REVERB_DELAY
      , AL_REVERB_MAX_LATE_REVERB_DELAY
      , AL_REVERB_DEFAULT_LATE_REVERB_DELAY
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_LATE_REVERB_DELAY     = 0.0
pattern AL_REVERB_MAX_LATE_REVERB_DELAY     = 0.1
pattern AL_REVERB_DEFAULT_LATE_REVERB_DELAY = 0.011

pattern AL_REVERB_MIN_AIR_ABSORPTION_GAINHF
      , AL_REVERB_MAX_AIR_ABSORPTION_GAINHF
      , AL_REVERB_DEFAULT_AIR_ABSORPTION_GAINHF
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_AIR_ABSORPTION_GAINHF     = 0.892
pattern AL_REVERB_MAX_AIR_ABSORPTION_GAINHF     = 1.0
pattern AL_REVERB_DEFAULT_AIR_ABSORPTION_GAINHF = 0.994

pattern AL_REVERB_MIN_ROOM_ROLLOFF_FACTOR
      , AL_REVERB_MAX_ROOM_ROLLOFF_FACTOR
      , AL_REVERB_DEFAULT_ROOM_ROLLOFF_FACTOR
     :: (Eq a, Fractional a) => a
pattern AL_REVERB_MIN_ROOM_ROLLOFF_FACTOR     = 0.0
pattern AL_REVERB_MAX_ROOM_ROLLOFF_FACTOR     = 10.0
pattern AL_REVERB_DEFAULT_ROOM_ROLLOFF_FACTOR = 0.0

pattern AL_REVERB_MIN_DECAY_HFLIMIT
      , AL_REVERB_MAX_DECAY_HFLIMIT
      , AL_REVERB_DEFAULT_DECAY_HFLIMIT
     :: (Eq a, Num a) => a
pattern AL_REVERB_MIN_DECAY_HFLIMIT     = AL_FALSE
pattern AL_REVERB_MAX_DECAY_HFLIMIT     = AL_TRUE
pattern AL_REVERB_DEFAULT_DECAY_HFLIMIT = AL_TRUE



pattern AL_EAXREVERB_MIN_DENSITY
      , AL_EAXREVERB_MAX_DENSITY
      , AL_EAXREVERB_DEFAULT_DENSITY
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_DENSITY     = 0.0
pattern AL_EAXREVERB_MAX_DENSITY     = 1.0
pattern AL_EAXREVERB_DEFAULT_DENSITY = 1.0

pattern AL_EAXREVERB_MIN_DIFFUSION
      , AL_EAXREVERB_MAX_DIFFUSION
      , AL_EAXREVERB_DEFAULT_DIFFUSION
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_DIFFUSION     = 0.0
pattern AL_EAXREVERB_MAX_DIFFUSION     = 1.0
pattern AL_EAXREVERB_DEFAULT_DIFFUSION = 1.0

pattern AL_EAXREVERB_MIN_GAIN
      , AL_EAXREVERB_MAX_GAIN
      , AL_EAXREVERB_DEFAULT_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_GAIN     = 0.0
pattern AL_EAXREVERB_MAX_GAIN     = 1.0
pattern AL_EAXREVERB_DEFAULT_GAIN = 0.32

pattern AL_EAXREVERB_MIN_GAINHF
      , AL_EAXREVERB_MAX_GAINHF
      , AL_EAXREVERB_DEFAULT_GAINHF
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_GAINHF     = 0.0
pattern AL_EAXREVERB_MAX_GAINHF     = 1.0
pattern AL_EAXREVERB_DEFAULT_GAINHF = 0.89

pattern AL_EAXREVERB_MIN_GAINLF
      , AL_EAXREVERB_MAX_GAINLF
      , AL_EAXREVERB_DEFAULT_GAINLF
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_GAINLF     = 0.0
pattern AL_EAXREVERB_MAX_GAINLF     = 1.0
pattern AL_EAXREVERB_DEFAULT_GAINLF = 1.0

pattern AL_EAXREVERB_MIN_DECAY_TIME
      , AL_EAXREVERB_MAX_DECAY_TIME
      , AL_EAXREVERB_DEFAULT_DECAY_TIME
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_DECAY_TIME     = 0.1
pattern AL_EAXREVERB_MAX_DECAY_TIME     = 20.0
pattern AL_EAXREVERB_DEFAULT_DECAY_TIME = 1.49

pattern AL_EAXREVERB_MIN_DECAY_HFRATIO
      , AL_EAXREVERB_MAX_DECAY_HFRATIO
      , AL_EAXREVERB_DEFAULT_DECAY_HFRATIO
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_DECAY_HFRATIO     = 0.1
pattern AL_EAXREVERB_MAX_DECAY_HFRATIO     = 2.0
pattern AL_EAXREVERB_DEFAULT_DECAY_HFRATIO = 0.83

pattern AL_EAXREVERB_MIN_DECAY_LFRATIO
      , AL_EAXREVERB_MAX_DECAY_LFRATIO
      , AL_EAXREVERB_DEFAULT_DECAY_LFRATIO
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_DECAY_LFRATIO     = 0.1
pattern AL_EAXREVERB_MAX_DECAY_LFRATIO     = 2.0
pattern AL_EAXREVERB_DEFAULT_DECAY_LFRATIO = 1.0

pattern AL_EAXREVERB_MIN_REFLECTIONS_GAIN
      , AL_EAXREVERB_MAX_REFLECTIONS_GAIN
      , AL_EAXREVERB_DEFAULT_REFLECTIONS_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_REFLECTIONS_GAIN     = 0.0
pattern AL_EAXREVERB_MAX_REFLECTIONS_GAIN     = 3.16
pattern AL_EAXREVERB_DEFAULT_REFLECTIONS_GAIN = 0.05

pattern AL_EAXREVERB_MIN_REFLECTIONS_DELAY
      , AL_EAXREVERB_MAX_REFLECTIONS_DELAY
      , AL_EAXREVERB_DEFAULT_REFLECTIONS_DELAY
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_REFLECTIONS_DELAY     = 0.0
pattern AL_EAXREVERB_MAX_REFLECTIONS_DELAY     = 0.3
pattern AL_EAXREVERB_DEFAULT_REFLECTIONS_DELAY = 0.007

pattern AL_EAXREVERB_DEFAULT_REFLECTIONS_PAN_XYZ :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_DEFAULT_REFLECTIONS_PAN_XYZ = 0.0

pattern AL_EAXREVERB_MIN_LATE_REVERB_GAIN
      , AL_EAXREVERB_MAX_LATE_REVERB_GAIN
      , AL_EAXREVERB_DEFAULT_LATE_REVERB_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_LATE_REVERB_GAIN     = 0.0
pattern AL_EAXREVERB_MAX_LATE_REVERB_GAIN     = 10.0
pattern AL_EAXREVERB_DEFAULT_LATE_REVERB_GAIN = 1.26

pattern AL_EAXREVERB_MIN_LATE_REVERB_DELAY
      , AL_EAXREVERB_MAX_LATE_REVERB_DELAY
      , AL_EAXREVERB_DEFAULT_LATE_REVERB_DELAY
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_LATE_REVERB_DELAY     = 0.0
pattern AL_EAXREVERB_MAX_LATE_REVERB_DELAY     = 0.1
pattern AL_EAXREVERB_DEFAULT_LATE_REVERB_DELAY = 0.011

pattern AL_EAXREVERB_DEFAULT_LATE_REVERB_PAN_XYZ :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_DEFAULT_LATE_REVERB_PAN_XYZ = 0.0

pattern AL_EAXREVERB_MIN_ECHO_TIME
      , AL_EAXREVERB_MAX_ECHO_TIME
      , AL_EAXREVERB_DEFAULT_ECHO_TIME
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_ECHO_TIME     = 0.075
pattern AL_EAXREVERB_MAX_ECHO_TIME     = 0.25
pattern AL_EAXREVERB_DEFAULT_ECHO_TIME = 0.25

pattern AL_EAXREVERB_MIN_ECHO_DEPTH
      , AL_EAXREVERB_MAX_ECHO_DEPTH
      , AL_EAXREVERB_DEFAULT_ECHO_DEPTH
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_ECHO_DEPTH     = 0.0
pattern AL_EAXREVERB_MAX_ECHO_DEPTH     = 1.0
pattern AL_EAXREVERB_DEFAULT_ECHO_DEPTH = 0.0

pattern AL_EAXREVERB_MIN_MODULATION_TIME
      , AL_EAXREVERB_MAX_MODULATION_TIME
      , AL_EAXREVERB_DEFAULT_MODULATION_TIME
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_MODULATION_TIME     = 0.04
pattern AL_EAXREVERB_MAX_MODULATION_TIME     = 4.0
pattern AL_EAXREVERB_DEFAULT_MODULATION_TIME = 0.25

pattern AL_EAXREVERB_MIN_MODULATION_DEPTH
      , AL_EAXREVERB_MAX_MODULATION_DEPTH
      , AL_EAXREVERB_DEFAULT_MODULATION_DEPTH
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_MODULATION_DEPTH     = 0.0
pattern AL_EAXREVERB_MAX_MODULATION_DEPTH     = 1.0
pattern AL_EAXREVERB_DEFAULT_MODULATION_DEPTH = 0.0

pattern AL_EAXREVERB_MIN_AIR_ABSORPTION_GAINHF
      , AL_EAXREVERB_MAX_AIR_ABSORPTION_GAINHF
      , AL_EAXREVERB_DEFAULT_AIR_ABSORPTION_GAINHF
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_AIR_ABSORPTION_GAINHF     = 0.892
pattern AL_EAXREVERB_MAX_AIR_ABSORPTION_GAINHF     = 1.0
pattern AL_EAXREVERB_DEFAULT_AIR_ABSORPTION_GAINHF = 0.994

pattern AL_EAXREVERB_MIN_HFREFERENCE
      , AL_EAXREVERB_MAX_HFREFERENCE
      , AL_EAXREVERB_DEFAULT_HFREFERENCE
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_HFREFERENCE     = 1000.0
pattern AL_EAXREVERB_MAX_HFREFERENCE     = 20000.0
pattern AL_EAXREVERB_DEFAULT_HFREFERENCE = 5000.0

pattern AL_EAXREVERB_MIN_LFREFERENCE
      , AL_EAXREVERB_MAX_LFREFERENCE
      , AL_EAXREVERB_DEFAULT_LFREFERENCE
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_LFREFERENCE     = 20.0
pattern AL_EAXREVERB_MAX_LFREFERENCE     = 1000.0
pattern AL_EAXREVERB_DEFAULT_LFREFERENCE = 250.0

pattern AL_EAXREVERB_MIN_ROOM_ROLLOFF_FACTOR
      , AL_EAXREVERB_MAX_ROOM_ROLLOFF_FACTOR
      , AL_EAXREVERB_DEFAULT_ROOM_ROLLOFF_FACTOR
     :: (Eq a, Fractional a) => a
pattern AL_EAXREVERB_MIN_ROOM_ROLLOFF_FACTOR     = 0.0
pattern AL_EAXREVERB_MAX_ROOM_ROLLOFF_FACTOR     = 10.0
pattern AL_EAXREVERB_DEFAULT_ROOM_ROLLOFF_FACTOR = 0.0

pattern AL_EAXREVERB_MIN_DECAY_HFLIMIT
      , AL_EAXREVERB_MAX_DECAY_HFLIMIT
      , AL_EAXREVERB_DEFAULT_DECAY_HFLIMIT
     :: (Eq a, Num a) => a
pattern AL_EAXREVERB_MIN_DECAY_HFLIMIT     = AL_FALSE
pattern AL_EAXREVERB_MAX_DECAY_HFLIMIT     = AL_TRUE
pattern AL_EAXREVERB_DEFAULT_DECAY_HFLIMIT = AL_TRUE



pattern AL_CHORUS_MIN_WAVEFORM
      , AL_CHORUS_MAX_WAVEFORM
      , AL_CHORUS_DEFAULT_WAVEFORM
     :: (Eq a, Num a) => a
pattern AL_CHORUS_MIN_WAVEFORM     = 0
pattern AL_CHORUS_MAX_WAVEFORM     = 1
pattern AL_CHORUS_DEFAULT_WAVEFORM = 1

pattern AL_CHORUS_WAVEFORM_SINUSOID
      , AL_CHORUS_WAVEFORM_TRIANGLE
     :: (Eq a, Num a) => a
pattern AL_CHORUS_WAVEFORM_SINUSOID = 0
pattern AL_CHORUS_WAVEFORM_TRIANGLE = 1

pattern AL_CHORUS_MIN_PHASE
      , AL_CHORUS_MAX_PHASE
      , AL_CHORUS_DEFAULT_PHASE
     :: (Eq a, Num a) => a
pattern AL_CHORUS_MIN_PHASE     = (-180)
pattern AL_CHORUS_MAX_PHASE     = 180
pattern AL_CHORUS_DEFAULT_PHASE = 90

pattern AL_CHORUS_MIN_RATE
      , AL_CHORUS_MAX_RATE
      , AL_CHORUS_DEFAULT_RATE
     :: (Eq a, Fractional a) => a
pattern AL_CHORUS_MIN_RATE = 0.0
pattern AL_CHORUS_MAX_RATE = 10.0
pattern AL_CHORUS_DEFAULT_RATE = 1.1

pattern AL_CHORUS_MIN_DEPTH
      , AL_CHORUS_MAX_DEPTH
      , AL_CHORUS_DEFAULT_DEPTH
     :: (Eq a, Fractional a) => a
pattern AL_CHORUS_MIN_DEPTH = 0.0
pattern AL_CHORUS_MAX_DEPTH = 1.0
pattern AL_CHORUS_DEFAULT_DEPTH = 0.1

pattern AL_CHORUS_MIN_FEEDBACK
      , AL_CHORUS_MAX_FEEDBACK
      , AL_CHORUS_DEFAULT_FEEDBACK
     :: (Eq a, Fractional a) => a
pattern AL_CHORUS_MIN_FEEDBACK     = -1.0
pattern AL_CHORUS_MAX_FEEDBACK     = 1.0
pattern AL_CHORUS_DEFAULT_FEEDBACK = 0.25

pattern AL_CHORUS_MIN_DELAY
      , AL_CHORUS_MAX_DELAY
      , AL_CHORUS_DEFAULT_DELAY
     :: (Eq a, Fractional a) => a
pattern AL_CHORUS_MIN_DELAY     = 0.0
pattern AL_CHORUS_MAX_DELAY     = 0.016
pattern AL_CHORUS_DEFAULT_DELAY = 0.016



pattern AL_DISTORTION_MIN_EDGE
      , AL_DISTORTION_MAX_EDGE
      , AL_DISTORTION_DEFAULT_EDGE
     :: (Eq a, Fractional a) => a
pattern AL_DISTORTION_MIN_EDGE     = 0.0
pattern AL_DISTORTION_MAX_EDGE     = 1.0
pattern AL_DISTORTION_DEFAULT_EDGE = 0.2

pattern AL_DISTORTION_MIN_GAIN
      , AL_DISTORTION_MAX_GAIN
      , AL_DISTORTION_DEFAULT_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_DISTORTION_MIN_GAIN     = 0.01
pattern AL_DISTORTION_MAX_GAIN     = 1.0
pattern AL_DISTORTION_DEFAULT_GAIN = 0.05

pattern AL_DISTORTION_MIN_LOWPASS_CUTOFF
      , AL_DISTORTION_MAX_LOWPASS_CUTOFF
      , AL_DISTORTION_DEFAULT_LOWPASS_CUTOFF
     :: (Eq a, Fractional a) => a
pattern AL_DISTORTION_MIN_LOWPASS_CUTOFF     = 80.0
pattern AL_DISTORTION_MAX_LOWPASS_CUTOFF     = 24000.0
pattern AL_DISTORTION_DEFAULT_LOWPASS_CUTOFF = 8000.0

pattern AL_DISTORTION_MIN_EQCENTER
      , AL_DISTORTION_MAX_EQCENTER
      , AL_DISTORTION_DEFAULT_EQCENTER
     :: (Eq a, Fractional a) => a
pattern AL_DISTORTION_MIN_EQCENTER     = 80.0
pattern AL_DISTORTION_MAX_EQCENTER     = 24000.0
pattern AL_DISTORTION_DEFAULT_EQCENTER = 3600.0

pattern AL_DISTORTION_MIN_EQBANDWIDTH
      , AL_DISTORTION_MAX_EQBANDWIDTH
      , AL_DISTORTION_DEFAULT_EQBANDWIDTH
     :: (Eq a, Fractional a) => a
pattern AL_DISTORTION_MIN_EQBANDWIDTH     = 80.0
pattern AL_DISTORTION_MAX_EQBANDWIDTH     = 24000.0
pattern AL_DISTORTION_DEFAULT_EQBANDWIDTH = 3600.0



pattern AL_ECHO_MIN_DELAY
      , AL_ECHO_MAX_DELAY
      , AL_ECHO_DEFAULT_DELAY
     :: (Eq a, Fractional a) => a
pattern AL_ECHO_MIN_DELAY     = 0.0
pattern AL_ECHO_MAX_DELAY     = 0.207
pattern AL_ECHO_DEFAULT_DELAY = 0.1

pattern AL_ECHO_MIN_LRDELAY
      , AL_ECHO_MAX_LRDELAY
      , AL_ECHO_DEFAULT_LRDELAY
     :: (Eq a, Fractional a) => a
pattern AL_ECHO_MIN_LRDELAY     = 0.0
pattern AL_ECHO_MAX_LRDELAY     = 0.404
pattern AL_ECHO_DEFAULT_LRDELAY = 0.1

pattern AL_ECHO_MIN_DAMPING
      , AL_ECHO_MAX_DAMPING
      , AL_ECHO_DEFAULT_DAMPING
     :: (Eq a, Fractional a) => a
pattern AL_ECHO_MIN_DAMPING     = 0.0
pattern AL_ECHO_MAX_DAMPING     = 0.99
pattern AL_ECHO_DEFAULT_DAMPING = 0.5

pattern AL_ECHO_MIN_FEEDBACK
      , AL_ECHO_MAX_FEEDBACK
      , AL_ECHO_DEFAULT_FEEDBACK
     :: (Eq a, Fractional a) => a
pattern AL_ECHO_MIN_FEEDBACK     = 0.0
pattern AL_ECHO_MAX_FEEDBACK     = 1.0
pattern AL_ECHO_DEFAULT_FEEDBACK = 0.5

pattern AL_ECHO_MIN_SPREAD
      , AL_ECHO_MAX_SPREAD
      , AL_ECHO_DEFAULT_SPREAD
     :: (Eq a, Fractional a) => a
pattern AL_ECHO_MIN_SPREAD     = -1.0
pattern AL_ECHO_MAX_SPREAD     = 1.0
pattern AL_ECHO_DEFAULT_SPREAD = -1.0

pattern AL_FLANGER_MIN_WAVEFORM
      , AL_FLANGER_MAX_WAVEFORM
      , AL_FLANGER_DEFAULT_WAVEFORM
     :: (Eq a, Num a) => a
pattern AL_FLANGER_MIN_WAVEFORM     = 0
pattern AL_FLANGER_MAX_WAVEFORM     = 1
pattern AL_FLANGER_DEFAULT_WAVEFORM = 1

pattern AL_FLANGER_WAVEFORM_SINUSOID
      , AL_FLANGER_WAVEFORM_TRIANGLE
     :: (Eq a, Num a) => a
pattern AL_FLANGER_WAVEFORM_SINUSOID = 0
pattern AL_FLANGER_WAVEFORM_TRIANGLE = 1

pattern AL_FLANGER_MIN_PHASE
      , AL_FLANGER_MAX_PHASE
      , AL_FLANGER_DEFAULT_PHASE
     :: (Eq a, Num a) => a
pattern AL_FLANGER_MIN_PHASE     = -180
pattern AL_FLANGER_MAX_PHASE     = 180
pattern AL_FLANGER_DEFAULT_PHASE = 0

pattern AL_FLANGER_MIN_RATE
      , AL_FLANGER_MAX_RATE
      , AL_FLANGER_DEFAULT_RATE
     :: (Eq a, Fractional a) => a
pattern AL_FLANGER_MIN_RATE = 0.0
pattern AL_FLANGER_MAX_RATE = 10.0
pattern AL_FLANGER_DEFAULT_RATE = 0.27

pattern AL_FLANGER_MIN_DEPTH
      , AL_FLANGER_MAX_DEPTH
      , AL_FLANGER_DEFAULT_DEPTH
     :: (Eq a, Fractional a) => a
pattern AL_FLANGER_MIN_DEPTH     = 0.0
pattern AL_FLANGER_MAX_DEPTH     = 1.0
pattern AL_FLANGER_DEFAULT_DEPTH = 1.0

pattern AL_FLANGER_MIN_FEEDBACK
      , AL_FLANGER_MAX_FEEDBACK
      , AL_FLANGER_DEFAULT_FEEDBACK
     :: (Eq a, Fractional a) => a
pattern AL_FLANGER_MIN_FEEDBACK     = -1.0
pattern AL_FLANGER_MAX_FEEDBACK     = 1.0
pattern AL_FLANGER_DEFAULT_FEEDBACK = -0.5

pattern AL_FLANGER_MIN_DELAY
      , AL_FLANGER_MAX_DELAY
      , AL_FLANGER_DEFAULT_DELAY
     :: (Eq a, Fractional a) => a
pattern AL_FLANGER_MIN_DELAY     = 0.0
pattern AL_FLANGER_MAX_DELAY     = 0.004
pattern AL_FLANGER_DEFAULT_DELAY = 0.002



pattern AL_FREQUENCY_SHIFTER_MIN_FREQUENCY
      , AL_FREQUENCY_SHIFTER_MAX_FREQUENCY
      , AL_FREQUENCY_SHIFTER_DEFAULT_FREQUENCY
     :: (Eq a, Fractional a) => a
pattern AL_FREQUENCY_SHIFTER_MIN_FREQUENCY     = 0.0
pattern AL_FREQUENCY_SHIFTER_MAX_FREQUENCY     = 24000.0
pattern AL_FREQUENCY_SHIFTER_DEFAULT_FREQUENCY = 0.0

pattern AL_FREQUENCY_SHIFTER_MIN_LEFT_DIRECTION
      , AL_FREQUENCY_SHIFTER_MAX_LEFT_DIRECTION
      , AL_FREQUENCY_SHIFTER_DEFAULT_LEFT_DIRECTION
     :: (Eq a, Num a) => a
pattern AL_FREQUENCY_SHIFTER_MIN_LEFT_DIRECTION     = 0
pattern AL_FREQUENCY_SHIFTER_MAX_LEFT_DIRECTION     = 2
pattern AL_FREQUENCY_SHIFTER_DEFAULT_LEFT_DIRECTION = 0

pattern AL_FREQUENCY_SHIFTER_MIN_RIGHT_DIRECTION
      , AL_FREQUENCY_SHIFTER_MAX_RIGHT_DIRECTION
      , AL_FREQUENCY_SHIFTER_DEFAULT_RIGHT_DIRECTION
     :: (Eq a, Num a) => a
pattern AL_FREQUENCY_SHIFTER_MIN_RIGHT_DIRECTION     = 0
pattern AL_FREQUENCY_SHIFTER_MAX_RIGHT_DIRECTION     = 2
pattern AL_FREQUENCY_SHIFTER_DEFAULT_RIGHT_DIRECTION = 0

pattern AL_FREQUENCY_SHIFTER_DIRECTION_DOWN
      , AL_FREQUENCY_SHIFTER_DIRECTION_UP
      , AL_FREQUENCY_SHIFTER_DIRECTION_OFF
     :: (Eq a, Num a) => a
pattern AL_FREQUENCY_SHIFTER_DIRECTION_DOWN = 0
pattern AL_FREQUENCY_SHIFTER_DIRECTION_UP   = 1
pattern AL_FREQUENCY_SHIFTER_DIRECTION_OFF  = 2



pattern AL_VOCAL_MORPHER_MIN_PHONEMEA
      , AL_VOCAL_MORPHER_MAX_PHONEMEA
      , AL_VOCAL_MORPHER_DEFAULT_PHONEMEA
     :: (Eq a, Num a) => a
pattern AL_VOCAL_MORPHER_MIN_PHONEMEA     = 0
pattern AL_VOCAL_MORPHER_MAX_PHONEMEA     = 29
pattern AL_VOCAL_MORPHER_DEFAULT_PHONEMEA = 0

pattern AL_VOCAL_MORPHER_MIN_PHONEMEA_COARSE_TUNING
      , AL_VOCAL_MORPHER_MAX_PHONEMEA_COARSE_TUNING
      , AL_VOCAL_MORPHER_DEFAULT_PHONEMEA_COARSE_TUNING
     :: (Eq a, Num a) => a
pattern AL_VOCAL_MORPHER_MIN_PHONEMEA_COARSE_TUNING     = -24
pattern AL_VOCAL_MORPHER_MAX_PHONEMEA_COARSE_TUNING     = 24
pattern AL_VOCAL_MORPHER_DEFAULT_PHONEMEA_COARSE_TUNING = 0

pattern AL_VOCAL_MORPHER_MIN_PHONEMEB
      , AL_VOCAL_MORPHER_MAX_PHONEMEB
      , AL_VOCAL_MORPHER_DEFAULT_PHONEMEB
     :: (Eq a, Num a) => a
pattern AL_VOCAL_MORPHER_MIN_PHONEMEB     = 0
pattern AL_VOCAL_MORPHER_MAX_PHONEMEB     = 29
pattern AL_VOCAL_MORPHER_DEFAULT_PHONEMEB = 10

pattern AL_VOCAL_MORPHER_PHONEME_A
      , AL_VOCAL_MORPHER_PHONEME_E
      , AL_VOCAL_MORPHER_PHONEME_I
      , AL_VOCAL_MORPHER_PHONEME_O
      , AL_VOCAL_MORPHER_PHONEME_U
      , AL_VOCAL_MORPHER_PHONEME_AA
      , AL_VOCAL_MORPHER_PHONEME_AE
      , AL_VOCAL_MORPHER_PHONEME_AH
      , AL_VOCAL_MORPHER_PHONEME_AO
      , AL_VOCAL_MORPHER_PHONEME_EH
      , AL_VOCAL_MORPHER_PHONEME_ER
      , AL_VOCAL_MORPHER_PHONEME_IH
      , AL_VOCAL_MORPHER_PHONEME_IY
      , AL_VOCAL_MORPHER_PHONEME_UH
      , AL_VOCAL_MORPHER_PHONEME_UW
      , AL_VOCAL_MORPHER_PHONEME_B
      , AL_VOCAL_MORPHER_PHONEME_D
      , AL_VOCAL_MORPHER_PHONEME_F
      , AL_VOCAL_MORPHER_PHONEME_G
      , AL_VOCAL_MORPHER_PHONEME_J
      , AL_VOCAL_MORPHER_PHONEME_K
      , AL_VOCAL_MORPHER_PHONEME_L
      , AL_VOCAL_MORPHER_PHONEME_M
      , AL_VOCAL_MORPHER_PHONEME_N
      , AL_VOCAL_MORPHER_PHONEME_P
      , AL_VOCAL_MORPHER_PHONEME_R
      , AL_VOCAL_MORPHER_PHONEME_S
      , AL_VOCAL_MORPHER_PHONEME_T
      , AL_VOCAL_MORPHER_PHONEME_V
      , AL_VOCAL_MORPHER_PHONEME_Z
     :: (Eq a, Num a) => a
pattern AL_VOCAL_MORPHER_PHONEME_A  = 0
pattern AL_VOCAL_MORPHER_PHONEME_E  = 1
pattern AL_VOCAL_MORPHER_PHONEME_I  = 2
pattern AL_VOCAL_MORPHER_PHONEME_O  = 3
pattern AL_VOCAL_MORPHER_PHONEME_U  = 4
pattern AL_VOCAL_MORPHER_PHONEME_AA = 5
pattern AL_VOCAL_MORPHER_PHONEME_AE = 6
pattern AL_VOCAL_MORPHER_PHONEME_AH = 7
pattern AL_VOCAL_MORPHER_PHONEME_AO = 8
pattern AL_VOCAL_MORPHER_PHONEME_EH = 9
pattern AL_VOCAL_MORPHER_PHONEME_ER = 10
pattern AL_VOCAL_MORPHER_PHONEME_IH = 11
pattern AL_VOCAL_MORPHER_PHONEME_IY = 12
pattern AL_VOCAL_MORPHER_PHONEME_UH = 13
pattern AL_VOCAL_MORPHER_PHONEME_UW = 14
pattern AL_VOCAL_MORPHER_PHONEME_B  = 15
pattern AL_VOCAL_MORPHER_PHONEME_D  = 16
pattern AL_VOCAL_MORPHER_PHONEME_F  = 17
pattern AL_VOCAL_MORPHER_PHONEME_G  = 18
pattern AL_VOCAL_MORPHER_PHONEME_J  = 19
pattern AL_VOCAL_MORPHER_PHONEME_K  = 20
pattern AL_VOCAL_MORPHER_PHONEME_L  = 21
pattern AL_VOCAL_MORPHER_PHONEME_M  = 22
pattern AL_VOCAL_MORPHER_PHONEME_N  = 23
pattern AL_VOCAL_MORPHER_PHONEME_P  = 24
pattern AL_VOCAL_MORPHER_PHONEME_R  = 25
pattern AL_VOCAL_MORPHER_PHONEME_S  = 26
pattern AL_VOCAL_MORPHER_PHONEME_T  = 27
pattern AL_VOCAL_MORPHER_PHONEME_V  = 28
pattern AL_VOCAL_MORPHER_PHONEME_Z  = 29

pattern AL_VOCAL_MORPHER_MIN_PHONEMEB_COARSE_TUNING
      , AL_VOCAL_MORPHER_MAX_PHONEMEB_COARSE_TUNING
      , AL_VOCAL_MORPHER_DEFAULT_PHONEMEB_COARSE_TUNING
     :: (Eq a, Num a) => a
pattern AL_VOCAL_MORPHER_MIN_PHONEMEB_COARSE_TUNING     = -24
pattern AL_VOCAL_MORPHER_MAX_PHONEMEB_COARSE_TUNING     = 24
pattern AL_VOCAL_MORPHER_DEFAULT_PHONEMEB_COARSE_TUNING = 0

pattern AL_VOCAL_MORPHER_MIN_WAVEFORM
      , AL_VOCAL_MORPHER_MAX_WAVEFORM
      , AL_VOCAL_MORPHER_DEFAULT_WAVEFORM
     :: (Eq a, Num a) => a
pattern AL_VOCAL_MORPHER_MIN_WAVEFORM     = 0
pattern AL_VOCAL_MORPHER_MAX_WAVEFORM     = 2
pattern AL_VOCAL_MORPHER_DEFAULT_WAVEFORM = 0

pattern AL_VOCAL_MORPHER_WAVEFORM_SINUSOID
      , AL_VOCAL_MORPHER_WAVEFORM_TRIANGLE
      , AL_VOCAL_MORPHER_WAVEFORM_SAWTOOTH
     :: (Eq a, Num a) => a
pattern AL_VOCAL_MORPHER_WAVEFORM_SINUSOID = 0
pattern AL_VOCAL_MORPHER_WAVEFORM_TRIANGLE = 1
pattern AL_VOCAL_MORPHER_WAVEFORM_SAWTOOTH = 2

pattern AL_VOCAL_MORPHER_MIN_RATE
      , AL_VOCAL_MORPHER_MAX_RATE
      , AL_VOCAL_MORPHER_DEFAULT_RATE
     :: (Eq a, Fractional a) => a
pattern AL_VOCAL_MORPHER_MIN_RATE     = 0.0
pattern AL_VOCAL_MORPHER_MAX_RATE     = 10.0
pattern AL_VOCAL_MORPHER_DEFAULT_RATE = 1.41



pattern AL_PITCH_SHIFTER_MIN_COARSE_TUNE
      , AL_PITCH_SHIFTER_MAX_COARSE_TUNE
      , AL_PITCH_SHIFTER_DEFAULT_COARSE_TUNE
     :: (Eq a, Num a) => a
pattern AL_PITCH_SHIFTER_MIN_COARSE_TUNE     = -12
pattern AL_PITCH_SHIFTER_MAX_COARSE_TUNE     = 12
pattern AL_PITCH_SHIFTER_DEFAULT_COARSE_TUNE = 12

pattern AL_PITCH_SHIFTER_MIN_FINE_TUNE
      , AL_PITCH_SHIFTER_MAX_FINE_TUNE
      , AL_PITCH_SHIFTER_DEFAULT_FINE_TUNE
     :: (Eq a, Num a) => a
pattern AL_PITCH_SHIFTER_MIN_FINE_TUNE     = -50
pattern AL_PITCH_SHIFTER_MAX_FINE_TUNE     = 50
pattern AL_PITCH_SHIFTER_DEFAULT_FINE_TUNE = 0



pattern AL_RING_MODULATOR_MIN_FREQUENCY
      , AL_RING_MODULATOR_MAX_FREQUENCY
      , AL_RING_MODULATOR_DEFAULT_FREQUENCY
     :: (Eq a, Fractional a) => a
pattern AL_RING_MODULATOR_MIN_FREQUENCY     = 0.0
pattern AL_RING_MODULATOR_MAX_FREQUENCY     = 8000.0
pattern AL_RING_MODULATOR_DEFAULT_FREQUENCY = 440.0

pattern AL_RING_MODULATOR_MIN_HIGHPASS_CUTOFF
      , AL_RING_MODULATOR_MAX_HIGHPASS_CUTOFF
      , AL_RING_MODULATOR_DEFAULT_HIGHPASS_CUTOFF
     :: (Eq a, Fractional a) => a
pattern AL_RING_MODULATOR_MIN_HIGHPASS_CUTOFF     = 0.0
pattern AL_RING_MODULATOR_MAX_HIGHPASS_CUTOFF     = 24000.0
pattern AL_RING_MODULATOR_DEFAULT_HIGHPASS_CUTOFF = 800.0

pattern AL_RING_MODULATOR_MIN_WAVEFORM
      , AL_RING_MODULATOR_MAX_WAVEFORM
      , AL_RING_MODULATOR_DEFAULT_WAVEFORM
     :: (Eq a, Num a) => a
pattern AL_RING_MODULATOR_MIN_WAVEFORM     = 0
pattern AL_RING_MODULATOR_MAX_WAVEFORM     = 2
pattern AL_RING_MODULATOR_DEFAULT_WAVEFORM = 0

pattern AL_RING_MODULATOR_SINUSOID
      , AL_RING_MODULATOR_SAWTOOTH
      , AL_RING_MODULATOR_SQUARE
     :: (Eq a, Num a) => a
pattern AL_RING_MODULATOR_SINUSOID = 0
pattern AL_RING_MODULATOR_SAWTOOTH = 1
pattern AL_RING_MODULATOR_SQUARE   = 2



pattern AL_AUTOWAH_MIN_ATTACK_TIME
      , AL_AUTOWAH_MAX_ATTACK_TIME
      , AL_AUTOWAH_DEFAULT_ATTACK_TIME
     :: (Eq a, Fractional a) => a
pattern AL_AUTOWAH_MIN_ATTACK_TIME     = 0.0001
pattern AL_AUTOWAH_MAX_ATTACK_TIME     = 1.0
pattern AL_AUTOWAH_DEFAULT_ATTACK_TIME = 0.06

pattern AL_AUTOWAH_MIN_RELEASE_TIME
      , AL_AUTOWAH_MAX_RELEASE_TIME
      , AL_AUTOWAH_DEFAULT_RELEASE_TIME
     :: (Eq a, Fractional a) => a
pattern AL_AUTOWAH_MIN_RELEASE_TIME     = 0.0001
pattern AL_AUTOWAH_MAX_RELEASE_TIME     = 1.0
pattern AL_AUTOWAH_DEFAULT_RELEASE_TIME = 0.06

pattern AL_AUTOWAH_MIN_RESONANCE
      , AL_AUTOWAH_MAX_RESONANCE
      , AL_AUTOWAH_DEFAULT_RESONANCE
     :: (Eq a, Fractional a) => a
pattern AL_AUTOWAH_MIN_RESONANCE     = 2.0
pattern AL_AUTOWAH_MAX_RESONANCE     = 1000.0
pattern AL_AUTOWAH_DEFAULT_RESONANCE = 1000.0

pattern AL_AUTOWAH_MIN_PEAK_GAIN
      , AL_AUTOWAH_MAX_PEAK_GAIN
      , AL_AUTOWAH_DEFAULT_PEAK_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_AUTOWAH_MIN_PEAK_GAIN     = 0.00003
pattern AL_AUTOWAH_MAX_PEAK_GAIN     = 31621.0
pattern AL_AUTOWAH_DEFAULT_PEAK_GAIN = 11.22



pattern AL_COMPRESSOR_MIN_ONOFF
      , AL_COMPRESSOR_MAX_ONOFF
      , AL_COMPRESSOR_DEFAULT_ONOFF
     :: (Eq a, Num a) => a
pattern AL_COMPRESSOR_MIN_ONOFF     = 0
pattern AL_COMPRESSOR_MAX_ONOFF     = 1
pattern AL_COMPRESSOR_DEFAULT_ONOFF = 1



pattern AL_EQUALIZER_MIN_LOW_GAIN
      , AL_EQUALIZER_MAX_LOW_GAIN
      , AL_EQUALIZER_DEFAULT_LOW_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_EQUALIZER_MIN_LOW_GAIN     = 0.126
pattern AL_EQUALIZER_MAX_LOW_GAIN     = 7.943
pattern AL_EQUALIZER_DEFAULT_LOW_GAIN = 1.0

pattern AL_EQUALIZER_MIN_LOW_CUTOFF
      , AL_EQUALIZER_MAX_LOW_CUTOFF
      , AL_EQUALIZER_DEFAULT_LOW_CUTOFF
     :: (Eq a, Fractional a) => a
pattern AL_EQUALIZER_MIN_LOW_CUTOFF     = 50.0
pattern AL_EQUALIZER_MAX_LOW_CUTOFF     = 800.0
pattern AL_EQUALIZER_DEFAULT_LOW_CUTOFF = 200.0

pattern AL_EQUALIZER_MIN_MID1_GAIN
      , AL_EQUALIZER_MAX_MID1_GAIN
      , AL_EQUALIZER_DEFAULT_MID1_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_EQUALIZER_MIN_MID1_GAIN     = 0.126
pattern AL_EQUALIZER_MAX_MID1_GAIN     = 7.943
pattern AL_EQUALIZER_DEFAULT_MID1_GAIN = 1.0

pattern AL_EQUALIZER_MIN_MID1_CENTER
      , AL_EQUALIZER_MAX_MID1_CENTER
      , AL_EQUALIZER_DEFAULT_MID1_CENTER
     :: (Eq a, Fractional a) => a
pattern AL_EQUALIZER_MIN_MID1_CENTER     = 200.0
pattern AL_EQUALIZER_MAX_MID1_CENTER     = 3000.0
pattern AL_EQUALIZER_DEFAULT_MID1_CENTER = 500.0

pattern AL_EQUALIZER_MIN_MID1_WIDTH
      , AL_EQUALIZER_MAX_MID1_WIDTH
      , AL_EQUALIZER_DEFAULT_MID1_WIDTH
     :: (Eq a, Fractional a) => a
pattern AL_EQUALIZER_MIN_MID1_WIDTH     = 0.01
pattern AL_EQUALIZER_MAX_MID1_WIDTH     = 1.0
pattern AL_EQUALIZER_DEFAULT_MID1_WIDTH = 1.0

pattern AL_EQUALIZER_MIN_MID2_GAIN
      , AL_EQUALIZER_MAX_MID2_GAIN
      , AL_EQUALIZER_DEFAULT_MID2_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_EQUALIZER_MIN_MID2_GAIN     = 0.126
pattern AL_EQUALIZER_MAX_MID2_GAIN     = 7.943
pattern AL_EQUALIZER_DEFAULT_MID2_GAIN = 1.0

pattern AL_EQUALIZER_MIN_MID2_CENTER
      , AL_EQUALIZER_MAX_MID2_CENTER
      , AL_EQUALIZER_DEFAULT_MID2_CENTER
     :: (Eq a, Fractional a) => a
pattern AL_EQUALIZER_MIN_MID2_CENTER     = 1000.0
pattern AL_EQUALIZER_MAX_MID2_CENTER     = 8000.0
pattern AL_EQUALIZER_DEFAULT_MID2_CENTER = 3000.0

pattern AL_EQUALIZER_MIN_MID2_WIDTH
      , AL_EQUALIZER_MAX_MID2_WIDTH
      , AL_EQUALIZER_DEFAULT_MID2_WIDTH
     :: (Eq a, Fractional a) => a
pattern AL_EQUALIZER_MIN_MID2_WIDTH     = 0.01
pattern AL_EQUALIZER_MAX_MID2_WIDTH     = 1.0
pattern AL_EQUALIZER_DEFAULT_MID2_WIDTH = 1.0

pattern AL_EQUALIZER_MIN_HIGH_GAIN
      , AL_EQUALIZER_MAX_HIGH_GAIN
      , AL_EQUALIZER_DEFAULT_HIGH_GAIN
     :: (Eq a, Fractional a) => a
pattern AL_EQUALIZER_MIN_HIGH_GAIN     = 0.126
pattern AL_EQUALIZER_MAX_HIGH_GAIN     = 7.943
pattern AL_EQUALIZER_DEFAULT_HIGH_GAIN = 1.0

pattern AL_EQUALIZER_MIN_HIGH_CUTOFF
      , AL_EQUALIZER_MAX_HIGH_CUTOFF
      , AL_EQUALIZER_DEFAULT_HIGH_CUTOFF
     :: (Eq a, Fractional a) => a
pattern AL_EQUALIZER_MIN_HIGH_CUTOFF     = 4000.0
pattern AL_EQUALIZER_MAX_HIGH_CUTOFF     = 16000.0
pattern AL_EQUALIZER_DEFAULT_HIGH_CUTOFF = 6000.0



pattern AL_MIN_AIR_ABSORPTION_FACTOR
      , AL_MAX_AIR_ABSORPTION_FACTOR
      , AL_DEFAULT_AIR_ABSORPTION_FACTOR
     :: (Eq a, Fractional a) => a
pattern AL_MIN_AIR_ABSORPTION_FACTOR     = 0.0
pattern AL_MAX_AIR_ABSORPTION_FACTOR     = 10.0
pattern AL_DEFAULT_AIR_ABSORPTION_FACTOR = 0.0

pattern AL_MIN_ROOM_ROLLOFF_FACTOR
      , AL_MAX_ROOM_ROLLOFF_FACTOR
      , AL_DEFAULT_ROOM_ROLLOFF_FACTOR
     :: (Eq a, Fractional a) => a
pattern AL_MIN_ROOM_ROLLOFF_FACTOR     = 0.0
pattern AL_MAX_ROOM_ROLLOFF_FACTOR     = 10.0
pattern AL_DEFAULT_ROOM_ROLLOFF_FACTOR = 0.0

pattern AL_MIN_CONE_OUTER_GAINHF
      , AL_MAX_CONE_OUTER_GAINHF
      , AL_DEFAULT_CONE_OUTER_GAINHF
     :: (Eq a, Fractional a) => a
pattern AL_MIN_CONE_OUTER_GAINHF     = 0.0
pattern AL_MAX_CONE_OUTER_GAINHF     = 1.0
pattern AL_DEFAULT_CONE_OUTER_GAINHF = 1.0

pattern AL_MIN_DIRECT_FILTER_GAINHF_AUTO
      , AL_MAX_DIRECT_FILTER_GAINHF_AUTO
      , AL_DEFAULT_DIRECT_FILTER_GAINHF_AUTO
     :: (Eq a, Num a) => a
pattern AL_MIN_DIRECT_FILTER_GAINHF_AUTO     = AL_FALSE
pattern AL_MAX_DIRECT_FILTER_GAINHF_AUTO     = AL_TRUE
pattern AL_DEFAULT_DIRECT_FILTER_GAINHF_AUTO = AL_TRUE

pattern AL_MIN_AUXILIARY_SEND_FILTER_GAIN_AUTO
      , AL_MAX_AUXILIARY_SEND_FILTER_GAIN_AUTO
      , AL_DEFAULT_AUXILIARY_SEND_FILTER_GAIN_AUTO
     :: (Eq a, Num a) => a
pattern AL_MIN_AUXILIARY_SEND_FILTER_GAIN_AUTO     = AL_FALSE
pattern AL_MAX_AUXILIARY_SEND_FILTER_GAIN_AUTO     = AL_TRUE
pattern AL_DEFAULT_AUXILIARY_SEND_FILTER_GAIN_AUTO = AL_TRUE

pattern AL_MIN_AUXILIARY_SEND_FILTER_GAINHF_AUTO
      , AL_MAX_AUXILIARY_SEND_FILTER_GAINHF_AUTO
      , AL_DEFAULT_AUXILIARY_SEND_FILTER_GAINHF_AUTO
     :: (Eq a, Num a) => a
pattern AL_MIN_AUXILIARY_SEND_FILTER_GAINHF_AUTO     = AL_FALSE
pattern AL_MAX_AUXILIARY_SEND_FILTER_GAINHF_AUTO     = AL_TRUE
pattern AL_DEFAULT_AUXILIARY_SEND_FILTER_GAINHF_AUTO = AL_TRUE



flt_max :: forall a. RealFloat a => a
flt_max = let e = floatDigits (0 :: a)
              m = floatRadix (0 :: a) ^ e - 1
              n = snd (floatRange (0 :: a)) - e
          in encodeFloat m n

flt_min :: forall a. RealFloat a => a
flt_min = encodeFloat 1 $ fst (floatRange (0 :: a)) - floatDigits (0 :: a)

pattern AL_MIN_METERS_PER_UNIT
      , AL_MAX_METERS_PER_UNIT
      , AL_DEFAULT_METERS_PER_UNIT
     :: (Eq a, RealFloat a) => a
pattern AL_MIN_METERS_PER_UNIT <- ((==) flt_min -> True)
  where
    AL_MIN_METERS_PER_UNIT = flt_min

pattern AL_MAX_METERS_PER_UNIT <- ((==) flt_max -> True)
  where
    AL_MAX_METERS_PER_UNIT = flt_max

pattern AL_DEFAULT_METERS_PER_UNIT = 1.0
