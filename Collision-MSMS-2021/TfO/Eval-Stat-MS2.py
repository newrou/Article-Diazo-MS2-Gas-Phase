#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
import re

def is_digit(string):
    if string.isdigit():
       return True
    else:
        try:
            float(string)
            return True
        except ValueError:
            return False

def compress_ms2(ms) :
    m = ms[-1]
    xmin = m[4]
    imin = len(ms)-1
    m = ms[0]
    xmax = m[4]
    imax = 0
    for i in range(len(ms)) :
	m = ms[i]
	if xmin > m[4] :
	    xmin = m[4]
	    imin = i
	if xmax < m[4] :
	    xmax = m[4]
	    imax = i
    if imin == imax :
#	print 'skip %ld' % imax
	return m
#    print_d('max', ms[imax])
#    print_d('min', ms[imin])
    ms[imax][1] = ms[imax][1] + ms[imin][1]
    ms[imax][2] = ms[imax][2] + ms[imin][2]
    ms[imax][3] = ms[imax][3] + ms[imin][3]
    ms[imax][4] = ms[imax][2] / ms[imax][1]
#    print_d('res', ms[imax])
    ms.pop(imin)
    return ms

def print_d(s, d) : print '%s %12.3f; %12.3f; %12.3f; %12.5f' % (s, d[1], d[2], d[3], d[4])

def print_ms(ms) :
    s1 = 0
    s2 = 0
    s3 = 0
    for d in ms : 
	print '%17.3f; %12.3f; %12.3f; %12.5f' % (d[1], d[2], d[3], d[4])
	s1 = s1 + d[1]
	s2 = s2 + d[2]
	s3 = s3 + d[3]
    print 'sum: %12.3f; %12.3f; %12.3f; %12.5f\n' % (s1, s2, s3, s2/s1)

def read_ms2(fname) :
    r     = []
    int122 = 0
    int150 = 0
    f = open('%s' % (fname), 'r')
    for line in f :
	m = line.split()
	if len(m)==3 and is_digit(m[0]) :
	    t  = float(m[0])
	    mz = float(m[1])
	    i  = float(m[2])
	    if abs(mz-122.023)<0.02 :
		int122 = i
		int150 = 0
		if int122 < 10.0 : continue
		r.append([t, int122, int150, int122+int150, int150/int122])
#		print [t, int122]
	    if abs(mz-150.03)<0.02 :
		int150 = i
		if int122 < 10.0 : continue
		if int150 < 10.0 : continue
		r[-1] = [t, int122, int150, int122+int150, int150/int122]
#		int122 = 0
#		int150 = 0
#	    if abs(mz-122.023)<0.02 :
#		int122 = i
#	    if abs(mz-150.03)<0.02 :
#		int150 = i
#		if int122 < 100.0 : continue
#		if int150 < 100.0 : continue
#		r.append([t, int122, int150, int122+int150, int150/int122])
#		int122 = 0
#		int150 = 0
#		print [t, int122, int150, int122+int150, int150/int122]
    return r

def stat_ms2(m) :
    sumX = 0.0
    sumN = 0.0
    for i in range(len(m)) :
	d = m[i]
#	print d
	sumX = sumX + d[3]*d[4]
	sumN = sumN + d[3]
    if sumN>0 : Average = sumX/sumN
    else : Average = 0.0
    s2 = 0.0
    sumN = 0.0
    for i in range(len(m)) :
	d = m[i]
#	print d
	s2 = s2 + d[3]*((d[4]-Average)**2)
	sumN = sumN + d[3]
    s2 = s2/(sumN*(sumN-1))
    print 'stat1', Average, s2, s2**0.5

def stat2_ms2(m) :
    sumX = 0.0
    sumN = 0.0
    for i in range(len(m)) :
	d = m[i]
#	print d
	sumX = sumX + d[4]
	sumN = sumN + 1
    if sumN>0 : Average = sumX/sumN
    else : Average = 0.0
    s2 = 0.0
    sumN = 0.0
    for i in range(len(m)) :
	d = m[i]
#	print d
	s2 = s2 + (d[4]-Average)**2
	sumN = sumN + 1
    s2 = s2/(sumN*(sumN-1))
    print 'stat2', Average, s2, s2**0.5

def stat3_ms2(m) :
    sumX = 0.0
    sumN = 0.0
    for i in range(len(m)) :
	d = m[i]
