#!/usr/bin/env python

# This program is licensed under the GNU GPL. See gpl.txt for full license.
# Copyright 2007 Cory Cross. All rights reserved.

from string import atof

def myatof(string_in):
    if(string_in==''):
        return 0.0
    return atof(string_in)

class FpGenerator:

    # save method: override this if you wanted to, for example, insert the footprint
    #  into a database instead of into the filesystem
    def save( self ):
        f = open( self.SAVEDIR + self.filename, 'w' )
        f.write(self.COPYRIGHT)
        f.write(self.LICENSE)
        f.write( self.element )
        f.close()
        if __name__ == '__main__' or self.PrintSavedFiles:
            import sys
            sys.stderr.write('Saved to ' + self.SAVEDIR + self.filename + '\n' )

    # getMilth method: converts a given unit system to PCB's 1/100th of a mil
    def getMilth( self, value ):
        if ( self.system == 'inch' ):
            return int(value * 100000)
        elif ( self.system == 'mm' ):
            return int(value * 3937.0079)
        elif ( self.system == 'mil' ):
            return int(value * 100)

    # smt_dip method: saves the footprint data in the attribute 'self.element';
    #  saves the requested filename in the attribute 'self.filename'
    # If you're looking to write your own generator method, I recommend starting
    #  with this one as opposed to the smt_polarized_cap generator because I
    #  learned a lot writing that one, making this one ten times better! Even
    #  with error checking it ended up being around the same length.
    # This function is called once for each of the data lines. I previously had
    #  this method called once per file, so you could add custom attributes that'd
    #  be common across all the lines in the file, but I've decided that verbosity
    #  is not a vice and you can write another script if you wish to automatically
    #  copy a given dataset N times. I did!
    def smt_dip(self, line):
        ##Form is:
        ##Prefix`Description`number_of_pins`interior_outline?(blank means exterior outline)`pad_height`pad_width`inter_pad_spacing`cross_pad_spacing
        ll = line.split('`')
        try:
            (pad_height, pad_width, inter_pad_spacing, cross_pad_spacing) = [self.getMilth(atof(inval.strip())) for inval in ll[4:]]
        except ValueError, e:
            print "Wrong number of arguments, got:", ll, '\n', e
            return False
        if(pad_height >= inter_pad_spacing+1000):
            print "Warning: The pads will smash together when the pad height is >=~ the length between the pad centers!", ll[0] + ll[2]
        self.filename = ll[0] + ll[2] + '.fp'
        number_of_pins = int(atof(ll[2]))
        interior_silkscreen_p = ll[3]

        if( number_of_pins % 2 != 0 ):
            print "Hey! Only even number of pins, please. Aborting construction", ll[0] + ll[2]
            return False

        #Set up the beginning of the element string, with description
        # and mark point of (0,0)
        self.element = 'Element["" "' + ll[1] + '" "U0" "" 0 0 '
        #Calculate where to place the text, append to element string, and add rest of header
        self.element += str( -cross_pad_spacing/2 ) + ' ' + str( int(-inter_pad_spacing*(number_of_pins/4.0)) - pad_height/2 - 2000 ) + ' 0 100 ""]\n('

        ##Generate pads (square)
        ph = pad_header = '\n\tPad['
        if( pad_height > pad_width ):
            print "Higher than wider pads not yet programmed!", ll[0] + ll[2]
        pad_gap = pad_width/2 - pad_height/2

        def draw_pad( x_coord, y_coord, count ):
            self.element += ph + ' '.join([str(i) for i in (x_coord-pad_gap, y_coord, x_coord+pad_gap, y_coord, pad_height, 1200, pad_height+1200)]) + ' "" "'+str(count)+'" "square"]'

        x_initial_offset = cross_pad_spacing/2
        if( (number_of_pins/2) % 2 == 0):
            y_initial_offset = int(inter_pad_spacing*(.5 + number_of_pins/4 - 1))
        else:
            y_initial_offset = int(inter_pad_spacing*( (number_of_pins-2)/4))

        for pin_number in range(0,number_of_pins/2):
            draw_pad( -x_initial_offset, -y_initial_offset + pin_number*inter_pad_spacing, pin_number+1 )
            draw_pad( x_initial_offset, -y_initial_offset + pin_number*inter_pad_spacing, number_of_pins-pin_number )

        ##Generate silkscreen outline
        sh = silk_header = '\n\tElementLine ['
        silk_line_space = 2000
        if( interior_silkscreen_p ):
            x_silk = x_initial_offset - silk_line_space - pad_width/2
            y_silk = y_initial_offset + pad_height/2
        else:
            #Calculate exterior points...
            print "Need to Calculate exterior points..."
            return 0
            pass
        #Go and draw it
        for xm1,ym1 in [[1,1],[-1,-1]]:
            for xm2,ym2 in [[-1,1],[1,-1]]:
                self.element += sh + ' '.join([str(int(i)) for i in (xm1*x_silk, ym1*y_silk, xm2*x_silk, ym2*y_silk, 1000)]) + ']'

        #Draw the pin1 notch
        for xm1 in [1,-1]:
            self.element += sh + ' '.join([str(int(i)) for i in (xm1*x_silk, -y_silk, 0, -y_silk+2000, 1000)]) + ']'

        #Ending
        self.element += '\n)\n'
        #Successful creation!
        return True

    def smt_polarized_cap(self, line):
        ll = line.split('`')
        (diameter, height, width, length, pin_to_pin_length, pad_width, pin_spacing_length) = [self.getMilth(atof(inval.strip())) for inval in ll[2:]]
        #For these descriptions, point of view is looking down at the component on
        # a board sitting on a flat table, positive end facing you
        #diameter=diameter of the can
        #height=the dimension you can't see from this POV; how high the part comes off the board
        #width=dimension of part left-to-right
        #length=dimsion of part up-to-down
        self.filename = ll[0] + '.fp'
        #Set up the beginning of the element string, with description
        # and mark point of (0,0)
        self.element = 'Element["" "' + ll[1] + '" "" "" 0 0 '
        #Calculate where to place the text, append to element string, and add rest of header
        self.element += str( -10000 - pin_spacing_length ) + ' ' + str( 4000 + width/2 ) + ' 0 100 ""]\n('

        #Generate pads (square)
        ph = pad_header = '\n\tPad['
        extra_pad_length = 4000
        pad_length = extra_pad_length + pin_to_pin_length/2 - pin_spacing_length/2
        if(pad_width > pad_length):
            x_coord = pad_length/2 + pin_spacing_length/2
            y_coord = pad_width/2 - pad_length/2
            x2_coord = x_coord
        else:
            x_coord = pin_to_pin_length/2 + extra_pad_length - pad_width/2
            x2_coord = pin_spacing_length/2 + pad_width/2
            y_coord = 0
        pad_trace_width = min(pad_length,pad_width)
        self.element += ph + ' '.join([str(i) for i in (-x_coord, y_coord, -x2_coord, -y_coord, pad_trace_width, 1200, pad_trace_width+1200)]) + ' "Positive" "1" "square"]'
        self.element += ph + ' '.join([str(i) for i in (x_coord, y_coord, x2_coord, -y_coord, pad_trace_width, 1200, pad_trace_width+1200)]) + ' "Negative" "2" "square"]'
            
        #Generate silkscreen outline
        sh = silk_header = '\n\tElementLine ['
        silk_line_space = 2000
        #end lines (left & right)
        def draw_line( x1_coord, y1_coord, x2_coord, y2_coord, X_MIRROR=False, Y_MIRROR=False, WIDTH=1000 ):
            def do_line( xmul, ymul ):
                self.element += sh + ' '.join([str(int(i)) for i in
                                               (xmul*x1_coord,ymul*y1_coord,
                                                xmul*x2_coord,ymul*y2_coord,
                                                WIDTH)]) + ']'
            if( X_MIRROR and not Y_MIRROR ):
                for x in (1, -1): do_line(x, 1)
            elif( not X_MIRROR and Y_MIRROR ):
                for y in (1, -1): do_line(1, y)
            elif( X_MIRROR and Y_MIRROR ):
                for x in (1, -1):
                    for y in (1, -1): do_line(x, y)
            else:
                do_line(1,1)

        def draw_centered_vert_line( x_coord, length ):
            draw_line( x_coord, length/2, x_coord, -length/2 )
        
        def draw_centered_vert_line_with_middle_gap( x_coord, length, gap ):
            if( gap > length):
                (gap, length) = (length, gap)
            draw_line( x_coord, length/2,
                       x_coord, gap/2,
                       Y_MIRROR=True )

        x_outside = length/2 + silk_line_space

        ##Left line,
        inside_mitered_corner_width = .9*width
        draw_centered_vert_line_with_middle_gap( -x_outside, inside_mitered_corner_width, pad_width )
        ##Mitered corners
        mitered_length_inset = -.90*(length/2)
        draw_line( -x_outside,inside_mitered_corner_width/2,
                   mitered_length_inset, width/2+silk_line_space,
                   Y_MIRROR=True )
        ##Sides
        draw_line( mitered_length_inset, width/2+silk_line_space,
                   x_outside, width/2+silk_line_space,
                   Y_MIRROR=True )
        ##Negative End
        draw_centered_vert_line_with_middle_gap( x_outside, width+2*silk_line_space, pad_width)
        #The outside negative bar
        draw_line((pin_to_pin_length/2+extra_pad_length)+silk_line_space+1000,
                  .5*(width/2+silk_line_space),
                  (pin_to_pin_length/2+extra_pad_length)+silk_line_space+1000,
                  -.5*(width/2+silk_line_space),
                  WIDTH=2000)
        #Ending
        self.element += '\n)\n'
        #Successful creation!
        return True

    def through_hole_connector(self, line):
        ##Form is:
        ##Prefix`Description`number_of_pins`right_angle(V or RA)`rows(#)`numbering_scheme('d' for DIP, 'r' for Ribbon Cable, 'm' for Molex, or 'D' for each row to share a number)`reversed_numbering(blank is false)`hole_diameter`pad_diameter`inter_pad_spacing`cross_pad_spacing(if multiple row)`silk_x_dimension`silk_y_dimension`dimension_from_bottom_silk_edge_to_bottom_pincenter`peg_offset_x`peg_offset_y`peg_hole`where_pegs
        ##dimension_along_connector_path is the y direction
        ##where_pegs is a comma-deliminated list of compass directions i.e. NW,NE will place pegs in the upper-left and upper-right locations
        if(line[0] == '#'): return False
        ll = line.split('`')
        try:
            (hole_diameter, pad_diameter, inter_pad_spacing, cross_pad_spacing,silk_x_dimension,silk_y_dimension,dimension_from_bottom_silk_edge_to_bottom_pincenter,peg_offset_x,peg_offset_y,peg_hole) = [self.getMilth(myatof(inval.strip())) for inval in ll[7:17]]
        except ValueError, e:
            print "Wrong number of arguments, got:", ll, '\n', e
            return False

        prefix = ll[0]
        description = ll[1]
        number_of_pins = int(atof(ll[2]))
        right_angle_p = lambda : (ll[3]=='RA')
        rows = int(atof(ll[4]))
        numbering_scheme = ll[5]
        reversed_numbering = ll[6]
        where_pegs = ll[17]
        pegs_p = lambda : (not (where_pegs==''))
        
        if(pad_diameter >= inter_pad_spacing+1000 or (pad_diameter >= cross_pad_spacing+1000 and rows>1) ):
            print "Warning: The pads will smash together when the pad diameter is larger than the pin spacing + a tolerance!", ll[0] + ll[2]

        if( numbering_scheme != 'd' and numbering_scheme != 'r' and numbering_scheme != 'm' and numbering_scheme != 'D' ):
            print 'Defaulting to Molex numbering scheme ', ll[0] + ll[2]
            numbering_scheme = 'm'

        self.filename = prefix + '-' + ll[3] + '-' + str(number_of_pins) + numbering_scheme + '.fp'

        if( number_of_pins % rows != 0 ):
            print "Hey! Must have a rectangular number of pins, please. Aborting construction", prefix + str(number_of_pins)
            return False

        self.element = ''
        #Set up the beginning of the element string, with description
        # and mark point of (0,0)
        elementheader = 'Element["" "' + description + '" "CONN" "" 0 0 '

        ##Generate pads (square)
        ph = pin_header = '\n\tPin['

        def draw_pin( x_coord, y_coord, number, hole=False ):
            if( reversed_numbering == '' and number.__class__ == int):
                number = number_of_pins - number + 1
            self.element += ph + ' '.join([str(i) for i in (x_coord,y_coord, pad_diameter, 2400, pad_diameter+1000, hole_diameter)]) + ' "" "'+str(number)+'" '
            a = []
            if(number==1 or number=='1'):
                a.append('square')
            if(hole):
                a.append('hole')
            self.element += '"' + ','.join(a) + '"]'

        num_cols = number_of_pins/rows
        if(num_cols%2 == 0):
            first_x_coord = int(-(.5 + (num_cols/2-1))*inter_pad_spacing)
        else: #odd
            first_x_coord = -(num_cols-1)/2*inter_pad_spacing
        last_x_coord = -first_x_coord

        if(rows%2 == 0):
            first_y_coord = int(-(.5 + (rows/2-1))*cross_pad_spacing)
        else: #odd
            first_y_coord = -(rows-1)/2*cross_pad_spacing
        last_y_coord = -first_y_coord

        if( numbering_scheme == 'm' ):
            for row in range(rows):
                number_offset = num_cols*row
                y = first_y_coord + row*cross_pad_spacing
                for col in range(num_cols):
                    x = first_x_coord + col*inter_pad_spacing
                    draw_pin( x, y, number_offset+col+1 )
        elif( numbering_scheme == 'r' ):
            for col in range(num_cols):
                number_offset = rows*(num_cols-1-col)
                x = first_x_coord + col*inter_pad_spacing
                for row in range(rows):
                    y = first_y_coord + row*cross_pad_spacing
                    draw_pin( x, y, number_offset+row+1 )
        elif( numbering_scheme == 'd' ):
            for row in range(rows):
                number_offset = num_cols*row
                y = first_y_coord + row*cross_pad_spacing
                for col in range(num_cols):
                    x = first_x_coord + col*inter_pad_spacing
                    if( row % 2 == 0):
                        draw_pin( x, y, number_offset+col+1 )
                    else:
                        draw_pin( x, y, number_offset+(num_cols-col) )
        elif( numbering_scheme == 'D' ):
            for row in range(rows):
                y = first_y_coord + row*cross_pad_spacing
                for col in range(num_cols):
                    x = first_x_coord + col*inter_pad_spacing
                    draw_pin( x, y, str(col+1) )

        ##Generate Pegs
        for place in where_pegs.split(','):
            if( len(place) == 0 ): continue
            plen = len(place) > 1
            if( place[0] == 'N' ):
                y = first_y_coord - peg_offset_y
                if(plen and place[1] == 'E'):
                    x = last_x_coord + peg_offset_x
                elif(plen and place[1] == 'W'):
                    x = first_x_coord - peg_offset_x
                else:
                    x = 0
            elif( place[0] == 'S' ):
                y = last_y_coord + peg_offset_y
                if(plen and place[1] == 'E'):
                    x = last_x_coord + peg_offset_x
                elif(plen and place[1] == 'W'):
                    x = first_x_coord - peg_offset_x
                else:
                    x = 0
            elif( place[0] == 'E' ):
                x = last_x_coord + peg_offset_x
                y = 0
            elif( place[0] == 'W' ):
                x = first_x_coord - peg_offset_x
                y = 0
            else:
                print "Invalid peg directions ", ll[0] + ll[2]
                return False
            draw_pin(x,y,'',hole=True)
                
        ##Generate silkscreen outline
        sh = silk_header = '\n\tElementLine ['
        silk_line_space = 2000

        y_silk_bottom = last_y_coord + dimension_from_bottom_silk_edge_to_bottom_pincenter

        #Go and draw it
        for ya in (0,-silk_y_dimension):
            self.element += sh + ' '.join([str(int(i)) for i in (-silk_x_dimension/2, ya+y_silk_bottom, silk_x_dimension/2, ya+y_silk_bottom, 1000)]) + ']'
        for x_silk in (-silk_x_dimension/2,silk_x_dimension/2):
            self.element += sh + ' '.join([str(int(i)) for i in (x_silk, y_silk_bottom, x_silk, y_silk_bottom-silk_y_dimension, 1000)]) + ']'

        #Calculate where to place the text, append to element string, and add rest of header
        elementheader += str( -cross_pad_spacing/2 ) + ' ' + str(y_silk_bottom-silk_y_dimension-10000 ) + ' 0 100 ""]\n('
        self.element = elementheader + self.element

        #Ending
        self.element += '\n)\n'
        #Successful creation!
        return True

    def through_hole_capacitor(self, line):
        ##Form is:
        ##square caps: Prefix`Description`polarized?('p' or 'n')`'square'(no quotes)`pin_diameter`pin_copper_diameter`pin_spacing`silk_outline_length`silk_outline_width
        ##round  caps: Prefix`Description`polarized?('p' or 'n')`'round' (no quotes)`pin_diameter`pin_copper_diameter`pin_spacing`silk_outline_diameter
        if( line[0] == '#' ): return False
        ll = line.split('`')
        prefix = ll[0]
        description = ll[1]
        polarized = ll[2]
        shape = ll[3]
        self.filename = prefix + '.fp'

        if( polarized != 'p' ):
            polarized = 'n'

        (pin_diameter, pin_copper_diameter, pin_spacing)= [self.getMilth(myatof(inval.strip())) for inval in ll[4:7]]

        if( shape == 'square' ):
            (silk_outline_length, silk_outline_width) = [self.getMilth(myatof(inval.strip())) for inval in ll[7:9]]
        elif( shape == 'round' ):
            silk_outline_diameter = self.getMilth(myatof(ll[7].strip()))
        else:
            print "Capacitor must be square or round;", ll[0] + ll[2]
            return False
            
        self.element = 'Element["" "' + ll[1] + '" "" "" 0 0 '
        self.element += '0' + ' ' + '0' + ' 0 100 ""]\n('
        
        ph = pin_header = '\n\tPin['

        def draw_pin( x_coord, y_coord, number, hole=False ):
            self.element += ph + ' '.join([str(i) for i in (x_coord,y_coord, pin_copper_diameter, 1200, pin_copper_diameter+1000, pin_diameter)]) + ' "" "'+str(number)+'" '
            a = []
            if(number==1 and polarized == 'p'):
                a.append('square')
            if(hole):
                a.append('hole')
            self.element += '"' + ','.join(a) + '"]'

        count = 0
        for x in [-pin_spacing/2,pin_spacing/2]:
            count = count + 1
            draw_pin(x,0,count)

        ## Silk screen outline and polarized sign...
        sh = silk_header = '\n\tElementLine ['
        silk_line_space = 2000
        #end lines (left & right)
        def draw_line( x1_coord, y1_coord, x2_coord, y2_coord, X_MIRROR=False, Y_MIRROR=False, WIDTH=1000 ):
            def do_line( xmul, ymul ):
                self.element += sh + ' '.join([str(int(i)) for i in
                                               (xmul*x1_coord,ymul*y1_coord,
                                                xmul*x2_coord,ymul*y2_coord,
                                                WIDTH)]) + ']'
            if( X_MIRROR and not Y_MIRROR ):
                for x in (1, -1): do_line(x, 1)
            elif( not X_MIRROR and Y_MIRROR ):
                for y in (1, -1): do_line(1, y)
            elif( X_MIRROR and Y_MIRROR ):
                for x in (1, -1):
                    for y in (1, -1): do_line(x, y)
            else:
                do_line(1,1)

        if( shape == 'square' ):
            draw_line(-silk_outline_length/2,silk_outline_width/2,silk_outline_length/2,silk_outline_width/2,Y_MIRROR=True)
            draw_line(silk_outline_length/2,-silk_outline_width/2,silk_outline_length/2,silk_outline_width/2,X_MIRROR=True)
        else:
            print "Circular outlines not programmed yet..."
            return False

        if( polarized == 'p' ):
            print "Polarization symbol not programmed yet..."
            return False

        #Ending
        self.element += '\n)\n'
        #Successful creation!
        return True


    def load( self, fileptr ):
        try:
            self.system = fileptr.readline().split('=')[1][:-1]
            func = getattr(self, fileptr.readline().split('=')[1][:-1])
        except Exception,e:
            print "Missing either system= or function= at the beginning of the file"
            print e
            sys.exit(-1)
        for line in fileptr.readlines():
            if(func(line)):
                self.save()

    #Need trailing /
    SAVEDIR="/home/cory/gaf/pcb-elements/"
    LICENSE="""
#    This symbol is covered under the GNU GPL, with the following exception.
#    See the file gpl.txt for the full license.
#As a special exception, if you create a design which uses this footprint,
#  and embed this footprint or unaltered portions of this footprint into the
#  design, this footprint does not by itself cause the resulting design to
#  be covered by the GNU General Public License. This exception does not
#  however invalidate any other reasons why the design itself might be
#  covered by the GNU General Public License. If you modify this
#  footprint, you may extend this exception to your version of the
#  footprint, but you are not obligated to do so. If you do not
#  wish to do so, delete this exception statement from your version.

"""
    COPYRIGHT="#Copyright 2007 Cory Cross\n"
    PrintSavedFiles=False

if __name__ == '__main__':
    import sys

    #Need trailing /
    FpGenerator.SAVEDIR="/tmp/"
    n = FpGenerator()
    n.load(sys.stdin)
