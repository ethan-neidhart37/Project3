# Project 3
# File: color.mod
# Authors: Ethan Neidhart, Kevin Do
# Solving graph coloring problem using ILP

# number of nodes
param numNodes;

# number of Colors
param numColors;

set edgeList dimen 2;

# edge[op1,op2] = 1 iff (i,j) is in edgeList
param edge {i in 0..numNodes-1, j in 0..numNodes-1} :=
(if (i,j) in edgeList or (j,i) in edgeList then 1 else 0);

# color[i,c] = true means that node i is assigned color c
var color {i in 0..numNodes-1, c in 0..numColors-1} binary;

# conflict[i,j] = true means that there is a conflict in the
# coloring of nodes i and j.
var conflict {i in 0..numNodes-1, j in 0..numNodes-1} binary;

# Objective function
minimize objective: sum{i in 0..numNodes-1, j in 0..numNodes-1} conflict[i, j];

# Each node should have exactly one color
s.t. assignment {i in 0..numNodes-1}: sum {c in 0..numColors-1} color[i,c] = 1;

# Make sure conflicts are detected
s.t. recordConstraint {(i,j) in edgeList, c in 0..numColors-1}: conflict[i,j] >= color[i,c] + color[j,c] - 1;
