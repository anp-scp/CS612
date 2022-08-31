#!/usr/bin/env python3

import time as t
import random as r
import sys

# Provide value of N (matrix size) as command line argument
totalStart = t.process_time_ns()
i = int(sys.argv[1])
A = [[0 for x in range(0,i)] for y in range(0,i)]
B = [[0 for x in range(0,i)] for y in range(0,i)] #Here, it is assumed that matrix B is stored in column major method
C = [[0 for x in range(0,i)] for y in range(0,i)]
for j in range(0,i):
    for k in range(0,i):
        A[j][k] = r.random()*100
        B[j][k] = r.random()*100

meatStart = t.process_time_ns()
for j in range(0,i):
    for k in range(0,i):
        sum = 0
        for l in range(0,i):
            sum += A[j][l]*B[k][l]
        C[j][k] = sum
meatEnd = t.process_time_ns()
totalEnd = t.process_time_ns()
# Time for execution of lines after this line is not included in total time 
print("Total time on CPU:  {0:.9f}".format((totalEnd-totalStart)/1000000000))
print("Multiplication time on CPU:    {0:.9f}".format((meatEnd-meatStart)/1000000000))
