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
    def __init__(self, length, width):
        self.arrays=[]
        self.length=length
        self.width=width
    def add_array(self, array):
        self.arrays.append(array)
    def generate(self):
        string="Element[ \"\" \"\" \"\" \"\" 1000 1000 0 0 0 100 \"\"] (\n"
        string+="\tElementLine ["+ pr(-self.length/2) + " " + pr(-self.width/2) + " "  + pr(self.length/2) + " " + pr(-self.width/2) + " 1000]\n"
        string+="\tElementLine ["+ pr(-self.length/2) + " " + pr(-self.width/2) + " "+ pr(-self.length/2) + " " + pr(self.width/2) + " 1000]\n"
        string+="\tElementLine ["+ pr(self.length/2) + " " + pr(-self.width/2) + " " + pr(self.length/2) + " " + pr(self.width/2) + " 1000]\n"
        string+="\tElementLine ["+ pr(self.length/2) + " " + pr(self.width/2) + " " + pr(-self.length/2) + " " + pr(self.width/2) + " 1000]\n"

	#draw the outer box for modem
	side=1728.3*100 #1/100 mils
	y_offset=-574.8*100 #1/100 mils
	x_offset= 383.86 *100 #1/100 mils
	

        string+="\tElementLine ["+ pr(-(side/2 +x_offset)) + " " + pr(-(side/2 + y_offset)) + " "  + pr(-(side/2+x_offset)) + " " + pr(side/2-y_offset) + " 1000]\n"
        string+="\tElementLine ["+ pr(-(side/2 +x_offset)) + " " + pr(-(side/2 + y_offset)) + " "  + pr(side/2-x_offset) + " " + pr(-(side/2+y_offset)) + " 1000]\n"
        string+="\tElementLine ["+ pr(side/2 -x_offset) + " " + pr(side/2 - y_offset) + " "  + pr(-(side/2+x_offset)) + " " + pr(side/2-y_offset) + " 1000]\n"
        string+="\tElementLine ["+ pr(side/2 -x_offset) + " " + pr(side/2 - y_offset) + " "  + pr(side/2-x_offset) + " " + pr(-(side/2+y_offset)) + " 1000]\n"


        for a in self.arrays:
            string+=(a.generate())
        return string + "\n)"

if __name__== "__main__":
    prefix=argv[1]
    for num in range(50,50+1):
        A=177.17+98.425*( (num-20)/10 )
        C=346.45+98.425*( (num-20)/10 )
	row_spacing= 158
	pitch=20
        print "A=" + repr(A)
        print "C=" + repr(C)
        c=Component(length=C*100, width=260*100)
        p=Pad(height=71,width=10, clearance=12 , mask=15)
        y0=0
        c.add_array(PinArray(pin=p, x0=-A/2, y0=y0-row_spacing/2, spacing=pitch, num=num/2, direction=1, prefix="", start_num=2, incr=2))
        c.add_array(PinArray(pin=p, x0=-A/2, y0=y0+row_spacing/2, spacing=pitch, num=num/2, direction=1, prefix="", start_num=1, incr=2))
	y_offset=-574.8 # mils
	x_offset=383.86 # mils
	hole_distance=1.53543307 *1000
	h=Pin(thickness=60, clearance=20, mask=65, drill=38)
	h2=Pin(thickness=65, clearance=20, mask=69, drill=42)
        c.add_array(PinArray(pin=h, x0=-(hole_distance/2 + x_offset), y0=y0+hole_distance/2 - y_offset, spacing=hole_distance, num=2, direction=1, prefix="h"))
        c.add_array(PinArray(pin=h, x0=-(hole_distance/2 + x_offset)+hole_distance, y0=y0-hole_distance/2 - y_offset, spacing=hole_distance, num=1, direction=1, prefix="h"))
	y_edge= 1670
	x_start=-393.7
	spacing= 393.7
	c.add_array(PinArray(pin=h2, x0= -x_offset -y_edge/2, y0=y0-y_offset + x_start, spacing= y_edge, num=2, direction=1, prefix="h"))
	c.add_array(PinArray(pin=h2, x0= -x_offset -y_edge/2, y0=y0-y_offset - x_start, spacing= y_edge, num=2, direction=1, prefix="h"))
	c.add_array(PinArray(pin=h2, x0= -x_offset - y_edge/2, y0=y0-y_offset - 0, spacing= y_edge, num=2, direction=1, prefix="h"))
	c.add_array(PinArray(pin=h2, x0= -x_offset - 0, y0=y0-y_offset - y_edge/2, spacing= y_edge, num=1, direction=1, prefix="h"))
	c.add_array(PinArray(pin=h2, x0= -x_offset - 0, y0=y0-y_offset + y_edge/2, spacing= y_edge, num=1, direction=1, prefix="h"))

        elmstr= c.generate()
        write(name="Telit_GM862.fp", prefix=prefix, elmstr=elmstr)
    
