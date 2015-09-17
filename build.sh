#!/bin/sh

BUILD_DIR="build"

if ! type "m4" &> /dev/null; then
	>&2 echo "Missing M4"
	exit 1
fi

set -e


pushd "$(dirname "$0")" > /dev/null

mkdir -p "$BUILD_DIR"

for template in templates/*; do
	output_file="$BUILD_DIR/harden_`basename $template`"
	echo "Rendering $template => $output_file"
	m4 $template > $output_file
done

popd > /dev/null