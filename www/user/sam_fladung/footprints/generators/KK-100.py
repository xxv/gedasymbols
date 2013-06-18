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
from math import floor
from sys import argv
from ArrayGenerator import PinArray, Pin
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
        string+="\tElementLine [0 0 " + repr(int(floor(100*self.length))) +" " + "0 600]\n"
        string+="\tElementLine [0 0 " + "0" +" " + repr(int(-100*floor(self.width))) +" 600]\n"
        string+="\tElementLine [" + repr(int(floor(100*self.length))) + " 0 " + repr(int(floor(100*self.length))) +" " + repr(int(-100*floor(self.width))) +" 600]\n"
        string+="\tElementLine [0 " +  repr(int(-100*floor(self.width))) + " " + repr(int(floor(100*self.length))) +" " + repr(int(-100*floor(self.width))) +" 600]\n"
        string+="\tElementLine [0 " +  "-1000" + " " + repr(int(floor(100*self.length))) +" " + "-1000" +" 600]\n"
        for a in self.arrays:
            string+=(a.generate())
        return string + "\n)"
if __name__== "__main__":
    prefix=argv[1]
    for num in range(2,10+1):
        c=Component(length=(num-1)*100+95, width=250)
        p=Pin(thickness=40+30,drill=40, clearance=12 , mask=40+12+3)
        c.add_array(PinArray(pin=p, x0=95/2, y0=123, spacing=100, num=num, direction=1, prefix=""))
        elmstr= c.generate()
        write(name="KK-100-" +repr(num) + ".fp", prefix=prefix, elmstr=elmstr)
    
