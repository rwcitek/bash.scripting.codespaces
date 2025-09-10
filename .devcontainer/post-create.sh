#!/bin/bash

ln -snf ${containerWorkspaceFolder}/.bash_aliases ~/.bash_aliases

env > /tmp/env.txt
