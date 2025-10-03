#!/bin/sh
set -e
make 1> /dev/null && java -cp .:json.jar Bot
