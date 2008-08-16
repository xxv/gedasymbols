#!/usr/bin/python

# Copyright (C) 2008 Werner Hoch <werner.ho@gmx.de>
# Released under the terms of the GNU General Public License, version 2

import os, sys, getopt
import dircache
import tempfile, popen2


VERSION="0.0.1"
AUTHOR="Werner Hoch <werner.ho@gmx.de>"


"""
This script can connect symbols from a directory into libgeda with the
"component-library-command".

With the --list command all symbols from a given directory are passed to
libgeda.

The --part command returns the symbol via stdout to libgeda. Befor forwarding
the symbol to libgeda, the script checks the symbol with gsymcheck.
The output of gsymcheck is forwarded to the stdout. libgeda will catch that
output. When using the symbols with gschem the output will be printed in
the status window of gschem.
Thus you can check you symbols on the fly when selecting them in the component
dialog.

To conntect a symbol directory that way you have to add some lines to one of
your library scripts in your gEDA installation directory:
  e.g. share/gEDA/gafrc.d/
  
(component-library-command 
 "[SCRIPTDIR]/connect_symbols.py -l [YOUR_SYMBOL_DIR]" 
 "[SCRIPTDIR]/connect_symbols.py -p [YOUR_SYMBOL_DIR]"
 "[VISIBLE_NAME]")
"""


#################### SETUP VARS
SCRIPT_DIR = os.path.join(os.getcwd(),
                          os.path.dirname(sys.argv[0]))

#################### FUNCTIONS
def log(x):
    open("connect_symbols.log","at").write(str(x) + "\n")

def usage():
    print sys.argv[0] + " VERSION " + VERSION + "  written by " + AUTHOR 
    print "usage: " +  sys.argv[0] + """ [options], ...
  -h --help: print this help message
  -v --verbose: write debug messages to the logfile "connect_symbols.log"
  -l --list library: list symbol of one library directory
  -p --part library part: get a single part of a library"""


#################### MAIN

try:
    opts, args = getopt.getopt(sys.argv[1:], "hvl:p:", ["help", "verbose", "list=", "part="])
except getopt.GetoptError, err:
    # print help information and exit:
    print str(err) # will print something like "option -a not recognized"
    usage()
    sys.exit(2)

verbose = False
listlibrary = False
printpart = False

for o, a in opts:
    if o == "-v":
        verbose = True
    elif o in ("-h", "--help"):
        usage()
        sys.exit()
    elif o in ("-v", "--verbose"):
        verbose = True
    elif o in ("-l", "--list"):
        listlibrary = True
        librarydir = a
    elif o in ("-p", "--part"):
        printpart = True
        librarydir = a
        symbolname = args[0]
    else:
        assert False, "unhandled option"

if verbose:
    log(sys.argv[0] + ": opts:" + str(opts) + " args: " + str(args))

elif listlibrary:
    parts = [ f[:-4] for f in dircache.listdir(librarydir) if f[-4:] == ".sym" ]
    sys.stdout.write("\n".join(parts))
    sys.exit()

elif printpart:
    filename = os.path.join(librarydir, symbolname + ".sym")
    sys.stderr.write(filename +"\n")

    ## run gsymcheck over the symbol
    command = "gsymcheck -vv " + filename
    pop = popen2.Popen3(command, capturestderr=True)
    message = pop.fromchild.read()
    err = pop.childerr.read()
    mlines = message.split("\n")
    if len(mlines) > 9:
        message = "\n".join(mlines[7:-1]) + "\n"
    pop.wait()
    sys.stderr.write(message)

    sys.stdout.write(open(filename).read())
    sys.exit(0)

else:
    sys.stderr.write(sys.argv[0] + ": undefined case\n")
    usage()
    sys.exit(2)
