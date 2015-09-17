#!/bin/bash

BUILD_DIR="build"

source util.sh

set -e

pushd "$(dirname "$0")" > /dev/null

mkdir -p "$BUILD_DIR"

for template in templates/*; do
	output_file="$BUILD_DIR/harden_`basename $template`"
	echo "Rendering $template => $output_file"
	render "$template" > $output_file
	chmod +x $output_file
done

popd > /dev/null