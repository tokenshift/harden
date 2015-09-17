#!/bin/sh

render() {
	>&2 echo "Rendering $1"
	template=`cat $1`
	template=${template//\$/\\\$}
	template=${template//\(/\\\(}
	template=${template//\)/\\\)}
	template=${template//\"/\\\"}
	eval "echo \"$template\""
}
