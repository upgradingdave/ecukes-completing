#!/bin/bash

emacs -batch -l ert -l test/ecukes-test-ert.el -f ert-run-tests-batch-and-exit
