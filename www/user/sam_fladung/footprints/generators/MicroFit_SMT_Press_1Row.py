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
    def __init__(self, length, width,no_silk=False):
        self.arrays=[]
        self.length=length
        self.width=width
        self.no_silk=no_silk
    def add_array(self, array):
        self.arrays.append(array)
    def generate(self):
        line_y_cord=-(273-118/2 + 180)*100
        string="Element[ \"\" \"\" \"\" \"\" 1000 1000 0 0 0 100 \"\"] (\n"
        if self.no_silk:
            pass
        else:
            string+="\tElementLine ["+ pr(-self.length/2) + " " + repr(line_y_cord) + " " + pr(self.length/2) + " " + repr(line_y_cord) + " " + " 1000]\n"
            string+="\tElementLine ["+ pr(-self.length/2) + " " + repr(line_y_cord) + " " + pr(-self.length/2) + " -24600" + " 1000]\n"
            string+="\tElementLine ["+ pr(self.length/2) + " " + repr(line_y_cord) + " " + pr(self.length/2) + " -24600" + " 1000]\n"
        for a in self.arrays:
            string+=(a.generate())
        return string + "\n)"

def generate_parts(prefix,base_name,no_silk=False):
    for num in range(2,12+1):
        A=(num * .118+.144) * 1000
        B=((num -1) * .118) *1000
        C=(num * .118 + .051) * 1000
        print "A=" + repr(A)
        print "-B/2=" + repr(-B/2)
        print "C=" + repr(C)
        c=Component(length=A*100, width=390,no_silk=no_silk)
        p=Pad(height=115,width=50, clearance=12 , mask=50+30)
        h=Pin(thickness=95+30,drill=95, clearance=12 , mask=95+12+3)
        y0=0
        c.add_array(PinArray(pin=p, x0=-B/2, y0=y0, spacing=118, num=num, direction=1, prefix="", start_num=1))
        c.add_array(PinArray(pin=h, x0= -C/2 , y0= y0- (273 -118/2) , spacing=C, num=2, direction=1, prefix="h"))
        elmstr= c.generate()
        write(name=base_name +repr(num) + ".fp", prefix=prefix, elmstr=elmstr)

if __name__== "__main__":
    prefix=argv[1]
    base_name="MicroFit_SMT_Press-1x"
    generate_parts(prefix,base_name,False)
    generate_parts(prefix,"MicroFit_SMT_Press-no-silk-1x",True)
    
