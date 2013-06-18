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
        arc_rad=2000 # radius of half arc for marking orientation
        string="Element[ \"\" \"\" \"\" \"\" 1000 1000 0 0 0 100 \"\"] (\n"
        string+="\tElementLine ["+ pr(-self.length/2) + " " + pr(self.width/2)+ " " + pr(self.length/2)+ " " + pr(self.width/2) + " 1000]\n"
        string+="\tElementLine ["+ pr(-self.length/2) + " " + pr(-self.width/2)+ " " + pr(self.length/2)+ " " + pr(-self.width/2) + " 1000]\n"
        string+="\tElementLine ["+ pr(self.length/2) + " "+ pr(-self.width/2) + " "+ pr(self.length/2)+ " " + pr(self.width/2) + " 1000]\n"

        # draw the little half circle for showing oreientation
        string+="\tElementLine ["+ pr(-self.length/2) + " "+ pr(-self.width/2) + " "+ pr(-self.length/2)+ " " + pr(-arc_rad) + " 1000]\n"
        string+="\tElementLine ["+ pr(-self.length/2) + " "+ pr(arc_rad) + " "+ pr(-self.length/2)+ " " + pr(self.width/2)  + " 1000]\n"
        string+="\tElementArc ["+ pr(-self.length/2) + " "+ pr(0) + " "+ pr(arc_rad)+ " " + pr(arc_rad) + " " + pr(90) + " " + pr(180)+ " 1000]\n"
        for a in self.arrays:
            string+=(a.generate())
        return string + "\n)"

if __name__== "__main__":
    prefix=argv[1]
    nums=[14,16,20,24]
    As= {14:6.5, 16:6.5, 20: 7.5, 24: 8.5}
    """http://www.nalanda.nitc.ac.in/industry/appnotes/TI_logic/data/www.ti.com/sc/docs/products/logic/package/lpssop.htm"""
    for num in nums:
        width=9/25.4 *1000
        A=As[num]*1000/25.4
        pitch= .65/25.4 * 1000
        B= pitch * (num-2)/2
        row_spacing= 7.62/25.4 *1000
        c=Component(length=A*100, width=width*100)
        p=Pad(height=1.05/25.4 *1000,width=.4/25.4 *1000, clearance=12 , mask=1.05/25.4 *1000+30)
        y0=0
        c.add_array(PinArray(pin=p, x0=-B/2, y0=y0 + row_spacing/2, spacing=pitch, num=num/2, direction=1, prefix=""))
        c.add_array(PinArray(pin=p, x0=-B/2, y0=y0-row_spacing/2, spacing=pitch, num=num/2, direction=-1, prefix="", start_num=num/2 + 1))
        elmstr= c.generate()
        write(name="SSOP_DB_" +repr(num) + ".fp", prefix=prefix, elmstr=elmstr)
    
