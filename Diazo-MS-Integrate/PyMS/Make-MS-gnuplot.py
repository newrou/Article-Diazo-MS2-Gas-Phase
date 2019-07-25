#!/usr/bin/python

import sys
import os
import re
import math
import numpy as np
import pickle

sysname = sys.argv[1]

def read_MS(name):
    mMZ=[]; mInt=[]; mIntP=[]; mTxt=[]; n=0;
    with open( '../Plot-MS/%s.dat' % (name), 'r') as f:
	for line in f.readlines():
	    lst = line.split(';')
	    if len(lst)>4 :
		mMZ.append(float(lst[1]))
		mInt.append(float(lst[2]))
		mIntP.append(float(lst[3]))
		mTxt.append(lst[4].strip(' \t\n\r"'))
		n = n + 1
    f.close()
    return n, mMZ, mInt, mIntP, mTxt

def make_Label(s, mz, h=100.0, a='center') :
    print 'set label \"%s\" at %.2f,%.2f %s tc rgb \"black\" font \",17\"' % (s, mz, h, a)

def make_Label_Line(s, mz, h=100.0, dh=0.0, a='center') :
    global mMZ, mIntP, mTxt
    for i in range(len(mMZ)) :
	if abs(mMZ[i]-mz)<0.05 :
	    idx=i
	    h=mIntP[i]
	    break
    if len(s)<1 : label='%.1f' % (mz)
    else : label=s
    print 'set label \"%s\" at %.2f,%.2f %s tc rgb \"red\" font \",17\"' % (label, mz, h+dh+2.0, a)

def make_arrow(mz1, mz2, h=50.0, l='', a='center') :
    print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (mz1, h, mz2, h)
    print 'set label \"%s\" at %.2f,%.2f %s tc rgb \"black\" font \",17\"' % (l, (mz1+mz2)/2, h+3, a)

def make_Label_DA(mDA, dm, h=50.0, nmax=50, A='A') :
    global mMZ, mIntP, mTxt
    make_Label_Line(A, mDA)
    print 'set arrow from %.2f,0 to %.2f,110 as 2' % (mDA,mDA)
    maxM = max(mMZ) - dm
    m = mDA
    n = 0
    while m < maxM and n < nmax:
	m = m + dm
	n = n + 1
	print 'set arrow from %.2f,0 to %.2f,110 as 2' % (m,m)
	print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (m-dm,h+10,m,h+10)
	print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (m-dm,h+10,m,h+10)
	make_Label('+[M]', m-dm/2, h=h+13)

def make_Label_DC(mDC, dm, h=50.0, nmax=50, DC='DC', AC='AC') :
    global mMZ, mIntP, mTxt
    mAC = mDC-28.0
    make_Label_Line(DC, mDC, a='left')
    make_Label_Line(AC, mAC, a='right')
    print 'set arrow from %.2f,0 to %.2f,110 as 2' % (mDC,mDC)
    print 'set arrow from %.2f,0 to %.2f,110 as 2' % (mAC,mAC)
    print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (mDC,h,mAC,h)
    make_Label('-[N_2]', mDC-14.0, h=h+4)
    maxM = max(mMZ) - dm + 50
    m = mDC
    n = 0
    while m < maxM and n < nmax:
	m = m + dm
	n = n + 1
	print 'set arrow from %.2f,0 to %.2f,110 as 2' % (m,m)
	print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (m-dm,h+10,m,h+10)
	print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (m-dm,h+10,m,h+10)
	make_Label('+[M]', m-dm/2, h=h+13, a='center')

### Main part

nLine, mMZ, mInt, mIntP, mTxt = read_MS(sysname)

print 'set output \'%s.svg\'' % (sysname)

exec(open('%s.label' % (sysname)).read())

print 'plot \'%s.dat\' using 2:4 with impulses lw 5 lc -1' % (sysname)

print "quit"
