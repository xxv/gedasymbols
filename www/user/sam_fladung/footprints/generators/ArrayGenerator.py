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
from math import ceil
from sys import argv

def pr(x):
    '''This takes a float number, rounds it and gets it ready to display. Output is a string of an int.'''
    return repr(int(round(x)))

class Pad():
    def __init__(self, height, width, clearance, mask):
        """Create a pad object. The pad string isn't created until generate is called. All units are in hundredths of mils. """
        self.dict={}
        self.dict["width"]=width
        self.dict["height"]=height
        self.dict["clearance"]=clearance
        self.dict["mask"]= mask
    def generate(self, x, y, num, flags="square"):
        """Create a pad and return its string. Pad is centered at (x,y)"""
        flags="square" # overwrite because we always want square pads, right?
        # Figure out if the pad is horizontal or vertical and call the right method depending.
        if self.dict["height"] > self.dict["width"]:
            return self.vertical(x,y, self.dict["height"], self.dict["width"], self.dict["clearance"], self.dict["mask"], num, num, flags)
        else:
            return self.horizontal(x,y, self.dict["height"], self.dict["width"], self.dict["clearance"], self.dict["mask"], num, num, flags)
        return string
    def horizontal(self, x,y,height,width,clearance, mask, name,number, flags):
        """Return a horizontal pad (ie pad wider than it is tall)"""
        y1=y
        y2=y
        thickness=height
        x1= x - width/2 + thickness/2 
        x2= x+ width/2 - thickness/2
        return self.writePad(x1,y1,x2,y2,thickness,clearance, mask, name, number, flags)
    def vertical(self, x,y,height,width,clearance, mask, name,number, flags):
        """Return a vertical pad (ie pad taller than it is wide)"""
        thickness=width
        y1= y - height/2 + thickness/2
        y2= y + height/2 - thickness/2
        x1=x
        x2=x
        return self.writePad(x1,y1,x2,y2,thickness,clearance, mask, name, number, flags)
    def writePad(self,x1,y1,x2,y2,thickness,clearance, mask, name, number, flags):
        """Create a pad element string. Pad format is: Pad [x1 y1 x2 y2 thickness clearance mask name pad_number flags]"""
        string="\tPad [" + repr(int(floor( (x1 *100)))) + " " + repr(int(floor(y1 * 100))) + " " + repr(int(floor(x2*100))) + " " + repr(int(floor(y2*100))) + " " + repr(int(floor(thickness*100))) + " " + repr(int(floor(clearance*100))) + " " + repr(int(floor(mask*100))) + "\"" + name + "\" \"" + number + "\" \"" + flags + "\"] \n"
        return string

class Pin():
    def __init__(self, thickness, clearance, mask, drill):
        """Create a pin object. The pin string isn't created until generate is called. All units are in hundredths of mils. """
        self.dict={}
        self.dict["thickness"]=thickness
        self.dict["drill"]=drill
        self.dict["clearance"]=clearance
        self.dict["mask"]= mask
    def generate(self, x, y, num, flags=""):
        """Create a pin and return its string. Pin is centered at (x,y)"""
        string= "\tPin [" + repr(int(floor(x*100))) + " " + repr(int(floor(y*100))) + " " + repr(int(floor(self.dict["thickness"]*100))) + " " + repr(int(floor(self.dict["clearance"]*100))) + " " + repr(int(floor(self.dict["mask"]*100))) + " " + repr(int(floor(self.dict["drill"]*100))) + " \"" + num + "\" \"" + num + "\" \"" + flags + "\"] \n"
        return string

class PinArray:
    def __init__(self, pin, x0, y0, spacing, num, direction, prefix, start_num=1, incr=1):
        """ Creates a pin array object. The text string isn't created until generate is called. Direction is either positive or negative one and allows the direction that the array builds to be reversed. Start num lets the starting number be offset (for example for the second row of a header). Prefix allows some text string to be placed in front of the pin numbers (example holes may have an h prefix). num is the number of pins in the array. incr is the number to increase the pins by (ie 2 would give (1,3,5) etc). spacing is the amount of space between pins."""
        self.dict={}
        self.dict["pin"]= copy.copy(pin)
        self.dict["x0"]= x0
        self.dict["y0"]= y0
        self.dict["spacing"]= spacing
        self.dict["num"]= num
        self.dict["direction"]= direction
        self.dict["prefix"]= prefix
        self.dict["start_num"]= start_num
        self.dict["incr"]=incr
    def generate(self):
        """Generate the array."""
        string=""
        # iterate through the pins in the array. i is the true number of the pin. Not the number of times through te iterator (that is local_num)
        for i in range(self.dict["start_num"], self.dict["start_num"] + self.dict["num"]):
            local_num= i - self.dict["start_num"] # calc the position of the current place in the iteration count
            if i==1:
                flags="square" # any pin number one will be square
            else:
                flags="" # other pins will not be square
            # add the pin to the array string
            if type(self.dict["spacing"] )==type([]): # if we have a list of spacings rather than constant:
                string+=(self.dict["pin"].generate(x=self.dict["x0"]*self.dict["direction"] + (self.dict["direction"])* self.dict["spacing"][local_num], y=self.dict["y0"], num=self.dict["prefix"] + repr((i-self.dict["start_num"])*self.dict["incr"] + self.dict["start_num"]), flags=flags))
            else:
                string+=(self.dict["pin"].generate(x=self.dict["x0"]*self.dict["direction"] + (local_num*self.dict["direction"])* self.dict["spacing"], y=self.dict["y0"], num=self.dict["prefix"] + repr((i-self.dict["start_num"])*self.dict["incr"] + self.dict["start_num"]), flags=flags))
        return string

