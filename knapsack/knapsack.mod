# Project 3
# File: knapsack.mod
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

# Objective function
maximize Total_Value: sum {i in 0.. n-1} value[i] * x[i];

# Constraint: Each object should be less than the costBound
subject to Cost_Limit: sum {i in 0.. n-1} cost[i] * x[i] <= costBound;
