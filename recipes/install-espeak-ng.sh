#!/bin/bash
set -x -e
./autogen.sh
./configure --prefix=$PREFIX
make