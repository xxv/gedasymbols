v 20110619 2
C 40000 40000 0 0 0 title-block.sym
{
T 52100 41300 5 30 1 1 0 4 1
Title=Hierarchy Demo (child)
T 51400 40300 5 16 1 1 0 4 1
filename=hierarchy-demo-child.sch
T 55850 41500 5 16 1 1 0 4 1
revision=0.1
T 56050 40100 5 16 1 1 0 6 1
page=2
T 56200 40100 5 16 1 1 0 0 1
number_of_pages=2
T 55850 40850 5 12 1 1 0 4 1
date=02.07.11
T 54350 40450 5 16 1 1 0 4 1
author=-<)kmk(>-
}
B 49000 40000 7500 5400 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
N 52400 44400 51500 44400 4
N 52400 43400 51500 43400 4
N 54200 44400 53000 44400 4
N 53000 43400 53900 43400 4
N 53900 43400 53900 44400 4
C 52200 44100 1 0 0 res.sym
{
T 52500 44750 5 10 1 1 0 0 1
refdes=R1
T 52500 44550 5 10 1 1 0 0 1
value=100R
T 52500 44150 5 8 1 1 0 0 1
footprint=0805
T 52500 45700 5 8 0 0 0 0 1
symversion=1.0
}
C 52200 43100 1 0 0 res.sym
{
T 52500 43750 5 10 1 1 0 0 1
refdes=R2
T 52500 43550 5 10 1 1 0 0 1
value=200R
T 52500 43150 5 8 1 1 0 0 1
footprint=0805
T 52500 44700 5 8 0 0 0 0 1
symversion=1.0
}
C 50400 44300 1 0 0 in.sym
{
T 51100 46100 5 8 0 0 0 0 1
device=PORT
T 51100 44700 5 8 0 0 0 0 1
footprint=none
T 51050 44400 5 10 1 1 0 7 1
refdes=in1
T 51100 45500 5 8 0 0 0 0 1
symversion=1.0
T 51050 44400 5 10 0 1 0 7 1
net=in1:1
}
C 50400 43300 1 0 0 in.sym
{
T 51100 45100 5 8 0 0 0 0 1
device=PORT
T 51100 43700 5 8 0 0 0 0 1
footprint=none
T 51050 43400 5 10 1 1 0 7 1
refdes=in2
T 51100 44500 5 8 0 0 0 0 1
symversion=1.0
T 51050 43400 5 10 0 1 0 7 1
net=in2:1
}
C 54200 44300 1 0 0 out.sym
{
T 54650 44425 5 10 1 1 0 1 1
refdes=out1
T 54300 46100 5 8 0 0 0 0 1
device=PORT
T 54300 45500 5 8 0 0 0 0 1
symversion=1.0
T 54300 44700 5 8 0 0 0 0 1
footprint=none
T 54650 44425 5 10 0 1 0 1 1
net=out1:1
}
