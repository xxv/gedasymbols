#!/usr/bin/env python

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

    counter = 123
    step1dict = {}
    step2dict = {}
    for key, value in replacedict.items():
        counter = counter + 1
        replacement = "NETREPLACE" + str(counter) + "NR"
        step1dict[key] = replacement
        step2dict[replacement] = value

    def make_sed_command( replace_dictionary ):
        return ( 'sed', '-e',
                        (''.join([('s/'+str(key)+'/'+str(value)+'/;') for key,value in replace_dictionary.items()]))[:-1] )

    (sed1_stdin, sed1_stdout) = os.popen2( make_sed_command(step1dict) )
    sed1_stdin.write(sys.stdin.read())
    sed1_stdin.close()
    (sed2_stdin, sed2_stdout) = os.popen2( make_sed_command(step2dict) )
    sed2_stdin.write(sed1_stdout.read())
    sed2_stdin.close()
    sys.stdout.write(sed2_stdout.read())
