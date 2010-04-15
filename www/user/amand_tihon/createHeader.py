#! /usr/bin/python3.1
# -*- coding: utf-8 -*-
# kate: space-indent on; indent-width 2; mixedindent off; indent-mode python;

# Copyright (C) 2009 Amand  Tihon <amand.tihon@alrj.org>
#
# You can redistribute this file and/or modify it under the terms of the
# GNU General Public License as published by the Free Software Foundation,
# either version 3 of the License or (at your option) any later version.



import sys, getopt

class Header:
  # Some config

  PinSize = 8000      # 80 mil
  OvalPinSize = 6000  # 60 mil
  DrillSize = 1500    # 15 mil
  PadLength = 5000    # 50 mil
  BothPads = True      # On component side as well as on solder side
  FirstSquare = True  # pin no 1 is square
  LineWidth = 1500    # Silk line width

  def __init__(self, cols, rows, oval, ribbon):
    self.cols = cols
    self.rows = rows
    self.oval = oval
    self.ribbon = ribbon

    self.name = "H000"
    self.value = ""

    # Description
    d1 = "%ix%i pins header connector, " % (cols, rows)
    if ribbon:
      d2 = "ribbon cable numbering"
    else:
      d2 = "DIP pin numbering"
    if oval:
      d3 = ", oval pads"
    else:
      d3 = ""
    self.description = "%s%s%s" % (d1, d2, d3)

    # Some values nearly out of nowhere for centerpoint
    self.mx = 20000
    self.my = 5000 + (10000 * cols/2)

    # Label position, orientation, scale
    self.tx = -2500 - (5000 * cols)
    self.ty = -2500
    self.tdir = 3
    self.tscale = 100

    self.flags = ""

    if self.cols == 1:
      self.startx = 0
    elif self.cols == 2:
      self.startx = -5000

    if self.rows % 2:
      self.starty = -(self.rows//2) * 10000
    else:
      self.starty = -(self.rows//2) * 10000 + 5000


  def out(self):
    print('Element[ "" "%s" "%s" "%s" %i %i %i %i %i %i ""]' %
          (self.description, self.name, self.value, self.mx, self.my,
          self.tx, self.ty, self.tdir, self.tscale))
    print('(')
    self.makepins()
    self.makesilk()
    print(')')


  def makepins(self):
    """Draw pins"""
    
    if self.oval:
      self.PinSize = self.OvalPinSize

    self.PadLength = self.PadLength//self.cols

    n = 1
    sq = ""
    if self.FirstSquare:
      sq = "square"

    c = 1
    x = self.startx
    while c <= self.cols:
      r = 1
      y = self.starty
      while r <= self.rows:

        # draw the pin
        print('\tPin[%i %i %i 2000 %i %i "%i" "%i" "%s"]' %
              (x, y, self.PinSize, int(self.PinSize*1.1), self.DrillSize,
               n, n, sq))

        if self.oval:
          # draw the pads
          if self.cols == 1: px = x - (self.PadLength // 2)
          else:
            if c == 1: px = x - self.PadLength
            else     : px = x

          print('\tPad[%i %i %i %i %i 2000 %i "%i" "%i" "%s"]' %
                (px, y, px+self.PadLength, y, self.PinSize, int(self.PinSize*1.1),
                 n, n, "onsolder,square" if sq else "onsolder"))

          if self.BothPads:
            print('\tPad[%i %i %i %i %i 2000 %i "%i" "%i" "%s"]' %
                  (px, y, px+self.PadLength, y, self.PinSize,
                   int(self.PinSize*1.1), n, n, sq))
        sq = ""
        y += 10000
        if self.ribbon:
          n += 2
        else:
          n += 1
        r += 1
      # Made a full column
      if self.ribbon: n = 2 # reset pin numbering
      c += 1
      x += 10000

  def makesilk(self):
    r = 1
    x = self.startx
    y = self.starty

    # Top line
    print('\tElementLine[%i %i %i %i %i]' %
              (x-2500, y-5000, x+2500+((self.cols-1)*10000), y-5000, self.LineWidth))

    # Draw left lines
    for i in range(self.rows):
      print('\tElementLine[%i %i %i %i %i]' %
              (x-5000, y-2500, x-5000, y+2500, self.LineWidth))
      print('\tElementLine[%i %i %i %i %i]' %
              (x-5000, y-2500, x-2500, y-5000, self.LineWidth))
      print('\tElementLine[%i %i %i %i %i]' %
              (x-5000, y+2500, x-2500, y+5000, self.LineWidth))
      y += 10000

    if self.cols == 2:
      x += 10000
    y = self.starty

    # Draw right lines
    for i in range(self.rows):
      print('\tElementLine[%i %i %i %i %i]' %
              (x+5000, y-2500, x+5000, y+2500, self.LineWidth))
      print('\tElementLine[%i %i %i %i %i]' %
              (x+5000, y-2500, x+2500, y-5000, self.LineWidth))
      print('\tElementLine[%i %i %i %i %i]' %
              (x+5000, y+2500, x+2500, y+5000, self.LineWidth))
      y += 10000

    # Bottom line
    x = self.startx
    print('\tElementLine[%i %i %i %i %i]' %
              (x-2500, y-5000, x+2500+((self.cols-1)*10000), y-5000, self.LineWidth))
    

def usage():
  print("Usage: %s [-r] [-o] cols rows" % sys.argv[0])
  print("The 'cols' argument must be 1 or 2.")
  print("  -r       Ribbon pin numbering (default is DIP numbering)")
  print("  -o       Make oval pads")




def main():

  ribbon = False
  oval = False

  try:
    opts, args = getopt.getopt(sys.argv[1:], "or")
  except getopt.GetoptError as err:
    usage()
    print("Error:", err)
    exit(1)

  try:
    cols = int(args[0])
    rows = int(args[1])
  except ValueError as err:
    usage()
    exit(1)

  if cols not in [1, 2]:
    usage()
    exit(1)

  for arg in opts:
    if arg[0] == '-o':
      oval = True
    elif arg[0] == '-r':
      ribbon = True

  elt = Header(cols, rows, oval, ribbon)
  elt.out()

if __name__ == "__main__":
  main()
  exit(0)