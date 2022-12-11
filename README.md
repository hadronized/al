# al

[![Hackage](https://img.shields.io/badge/hackage-0.2.0.0-orange.svg?style=flat)](https://hackage.haskell.org/package/al)

OpenAL is a minimalistic sound API that aims to provide bare features for *spacialized audio*. The API looks
like the OpenGL one, thus the libs are pretty great together.

# Implementation caveats

Due to the fact that OpenAL uses mutexes under the hood every foreign function import
is marked as `safe`.

`AL_CHANNEL_MASK` is the only enumeration missing from the bindings: it's internal,
undocumented and was removed during the development of OpenAL Soft.

# Building

## Linux

`pkg-config` is used to discover `openal`.

If using Ubuntu the correct OpenAL package is
[`libopenal-dev`](https://packages.ubuntu.com/search?keywords=libopenal-dev).

## MacOS

Configured against the [openal-soft](https://formulae.brew.sh/formula/openal-soft) Homebrew formula.
You may need to change the `include-dirs` in `al.cabal` according to what Homebrew suggests.

## Windows

The package is configured to use the OpenAL v1.1 Core SDK, with the caveat that you should
move headers from `C:/Program Files (x86)/OpenAL 1.1 SDK/include` to `C:/Program Files (x86)/OpenAL 1.1 SDK/include/AL`.

You can get the Core SDK from the [official website](https://www.openal.org/downloads/)
or using [Chocolatey](https://community.chocolatey.org/packages/openalsdk).
