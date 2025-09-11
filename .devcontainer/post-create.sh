#!/bin/bash

ln -snf ${PWD}/.bash_aliases ~/.bash_aliases

env > /tmp/env.txt

./jupyter.light.sh >& /tmp/jupyter.log &
