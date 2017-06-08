# Project 3
# File: knapsack.mod
# Authors: Kevin Do, Ethan Neidhart
# Solving knapsack problem using ILP

# number of objects
param n;

# cost bound
param costBound;

# costs in n 
param cost {i in 0.. n-1};

# value in n
param value {i in 0.. n-1};

# set binary integers
var x {i in 0.. n-1} binary;

# total value and cost set for display 
param Total_Value default 0;
param Total_Cost default 0;

# Objective function
maximize objective: sum {i in 0.. n-1} value[i] * x[i];

# Constraint: Each object should be less than the costBound
subject to Cost_Limit: sum {i in 0.. n-1} cost[i] * x[i] <= costBound;
