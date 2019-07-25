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
    with open( 'Plot-MS/%s.dat' % (name), 'r') as f:
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

def make_Label(s, mz, h=100.0, a='right') :
    global mMZ, mIntP, mTxt
    for i in range(len(mMZ)) :
	if abs(mMZ[i]-mz)<0.05 :
	    idx=i
	    h=mIntP[i]
	    break
    print 'set label \"%s\" at %.2f,%.2f %s' % (s, mz, h+2.0, a)

def make_Label_DA(mDA, dm, h=50.0) :
    global mMZ, mIntP, mTxt
    make_Label("A", mDA, a='left')
    print 'set arrow from %.2f,0 to %.2f,110 as 2' % (mDA,mDA)
    maxM = max(mMZ) - dm
    m = mDA
    while m < maxM :
	m = m + dm
	print 'set arrow from %.2f,0 to %.2f,110 as 2' % (m,m)
	print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (m-dm,h+10,m,h+10)
	print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (m-dm,h+10,m,h+10)
	make_Label('+[M]', m-dm/2, h=h+12, a='center')

def make_Label_DC(mDC, dm, h=50.0) :
    global mMZ, mIntP, mTxt
    mAC = mDC-28.0
    make_Label("DC", mDC, a='left')
    make_Label("AC", mAC)
    print 'set arrow from %.2f,0 to %.2f,110 as 2' % (mDC,mDC)
    print 'set arrow from %.2f,0 to %.2f,110 as 2' % (mAC,mAC)
    print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (mDC,h,mAC,h)
    make_Label('-[N_2]', mDC-14.0, h=h+2, a='center')
    maxM = max(mMZ) - dm
    m = mDC
    while m < maxM :
	m = m + dm
	print 'set arrow from %.2f,0 to %.2f,110 as 2' % (m,m)
	print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (m-dm,h+10,m,h+10)
	print 'set arrow from %.2f,%.2f to %.2f,%.2f as 3' % (m-dm,h+10,m,h+10)
	make_Label('+[M]', m-dm/2, h=h+12, a='center')

### Main part

nLine, mMZ, mInt, mIntP, mTxt = read_MS(sysname)

#print nLine
#print mMZ
#print mInt
#print mIntP
#print mTxt

#for i in range(len(mMOC)) :
#    print '\nStep: %ld  E=%f' % (i+1, mSumE[i])
#    for j in range(len(mMOC[i])) :
#	print j, mE[i][j], mOCC[i][j], mMOC[i][j]

print 'set output \'%s.svg\'' % (sysname)

#with open( '%s.label' % (sysname), 'r') as f:
#    for line in f.readlines():
#	eval(line)
#    f.close()

#print(eval('x=7'))
#print eval('max(mMZ)', globals=globals(), locals=locals())
#print exec('print(123+8)', globals(), locals())

#y = 3
#print(exec('y = 4'))
#print(y)

#print mMZ

exec(open('%s.label' % (sysname)).read())

print 'plot \'%s.dat\' using 2:4 with impulses lw 5 lc -1' % (sysname)

print "quit"
