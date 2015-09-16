#!/bin/bash

if ! type "m4" &> /dev/null; then
	>&2 echo "Missing M4"
	exit 1
fi

if [ ! -e /etc/lsb-release ]; then
	>&2 echo "Failed to identify current OS."
	exit 1
fi

source /etc/lsb-release

if [ -z "$DISTRIB_ID" ]; then
	>&2 echo 'Missing $DISTRIB_ID'
	exit 1
fi

if [ -z "$DISTRIB_RELEASE" ]; then
	>&2 echo 'Missing $DISTRIB_RELEASE'
	exit 1
fi

template="./templates/${DISTRIB_ID,,}/$DISTRIB_RELEASE/template.sh.m4"

if [ -e "$template" ]; then
	m4 "$template" > /tmp/harden.sh
	/bin/bash /tmp/harden.sh
else
	>&2 echo "No script template for $template."
	exit 1
fi