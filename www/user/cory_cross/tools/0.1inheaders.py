print "system=mil"
print "function=through_hole_connector"
for i in range(2,52,2):
	print 'HEADER`A header with 100mil spacing and Ribbon Cable numbering`' + str(i) + '`V`2`r``42`70`100`100`' + str((i/2)*100) + '`200`50`````'