#	print d
	sumX = sumX + d[3]*d[4]
	sumN = sumN + d[3]
    if sumN>0 : Average = sumX/sumN
    else : Average = 0.0
    s2 = 0.0
    sumN = 0.0
    for i in range(len(m)) :
	d = m[i]
#	print d
	s2 = s2 + d[3]*((d[4]-Average)**2)
	sumN = sumN + d[3]
    s2 = s2/sumN
    print 'stat3', Average, s2, s2**0.5


def stat4_ms2(m) :
    sumN = 0.0
    for i in range(len(m)) :
	mx = m[i]
	sumN = sumN + mx[3]
    if sumN<1 : return
    Average = 0.0
    for i in range(len(m)) :
	mx = m[i]
	Average = Average + mx[3]*mx[4]/sumN
    D = 0.0
    for i in range(len(m)) :
	mx = m[i]
#	print d
	D = D + mx[3]*((mx[4]-Average)**2)/sumN
    s2 = D
    print 'stat4', Average, s2, s2**0.5


def stat5_ms2(m) :
    sumN = 0.0
    for i in range(len(m)) :
	mx = m[i]
	sumN = sumN + mx[3]
    if sumN<1 : return
    Average = 0.0
    for i in range(len(m)) :
	mx = m[i]
	Average = Average + mx[3]*mx[4]/sumN
    D = 0.0
    for i in range(len(m)) :
	mx = m[i]
#	print d
	D = D + mx[3]*((mx[4]-Average)**2)/sumN
    s2 = D
    sg = D**0.5
    print 'stat5', Average, s2, s2**0.5
    D = 0.0
    SumN = 0
    for i in range(len(m)) :
	mx = m[i]
#	print d
	if abs(mx[4]-Average)<sg :
	    D = D + mx[3]*((mx[4]-Average)**2)/sumN
	    SumN = SumN + mx[3]
    s2 = D
    print 'stat5*', Average, s2, s2**0.5

def stat6_ms2(m) :
    sumN = 0.0
    for i in range(len(m)) :
	mx = m[i]
	sumN = sumN + mx[3]
    if sumN<1 : return
    Sum122 = 0.0
    Sum150 = 0.0
    for i in range(len(m)) :
	mx = m[i]
	Sum122 = Sum122 + mx[1]
	Sum150 = Sum150 + mx[2]
    Average = Sum150/Sum122
    D = 0.0
    for i in range(len(m)) :
	mx = m[i]
#	print d
	D = D + mx[3]*((mx[4]-Average)**2)/sumN
    s2 = D
    sg = D**0.5
    print 'stat6', Average, s2, s2**0.5
    D = 0.0
    SumN = 0
    for i in range(len(m)) :
	mx = m[i]
#	print d
	if abs(mx[4]-Average)<sg :
	    D = D + mx[3]*((mx[4]-Average)**2)/sumN
	    SumN = SumN + mx[3]
    s2 = D
    print 'stat6*', Average, s2, s2**0.5


def stat7_ms2(m) :
    sumN = 0.0
    for i in range(len(m)) :
	mx = m[i]
	sumN = sumN + mx[3]
    if sumN<1 : return
    Sum122 = 0.0
    Sum150 = 0.0
    for i in range(len(m)) :
	mx = m[i]
	Sum122 = Sum122 + mx[1]
	Sum150 = Sum150 + mx[2]
    Average = Sum150/Sum122
    D = 0.0
    for i in range(len(m)) :
	mx = m[i]
#	print d
	D = D + mx[3]*((mx[4]-Average)**2)/sumN
    s2 = D
    sg = D**0.5
    print 'stat6', Average, s2, s2**0.5
    D = 0.0
    SumN = 0
    for i in range(len(m)) :
	mx = m[i]
#	print d
	if abs(mx[4]-Average)<sg :
	    D = D + mx[3]*((mx[4]-Average)**2)/sumN
	    SumN = SumN + mx[3]
    s2 = D
    print 'stat7*', Average, Average/(Average+1.0), s2, s2**0.5


def stat_all(ms) :
    stat_ms2(ms)
    stat2_ms2(ms)
    #stat3_ms2(ms)
    #stat4_ms2(ms)
    stat5_ms2(ms)
    stat6_ms2(ms)
    stat7_ms2(ms)


ms = read_ms2(sys.argv[1])
print_ms(ms)
#print ms
stat_all(ms)

print '---'
for i in range(int(len(ms)*0.37)) : ms = compress_ms2(ms)
print_ms(ms)
print '==='
stat_all(ms)
