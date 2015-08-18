# al

[![Hackage](https://img.shields.io/badge/hackage-0.1.4.1-orange.svg?style=flat)](https://hackage.haskell.org/package/al)

OpenAL is a minimalistic sound API that aims to provide bare features for *spacialized audio*. The API looks
like the OpenGL one, thus the libs are pretty great together. Up to now, no OpenAL extension is supported.
You’re highly invited to contribute.

You’ll need `pkg-config` in order to build.

**For Ubuntu users: there’s a bug in the latest Ubuntu LTS, making the `pkg-config` files for OpenAL broken.
Consider using the following command to install:**

    cabal install al --extra-include-dirs=/usr/include/AL

Or whatever your install path is.
