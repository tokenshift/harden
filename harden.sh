#!/bin/bash

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

script="build/harden_${DISTRIB_ID,,}_$DISTRIB_RELEASE.sh"
if [ -e "$script" ]; then
	/bin/bash "$script"
	m4 "$template" > /tmp/harden.sh
	/bin/bash /tmp/harden.sh
else
	>&2 echo "No hardening script found for $DISTRIB_ID $DISTRIB_RELEASE"
	exit 1
fi