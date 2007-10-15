print "system=mm"
print "function=through_hole_connector"
for i in range(2,26,2):
	print 'HEADER2mm`A header with 2mm spacing and Ribbon Cable numbering`' + str(i) + '`V`2`r``.92`1.5`2`2`' + str((i/2)*2) + '`4`1.0`````'
