#!/usr/bin/env bash
# Tiny test runner: exits non-zero if any check fails.
set -u
cd "$(dirname "$0")/.." || exit 1
fail=0

expect() {
  local name="$1" expected="$2" actual="$3"
  if [ "$expected" = "$actual" ]; then
    echo "PASS $name"
  else
    echo "FAIL $name: expected '$expected', got '$actual'"
    fail=1
  fi
}

expect "0C is 32F"     "32"  "$(bash convert.sh 0)"
expect "100C is 212F"  "212" "$(bash convert.sh 100)"
expect "-40C is -40F"  "-40" "$(bash convert.sh -40)"

exit "$fail"
