#!/bin/bash -x

set -e # exit on error

wget --quiet -O - get.pharo.org/50+vm | bash

./pharo Pharo.image eval "
Metacello new 
	baseline: 'RpgClient';
	repository: './mc';
	load.
"

./pharo Pharo.image test "RpgClient.*"