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
import copy
from math import floor, ceil
from sys import argv
from ArrayGenerator import PinArray, Pin, Pad, pr
from WriteComponents import write



class Component:
    """The component contains the silk elements and arrays of the footprint."""
    def __init__(self, length, width):
        """set up the basic of the component with a width and a height"""
        self.arrays=[]
        self.length=length
        self.width=width
    def add_array(self, array):
        """ Add another array to the component"""
        self.arrays.append(array)
    def generate(self):
        """Generate the component. """
        string="Element[ \"\" \"\" \"\" \"\" 1000 1000 0 0 0 100 \"\"] (\n"
        string+="\tElementLine ["+ pr(-self.length/2) + " " + pr(-self.width/2) + " " + pr(self.length/2) +  " " + pr(-self.width/2) + " 1000]\n"
        string+="\tElementLine ["+ pr(-self.length/2) + " " + pr(self.width/2) + " " + pr(self.length/2) +  " " + pr(self.width/2) + " 1000]\n"
        string+="\tElementLine ["+ pr(-self.length/2) + " " + pr(-self.width/2) + " " + pr(-self.length/2) +  " " + pr(self.width/2) + " 1000]\n"
        string+="\tElementLine ["+ pr(self.length/2) + " " + pr(-self.width/2) + " " + pr(self.length/2) +  " " + pr(self.width/2) + " 1000]\n"

        for a in self.arrays:
            string+=(a.generate())
        return string + "\n)"

if __name__== "__main__":
    prefix=argv[1]
    for num in range(25,26): # just 25 for now
        A=2.087 * 1000
        B=1.852 * 1000
        C=1.512 *1000
        offset_1=.652*1000
        offset_2= .598*1000
        print "A=" + repr(A)
        print "-B/2=" + repr(-B/2)
        print "C=" + repr(C)
        c=Component(length=A*100, width=311*100)
        p=Pin(thickness=47+30,drill=47, clearance=12 , mask=47+30+6)
        h=Pin(thickness=120+30,drill=120, clearance=12 , mask=120+30+6)
        h2=Pin(thickness=150+30,drill=150, clearance=12 , mask=150+30+6)
        y0=0
        c.add_array(PinArray(pin=p, x0=-offset_1, y0=y0 + 112/2, spacing=109, num=num/2 +1, direction=1, prefix=""))
        c.add_array(PinArray(pin=p, x0=-offset_2, y0=y0-112/2, spacing=109, num=num/2, direction=1, prefix="", start_num=num/2 + 1 +1))
        c.add_array(PinArray(pin=h, x0= -1.852/2*1000 , y0= y0, spacing=1.852*1000, num=2, direction=1, prefix="h"))
        c.add_array(PinArray(pin=h2, x0= -2.4/2*1000 , y0= y0-30, spacing=2.4*1000, num=2, direction=1, prefix="h"))
  
        elmstr= c.generate()
        write(name="DB-25_NORCOMP" +".fp", prefix=prefix, elmstr=elmstr)    
