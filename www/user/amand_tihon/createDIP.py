#! /usr/bin/python3.1
# -*- coding: utf-8 -*-
# kate: space-indent on; indent-width 2; mixedindent off; indent-mode python;

# Copyright (C) 2009 Amand Tihon <amand.tihon@alrj.org>
#
# You can redistribute this file and/or modify it under the terms of the
# GNU General Public License as published by the Free Software Foundation,
# either version 3 of the License or (at your option) any later version.



import sys, getopt

class DIP:
  # Some config

  PinSize = 8000      # 80 mil
  OvalPinSize = 6000  # 60 mil
  DrillSize = 1500    # 15 mil
  PadLength = 5000    # 50 mil
  BothPads = True      # On component side as well as on solder side
  FirstSquare = True  # pin no 1 is square
  LineWidth = 1500    # Silk line width


  def __init__(self, pins, width, oval):
    self.pins = pins
    self.rows = pins//2
    self.width = width
    self.oval = oval

    self.name = "U000"
    self.value = ""

    # Description
    d1 = "%i-pins Dual in-line package" % self.pins
    if width==300:
      d2 = ", narrow (300 mil)"
    elif width==400:
      d2 = ", medium wide (400 mil)"
    elif width==600:
      d2 = ", wide (600 mil)"
    else:
      d2 = ", %i mil"
    if oval:
      d3 = ", oval pads"
    else:
      d3 = ""
    self.description = "%s%s%s" % (d1, d2, d3)

    # Some values nearly out of nowhere for centerpoint
    self.mx = 20000
    self.my = 150000

    # Position of the first pin
    self.startx = -width*100//2  # *100 because pcb uses 100th of mils

    if self.rows % 2:
      self.starty = -(self.rows//2) * 10000
    else:
      self.starty = -(self.rows//2) * 10000 + 5000

    # Label position, orientation, scale
    self.tx = self.startx + 10000
    self.ty = self.starty - 15000
    self.tdir = 0
    self.tscale = 100

    self.flags = ""


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

    n = 1
    sq = ""
    if self.FirstSquare:
      sq = "square"

    r = 1
    x = self.startx
    y = self.starty

    # Top down for first column
    while r <= self.rows:
      # draw pin
      print('\tPin[%i %i %i 2000 %i %i "%i" "%i" "%s"]' %
            (x, y, self.PinSize, int(self.PinSize*1.1), self.DrillSize,
             n, n, sq))

      if self.oval:
        # draw pad
        px = x - (self.PadLength//2)
        print('\tPad[%i %i %i %i %i 2000 %i "%i" "%i" "%s"]' %
              (px, y, px+self.PadLength, y, self.PinSize, int(self.PinSize*1.1),
               n, n, "onsolder,square" if sq else "onsolder"))
        if self.BothPads:
          print('\tPad[%i %i %i %i %i 2000 %i "%i" "%i" "%s"]' %
              (px, y, px+self.PadLength, y, self.PinSize, int(self.PinSize*1.1),
               n, n, sq))


      sq = ""
      n += 1
      r += 1
      y += 10000


    # Bottom up for the second column
    x += self.width * 100
    y -= 10000
    while r > 1:
      # draw pin
      print('\tPin[%i %i %i 2000 %i %i "%i" "%i" "%s"]' %
            (x, y, self.PinSize, int(self.PinSize*1.1), self.DrillSize,
             n, n, sq))

      if self.oval:
        # draw pad
        px = x - (self.PadLength//2)
        print('\tPad[%i %i %i %i %i 2000 %i "%i" "%i" "%s"]' %
              (px, y, px+self.PadLength, y, self.PinSize, int(self.PinSize*1.1),
               n, n, "onsolder,square" if sq else "onsolder"))
        if self.BothPads:
          print('\tPad[%i %i %i %i %i 2000 %i "%i" "%i" "%s"]' %
              (px, y, px+self.PadLength, y, self.PinSize, int(self.PinSize*1.1),
               n, n, sq))

      n += 1
      r -= 1
      y -= 10000


  def makesilk(self):
    """Draw silkscreen"""
    r = 1
    x1 = self.startx + 2500
    y1 = self.starty - 7500
    x2 = self.startx + (self.width * 100) - 2500
    y2 = self.starty + (self.rows * 10000) - 2500

    # Lines
    print('\tElementLine[%i %i %i %i %i]' % (x1, y1, -5000, y1, self.LineWidth))
    print('\tElementLine[%i %i %i %i %i]' % (5000, y1, x2, y1, self.LineWidth))
    print('\tElementLine[%i %i %i %i %i]' % (x1, y1, x1, y2, self.LineWidth))
    print('\tElementLine[%i %i %i %i %i]' % (x1, y2, x2, y2, self.LineWidth))
    print('\tElementLine[%i %i %i %i %i]' % (x2, y1, x2, y2, self.LineWidth))

    # Index
    print('\tElementArc[%i %i 5000 5000 0 180 %i]' %
          ((x1+x2)//2, y1, self.LineWidth))


def usage():
  print("Usage: %s [-w spacing] [-o] npins" % sys.argv[0], file=sys.stderr)
  print("The 'npins' argument must be even.", file=sys.stderr)
  print("  -w spacing   pin spacing (default is 300 mil)", file=sys.stderr)
  print("  -o           Make oval pads", file=sys.stderr)



def main():

  width = 300
  oval = False

  try:
    opts, args = getopt.getopt(sys.argv[1:], "ow:")
  except getopt.GetoptError as err:
    usage()
    print("Error:", err, file=sys.stderr)
    exit(1)

  try:
    npins = int(args[0])
  except ValueError as err:
    usage()
    exit(1)
  if npins % 2:
    usage()
    exit(1)

  for arg in opts:
    if arg[0] == '-o':
      oval = True
    elif arg[0] == '-w':
      try:
        width = int(arg[1])
      except ValueError as err:
        usage()
        exit(1)

  elt = DIP(npins, width, oval)
  elt.out()

if __name__ == "__main__":
  main()
  exit(0)