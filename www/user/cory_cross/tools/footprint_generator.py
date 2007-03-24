#!/usr/bin/env python
from string import atof

class FpGenerator:
    def save( self ):
        f = open( self.SAVEDIR + self.filename, 'w' )
        f.write( self.element )
        f.close()
        if __name__ == '__main__':
            import sys
            sys.stderr.write('Saved to ' + self.SAVEDIR + self.filename + '\n' )

    def getMilth( self, value ):
        if ( self.system == 'inch' ):
            return int(value * 100000)
        elif ( self.system == 'mm' ):
            return int(value * 3937.0079)
        elif ( self.system == 'mil' ):
            return int(value * 100)

    def smt_polarized_cap(self, fileptr):
        for line in fileptr.readlines():
            ll = line.split('`')
            (diameter, height, width, length, pin_to_pin_length, pad_width, pin_spacing_length) = [self.getMilth(atof(inval.strip())) for inval in ll[2:]]
            filename = ll[0] + '.fp'
            #Set up the beginning of the element string, with description
            # and mark point of (0,0)
            element = 'Element["" "' + ll[1] + '" "" "" 0 0 '
            #Calculate where to place the text, append to element string, and add rest of header
            element += str( -10000 - pin_spacing_length ) + ' ' + str( 4000 + width/2 ) + ' 0 100 ""]\n('

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
            trace_width = min(pad_length,pad_width)
            element += ph + ' '.join([str(i) for i in (-x_coord, y_coord, -x2_coord, -y_coord, trace_width, 1200, trace_width+1200)]) + ' "Positive" "1" "square"]'
            element += ph + ' '.join([str(i) for i in (x_coord, y_coord, x2_coord, -y_coord, trace_width, 1200, trace_width+1200)]) + ' "Negative" "2" "square"]'
            
            #Generate silkscreen outline
            sh = silk_header = '\n\tElementLine ['
            silk_line_space = 2000
            ##Left line, 
            element += sh + ' '.join([str(int(i)) for i in (-((pin_to_pin_length/2+extra_pad_length) + silk_line_space), .9*width/2, -((pin_to_pin_length/2+extra_pad_length) + silk_line_space), -.9*width/2, 1000)]) + ']'
            ##Mitered corners
            element += sh + ' '.join([str(int(i)) for i in (-((pin_to_pin_length/2+extra_pad_length) + silk_line_space), .9*width/2, -(pin_to_pin_length/2+extra_pad_length), width/2+silk_line_space, 1000)]) + ']'
            element += sh + ' '.join([str(int(i)) for i in (-((pin_to_pin_length/2+extra_pad_length) + silk_line_space), -.9*width/2, -(pin_to_pin_length/2+extra_pad_length), -(width/2+silk_line_space), 1000)]) + ']'
            ##Sides
            element += sh + ' '.join([str(int(i)) for i in (-(pin_to_pin_length/2+extra_pad_length), width/2+silk_line_space, (pin_to_pin_length/2+extra_pad_length)+silk_line_space, width/2+silk_line_space, 1000)]) + ']'
            element += sh + ' '.join([str(int(i)) for i in (-(pin_to_pin_length/2+extra_pad_length), -(width/2+silk_line_space), (pin_to_pin_length/2+extra_pad_length)+silk_line_space, -(width/2+silk_line_space), 1000)]) + ']'
            ##Negative End
            element += sh + ' '.join([str(int(i)) for i in ((pin_to_pin_length/2+extra_pad_length)+silk_line_space, width/2+silk_line_space, (pin_to_pin_length/2+extra_pad_length)+silk_line_space, -(width/2+silk_line_space), 1000)]) + ']'
            element += sh + ' '.join([str(int(i)) for i in ((pin_to_pin_length/2+extra_pad_length)+silk_line_space+1000, .5*(width/2+silk_line_space), (pin_to_pin_length/2+extra_pad_length)+silk_line_space+1000, -.5*(width/2+silk_line_space), 2000)]) + ']'
            #Ending
            element += '\n)\n'
            #Save element
            self.filename = filename
            self.element = element
            self.save()

    def load( self, fileptr ):
        self.system = fileptr.readline().split('=')[1][:-1]
        func = getattr(self, fileptr.readline().split('=')[1][:-1])
        func(fileptr)

    #Need trailing /
    SAVEDIR="/home/cory/gaf/pcb-elements/"


if __name__ == '__main__':
    import sys

    FpGenerator.SAVEDIR="/tmp/"
    n = FpGenerator()
    n.load(sys.stdin)
