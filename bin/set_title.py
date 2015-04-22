#! /usr/bin/env python
# Python script to set the title of a terminal window

import sys
import os

if len(sys.argv)!=2:
    print "Usage",sys.argv[0],"terminal_title"
else:
    print "\033]0;"+sys.argv[1]+"\007"
    print "Title Set to:",sys.argv[1]
