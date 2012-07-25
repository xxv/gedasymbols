#!/bin/bash
# A little shortcut to open gschem and pcb of a project

gschem $1".sch"&
pcb $1".pcb"&
