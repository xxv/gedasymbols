v 20110115 2
C 44900 45900 1 0 0 resistor-1.sym
{
T 45200 46300 5 10 0 0 0 0 1
device=RESISTOR
T 45300 46200 5 10 1 1 0 0 1
refdes=R0
T 45300 45700 5 10 1 1 0 0 1
value={Zo}
}
C 46000 44900 1 90 0 capacitor-1.sym
{
T 45300 45100 5 10 0 0 90 0 1
device=CAPACITOR
T 46300 45400 5 10 1 1 180 0 1
refdes=C1
T 45100 45100 5 10 0 0 90 0 1
symversion=0.1
T 45900 45000 5 10 1 1 0 0 1
value={C1*SC}
}
C 45800 45900 1 0 0 inductor-1.sym
{
T 46000 46400 5 10 0 0 0 0 1
device=INDUCTOR
T 46200 46200 5 10 1 1 0 0 1
refdes=L2
T 46000 46600 5 10 0 0 0 0 1
symversion=0.1
T 46000 45800 5 10 1 1 0 0 1
value={SL*L2}
}
N 44900 44800 51300 44800 4
{
T 44900 44800 5 10 1 1 0 0 1
netname=0
}
C 46700 45900 1 0 0 inductor-1.sym
{
T 46900 46400 5 10 0 0 0 0 1
device=INDUCTOR
T 47100 46200 5 10 1 1 0 0 1
refdes=L4
T 46900 46600 5 10 0 0 0 0 1
symversion=0.1
T 46900 45800 5 10 1 1 0 0 1
value={SL*L4}
}
C 46900 44900 1 90 0 capacitor-1.sym
{
T 47200 45400 5 10 1 1 180 0 1
refdes=C3
T 46800 45000 5 10 1 1 0 0 1
value={C3*SC}
T 46200 45100 5 10 0 0 90 0 1
device=CAPACITOR
T 46000 45100 5 10 0 0 90 0 1
symversion=0.1
}
C 47600 45900 1 0 0 inductor-1.sym
{
T 47800 46400 5 10 0 0 0 0 1
device=INDUCTOR
T 48000 46200 5 10 1 1 0 0 1
refdes=L6
T 47800 46600 5 10 0 0 0 0 1
symversion=0.1
T 47800 45800 5 10 1 1 0 0 1
value={SL*L6}
}
C 47800 44900 1 90 0 capacitor-1.sym
{
T 48100 45400 5 10 1 1 180 0 1
refdes=C5
T 47700 45000 5 10 1 1 0 0 1
value={C5*SC}
T 47100 45100 5 10 0 0 90 0 1
device=CAPACITOR
T 46900 45100 5 10 0 0 90 0 1
symversion=0.1
}
C 48500 45900 1 0 0 inductor-1.sym
{
T 48700 46400 5 10 0 0 0 0 1
device=INDUCTOR
T 48900 46200 5 10 1 1 0 0 1
refdes=L8
T 48700 46600 5 10 0 0 0 0 1
symversion=0.1
T 48700 45800 5 10 1 1 0 0 1
value={SL*L8}
}
C 48700 44900 1 90 0 capacitor-1.sym
{
T 49000 45400 5 10 1 1 180 0 1
refdes=C7
T 48600 45000 5 10 1 1 0 0 1
value={C7*SC}
T 48000 45100 5 10 0 0 90 0 1
device=CAPACITOR
T 47800 45100 5 10 0 0 90 0 1
symversion=0.1
}
C 49400 45900 1 0 0 inductor-1.sym
{
T 49600 46400 5 10 0 0 0 0 1
device=INDUCTOR
T 49800 46200 5 10 1 1 0 0 1
refdes=L10
T 49600 46600 5 10 0 0 0 0 1
symversion=0.1
T 49600 45800 5 10 1 1 0 0 1
value={SL*L10}
}
C 49600 44900 1 90 0 capacitor-1.sym
{
T 49900 45400 5 10 1 1 180 0 1
refdes=C9
T 49500 45000 5 10 1 1 0 0 1
value={C9*SC}
T 48900 45100 5 10 0 0 90 0 1
device=CAPACITOR
T 48700 45100 5 10 0 0 90 0 1
symversion=0.1
}
N 45800 44800 45800 44900 4
N 46700 44800 46700 44900 4
N 47600 44800 47600 44900 4
N 48500 44800 48500 44900 4
N 49400 44800 49400 44900 4
N 45800 45800 45800 46000 4
N 46700 45800 46700 46000 4
N 47600 45800 47600 46000 4
N 48500 45800 48500 46000 4
N 49400 45800 49400 46000 4
C 50400 45100 1 90 0 resistor-1.sym
{
T 50000 45400 5 10 0 0 90 0 1
device=RESISTOR
T 50700 45500 5 10 1 1 180 0 1
refdes=R11
T 50600 45300 5 10 1 1 180 0 1
value={Zo}
}
N 50300 44800 50300 45100 4
C 51300 45300 1 0 0 vcvs-1.sym
{
T 51500 46350 5 10 0 0 0 0 1
device=SPICE-vcvs
T 51900 46150 5 10 1 1 0 0 1
refdes=E12
T 51500 46550 5 10 0 0 0 0 1
symversion=0.1
T 52000 45250 5 10 1 0 0 5 1
value=1
}
N 51300 44800 51300 45400 4
N 51300 46000 50300 46000 4
C 42500 47000 1 0 0 spice-directive-1.sym
{
T 42600 47300 5 10 0 1 0 0 1
device=directive
T 42600 47100 5 10 0 1 0 0 1
file=?
T 42500 47100 5 10 1 1 0 0 1
value=.param Zo=50 TS=TR/2.12773 SL=TS*Zo SC=TS/Zo
T 42600 47400 5 10 1 1 0 0 1
refdes=A3
}
C 42500 46400 1 0 0 spice-directive-1.sym
{
T 42600 46700 5 10 0 1 0 0 1
device=directive
T 42600 46500 5 10 0 1 0 0 1
file=?
T 42500 46500 5 10 1 1 0 0 1
value=.param C1=.0512 L2=.1525 C3=.2509 L4=.3451 C5=.4353 L6=.52250 C7=.6244 L8=.7597 C9=1.0147 L10=2.2594
T 42600 46800 5 10 1 1 0 0 1
refdes=A4
}
C 42500 48200 1 0 0 spice-subcircuit-LL-1.sym
{
T 42600 48500 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 42600 48600 5 10 1 1 0 0 1
refdes=A0
T 42600 48300 5 10 1 0 0 0 1
model-name=gaussian_filter
}
C 52600 45700 1 0 0 spice-subcircuit-IO-1.sym
{
T 53500 46100 5 10 0 1 0 0 1
device=spice-IO
T 53450 45950 5 10 1 1 0 0 1
refdes=P3
}
C 52600 45100 1 0 0 spice-subcircuit-IO-1.sym
{
T 53500 45500 5 10 0 1 0 0 1
device=spice-IO
T 53450 45350 5 10 1 1 0 0 1
refdes=P4
}
C 43600 45700 1 0 1 spice-subcircuit-IO-1.sym
{
T 42700 46100 5 10 0 1 0 6 1
device=spice-IO
T 42750 45950 5 10 1 1 0 6 1
refdes=P1
}
C 43600 45100 1 0 1 spice-subcircuit-IO-1.sym
{
T 42700 45500 5 10 0 1 0 6 1
device=spice-IO
T 42750 45350 5 10 1 1 0 6 1
refdes=P2
}
C 43400 45300 1 0 0 vcvs-1.sym
{
T 43600 46350 5 10 0 0 0 0 1
device=SPICE-vcvs
T 44000 46150 5 10 1 1 0 0 1
refdes=E13
T 43600 46550 5 10 0 0 0 0 1
symversion=0.1
T 44100 45250 5 10 1 0 0 5 1
value=2
}
N 44900 44800 44900 45400 4
C 42500 47600 1 0 0 spice-directive-1.sym
{
T 42600 47900 5 10 0 1 0 0 1
device=directive
T 42600 47700 5 10 0 1 0 0 1
file=?
T 42500 47700 5 10 1 1 0 0 1
value=+TR=100p
T 42600 48000 5 10 1 1 0 0 1
refdes=A2
}
T 46944 48695 8 10 1 0 0 0 1
author=Russ Dill Russ.Dill@asu.edu
T 46944 48295 8 10 1 0 0 0 1
use-license=unlimited
T 46944 48495 8 10 1 0 0 0 1
dist-license=GPL2
T 46900 47600 9 10 1 0 0 0 3
Idea from: http://sigcon.com/Pubs/edn/MakingEdges.htm
"Making Gaussian Edges", Dr. Howard Johnson, EDN Magazine Dec 2009
And: Anatol I Zverev, Handbook of Filter Synthesis, John Wiley & Sons, New York, 1967
T 46900 46800 9 10 1 0 0 0 4
Apply square pulse to input at desired output voltage level.
Place driver source resistance to output.
TR is 10%-90% rise time.
Includes nominal delay of 1.485*TR
