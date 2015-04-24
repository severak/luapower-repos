#!/bin/bash
# build a package on the current platform (or on a specified platform).

package="$1"
platform="$2"

die() { echo "ERROR: $@" >&2; exit 1; }
usage() { echo "Usage: mgit build REPO [platform]"; exit 0; }

[ "$package" ] || usage
[ "$platform" ] || platform="$(.mgit/platform.sh)" || die "Unknown platform $platform"

script="csrc/$package/build-$platform.sh"
[ -x "$script" ] || die "Build script not found: $script"

cd csrc/$package && ./build-$platform.sh
