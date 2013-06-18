"""
    Copyright 2008,2013 Sam Fladung
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
"""

def get_copyright_string():
    return "\n# author: Sam Fladung \n# dist-license: GPLv3+\n# use-license:\n"
    

def write(name, prefix, elmstr):
    f = open(prefix+name, 'w')
    f.write(elmstr)
    f.write(get_copyright_string())
    f.close()
