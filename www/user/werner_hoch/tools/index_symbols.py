#!/usr/bin/python

# Copyright (C) 2008 Werner Hoch <werner.ho@gmx.de>
# Released under the terms of the GNU General Public License, version 2

import os, sys
import hashlib


VERSION="0.0.1"
AUTHOR="Werner Hoch <werner.ho@gmx.de>"


"""
This script collects all symbols below a given directory and moves them
to a destination directory.

Each symbol name is extended with a 8-character SHA1 hash value of the
symbol to avoid naming conflicts.

The hash value can also be usefull to store several versions of a symbol
in the same directory.

The script writes an index file about all symbols in the destination dir.
In this index file I've stored the source location for each symbol.
"""


#################### constants
SCRIPT_DIR=os.path.join(os.getcwd(),
                        os.path.dirname(sys.argv[0]))
LIB_DIR=os.path.join(SCRIPT_DIR, '../lib')
#################### FUNCTIONS

def usage():
    print sys.argv[0] + " Version " + VERSION + "  written by " + AUTHOR
    print "usage: " + sys.argv[0] + " libraryname sourcedir [destdir]"

#################### MAIN

if len(sys.argv) not in [3,4]:
    usage()
    sys.exit()

library_name = sys.argv[1]
source_dir = sys.argv[2]

if len(sys.argv) == 4:
    dest_dir = sys.argv[3]
else:
    dest_dir = LIB_DIR

index_filename = os.path.join(dest_dir, library_name + '.index')
library_dir = os.path.join(dest_dir, library_name)
if not os.path.exists(library_dir):
    os.mkdir(library_dir)
    
## collect all symbols from the subdirectories of source_dir
symnames=[]
for basedir, subdirs, files in os.walk(source_dir):
    symnames.extend([os.path.join(basedir,f) for f in files if f[-4:] == ".sym"])

## read the old index-file into a dictornary
symbol_index = {}
if os.path.exists(index_filename):
    for l in open(index_filename).readlines():
        toks = l.split("=",1)
        if len(toks) == 2:
            symbol_index[toks[0]] = toks[1]

## extend each symbol filename with a 8-char sha1 key and copy it to the
## library dir
for sym in symnames:
    basename = os.path.basename(sym)
    insym = open(sym).read()
    sha1 = hashlib.sha1(insym).hexdigest()
    newname = os.path.join(library_dir, basename[:-4] + "_" + sha1[:8] + ".sym")
    symbol_index[os.path.basename(newname)] = sym
    outsym = open(newname,"wt")
    outsym.write(insym)

## write the new index-dictionary into the index-file
indfile = open(index_filename,"wt")
items = symbol_index.items()
items.sort()
for k,v in items:
    indfile.write(k + "=" + v + "\n")

    
