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
from WriteComponents import write
from sys import argv
class Pin():
    def __init__(self, thickness, clearance, mask, drill):
        self.dict={}
        self.dict["thickness"]=thickness
        self.dict["drill"]=drill
        self.dict["clearance"]=clearance
        self.dict["mask"]= mask
    def generate(self, x, y, num):
        string= "\tPin [" + repr(int(floor(x*100))) + " " + repr(int(floor(-y*100))) + " " + repr(int(floor(self.dict["thickness"]*100))) + " " + repr(int(floor(self.dict["clearance"]*100))) + " " + repr(int(floor(self.dict["mask"]*100))) + " " + repr(int(floor(self.dict["drill"]*100))) + "\"" + num + "\" \"" + num + "\" \"" + "\"] \n"
        return string
class PinArray:
    def __init__(self, pin, x0, y0, spacing, num, direction, prefix):
        self.dict={}
        self.dict["pin"]= copy.copy(pin)
        self.dict["x0"]= x0
        self.dict["y0"]= y0
        self.dict["spacing"]= spacing
        self.dict["num"]= num
        self.dict["direction"]= direction
        self.dict["prefix"]= prefix
    def generate(self):
        string=""
        for i in range(1, self.dict["num"] + 1):
            string+=(self.dict["pin"].generate(x=self.dict["x0"] + (i-1)* self.dict["spacing"], y=self.dict["y0"], num=self.dict["prefix"] + repr(i)))
        return string
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



        for a in self.arrays:
            string+=(a.generate())
        return string + "\n)"
if __name__== "__main__":
    prefix=argv[1]
    c=Component(length=3150, width=1339)
    p=Pin(thickness=28+14,drill=28, clearance=12 , mask=28+12+3)
    c.add_array(PinArray(pin=p, x0=178, y0=47, spacing=50, num=4, direction=1, prefix="ST"))
    c.add_array(PinArray(pin=p, x0=428, y0=47, spacing=50, num=6, direction=1, prefix="HWA"))
    c.add_array(PinArray(pin=p, x0=778, y0=47, spacing=50, num=10, direction=1, prefix="IO"))
    c.add_array(PinArray(pin=p, x0=1328, y0=47, spacing=50, num=20, direction=1, prefix="LD"))
    c.add_array(PinArray(pin=p, x0=1326, y0=724, spacing=50, num=6, direction=1, prefix="NSSP"))
    c.add_array(PinArray(pin=p, x0=1698, y0=724, spacing=50, num=4, direction=1, prefix="I2C"))
    c.add_array(PinArray(pin=p, x0=1942, y0=724, spacing=50, num=4, direction=1, prefix="FF"))
    c.add_array(PinArray(pin=p, x0=2194, y0=724, spacing=50, num=4, direction=1, prefix="HWB"))
    c.add_array(PinArray(pin=p, x0=2436, y0=724, spacing=50, num=6, direction=1, prefix="BT"))
    c.add_array(PinArray(pin=p, x0=1099, y0=1291, spacing=50, num=4, direction=1, prefix="XY"))
    c.add_array(PinArray(pin=p, x0=1485, y0=1291, spacing=50, num=4, direction=1, prefix="AN"))
    h=Pin(thickness= 86.61+20, drill= 86.61, clearance= 12, mask=86.61+20+3)
    c.add_array(PinArray(pin=h, x0=78.74, y0=78.74, spacing=2992.12598, num=2, direction=1, prefix="H"))
    c.add_array(PinArray(pin=h, x0=78.74, y0=1259.84252, spacing=2992.12598, num=2, direction=1, prefix="H"))
    write(name="Audiostix.fp", prefix=prefix, elmstr=c.generate())
    
