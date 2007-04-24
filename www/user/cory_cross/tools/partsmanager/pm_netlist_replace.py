
if __name__ == '__main__':
    import sys,os

    if len(sys.argv) < 2:
        print "Usage: pm_netlist_replace.py filename"
        print "       where filename is a file containing only a python dictionary {...}"
        print
        print " Performs multiple search/replace operations on stdin"
        print "  to stdout. Search/replace pairs are from the dictionary"
        sys.exit(1)

    replacedictfile = open(sys.argv[1])
    replacedict = eval(replacedictfile.read())

    sed_command = ( 'sed', '-e',
                    (''.join([('s/'+str(key)+'/'+str(value)+'/;') for key,value in replacedict.items()]))[:-1] )

    (sed_stdin, sed_stdout) = os.popen2( sed_command )
    sed_stdin.write(sys.stdin.read())
    sed_stdin.close()
    sys.stdout.write(sed_stdout.read())
