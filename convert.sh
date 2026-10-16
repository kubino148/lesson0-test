#!/usr/bin/env bash
# Convert Celsius to Fahrenheit (integer result).
# Usage: bash convert.sh 100
set -eu
c="${1:?usage: convert.sh <celsius>}"
echo $(( c * 9 / 5 + 32 ))
