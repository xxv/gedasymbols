print "system=mil"
print "function=through_hole_connector"
for i in range(2,13,1):
	print 'TERMBLOCK200`Terminal blocks with 200mil spacing`' + str(i) + '`V`1`d`reverse`56`100`200`0`' + str((i)*200) + '`550`300`````'
