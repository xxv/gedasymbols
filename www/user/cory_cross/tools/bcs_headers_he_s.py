print "system=mil"
print "function=through_hole_connector"
for i in range(2,62,2):
	print 'HEADER_BCS_HE_S`A single-height Box Connector Strip header with 100mil interpin spacing, 310mil spacing between sides, and single-rowed numbering`' + str(i) + '`RA`2`D``38`70`100`310`' + str((i/2)*100) + '`410`50`````'
