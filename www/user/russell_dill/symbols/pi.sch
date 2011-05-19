v 20110115 2
C 43200 47000 1 0 0 resistor-1.sym
{
T 43500 47400 5 10 0 0 0 0 1
device=RESISTOR
T 43400 47300 5 10 1 1 0 0 1
refdes=R0
T 43700 47300 5 10 1 1 0 0 1
value={R}
}
C 42500 46200 1 90 0 capacitor-1.sym
{
T 41800 46400 5 10 0 0 90 0 1
device=CAPACITOR
T 42500 46700 5 10 1 1 0 0 1
refdes=C0
T 41600 46400 5 10 0 0 90 0 1
symversion=0.1
T 42500 46400 5 10 1 1 0 0 1
value={C/2}
}
C 42000 46400 1 270 0 spice-subcircuit-IO-1.sym
{
T 42400 45500 5 10 0 1 270 0 1
device=spice-IO
T 42450 45750 5 10 1 1 0 0 1
refdes=P2
}
C 42100 48400 1 0 0 spice-subcircuit-LL-1.sym
{
T 42200 48700 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 42200 48800 5 10 1 1 0 0 1
refdes=A0
T 42200 48500 5 10 1 1 0 0 1
model-name=pi
}
C 42300 47000 1 0 0 inductor-1.sym
{
T 42500 47500 5 10 0 0 0 0 1
device=INDUCTOR
T 42500 47300 5 10 1 1 0 0 1
refdes=L0
T 42500 47700 5 10 0 0 0 0 1
symversion=0.1
T 42800 47300 5 10 1 1 0 0 1
value={L}
}
C 44300 46200 1 90 0 capacitor-1.sym
{
T 43600 46400 5 10 0 0 90 0 1
device=CAPACITOR
T 43900 46700 5 10 1 1 0 6 1
refdes=C1
T 43400 46400 5 10 0 0 90 0 1
symversion=0.1
T 43900 46400 5 10 1 1 0 6 1
value={C/2}
}
C 44400 46400 1 90 1 spice-subcircuit-IO-1.sym
{
T 44000 45500 5 10 0 1 270 2 1
device=spice-IO
T 43950 45750 5 10 1 1 0 6 1
refdes=P4
}
C 44000 46800 1 0 0 spice-subcircuit-IO-1.sym
{
T 44900 47200 5 10 0 1 0 0 1
device=spice-IO
T 44850 47050 5 10 1 1 0 0 1
refdes=P3
}
C 42400 46800 1 0 1 spice-subcircuit-IO-1.sym
{
T 41500 47200 5 10 0 1 0 6 1
device=spice-IO
T 41550 47050 5 10 1 1 0 6 1
refdes=P1
}
N 42200 47100 42300 47100 4
N 44100 47100 44200 47100 4
C 42100 47700 1 0 0 spice-directive-1.sym
{
T 42200 48000 5 10 0 1 0 0 1
device=directive
T 42200 48100 5 10 1 1 0 0 1
refdes=A1
T 42200 47800 5 10 1 1 0 0 1
value=+R=0 L=0 C=0
}
