# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -ordering dfs -reordering win4 -verify ./nanotrav/s27.blif ./nanotrav/s27b.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 2



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 6 nodes 1 leaves 1.875 minterms
ID =  0x3a1d7	index = 0	T = 0x3a1d4	E = !1        
ID =  0x3a1d4	index = 2	T = 1        	E =  0x3a1d3
ID =  0x3a1d3	index = 3	T = 1        	E =  0x3a1d2
ID =  0x3a1d2	index = 4	T = 0x3a1ca	E =  1        
ID =  0x3a1ca	index = 5	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0x743AE0 

Number of nodes: 6 

Number of levels: 6 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Node: 743820 
Node index: 2147483647 
i: 2147483647 

Node: 743940 
Node index: 5 
i: 5 

Node: 743A40 
Node index: 4 
i: 4 

Node: 743A60 
Node index: 3 
i: 3 

Node: 743A80 
Node index: 2 
i: 2 

Node: 743AE0 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 1



 T node value: 743A80
number edges: 0 
E node value: 743821
number edges: 1 
Node: 743820 
Node index: 2147483647 
i: 2147483647 

Node: 743940 
Node index: 5 
i: 5 

Node: 743A40 
Node index: 4 
i: 4 

Node: 743A60 
Node index: 3 
i: 3 

Node: 743A80 
Node index: 2 
i: 2 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: 743AE0 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 2



 T node value: 743820
number edges: 0 
E node value: 743A60
number edges: 0 



 T node value: 743A80
number edges: 0 
E node value: 743821
number edges: 1 
Node: 743820 
Node index: 2147483647 
i: 2147483647 

Node: 743940 
Node index: 5 
i: 5 

Node: 743A40 
Node index: 4 
i: 4 

Node: 743A60 
Node index: 3 
i: 3 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: 743A80 
Node index: 2 
i: 2 

Adding node to our bound set*****************************
boundsetSize increments to: 2
Node: 743AE0 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 3



 T node value: 743820
number edges: 0 
E node value: 743A40
number edges: 0 



 T node value: 743820
number edges: 0 
E node value: 743A60
number edges: 0 



 T node value: 743A80
number edges: 0 
E node value: 743821
number edges: 1 
Node: 743820 
Node index: 2147483647 
i: 2147483647 

Node: 743940 
Node index: 5 
i: 5 

Node: 743A40 
Node index: 4 
i: 4 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: 743A60 
Node index: 3 
i: 3 

Adding node to our bound set*****************************
boundsetSize increments to: 2
Node: 743A80 
Node index: 2 
i: 2 

Adding node to our bound set*****************************
boundsetSize increments to: 3
Node: 743AE0 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 4



 T node value: 743940
number edges: 0 
E node value: 743820
number edges: 0 



 T node value: 743820
number edges: 0 
E node value: 743A40
number edges: 0 



 T node value: 743820
number edges: 0 
E node value: 743A60
number edges: 0 



 T node value: 743A80
number edges: 0 
E node value: 743821
number edges: 1 
Cut Level: 2

Number of Sigma Zero Edges = 1
i: 2147483647 
i: 5 
i: 4 
i: 3 
i: 2 
i: 0 
boundsetSize increments to: 1
boundsetSize: 1
n: 5
Bound Set: 743A40,
Free Set: 743820, 743940, 743A40, 743A60, 743A80,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

Entering for loop. i = 0
Node is in freeset. j = 1
Node was redirected to one node.
Before Reduce Heap
BDD reordering with sifting: from 11 to ... 8 nodes in 0 sec
After Reduce Heap
Node is in freeset else child. j = 4
BDD reordering with sifting: from 8 to ... 8 nodes in 0 sec
Dumping out the divisor


**************BUILDING QUOTIENT BDD***************

Entering for QUOTIENT loop. i = 0
Quotient T child fine.
Quotient E child fine.
Printing Quotient BLIF
Printing Quotient DOT

End of Bi-Decomposition Method.




Starting Functional Decomposition Method

Node: 75CE00 
Node index: 2147483647 
i: 2147483647 

Node: 75CF20 
Node index: 5 
i: 5 

Node: 75D020 
Node index: 4 
i: 4 

Node: 75D040 
Node index: 3 
i: 3 

Node: 75D060 
Node index: 2 
i: 2 

Node: 75D0C0 
Node index: 0 
i: 0 

Node: 766040 
Node index: 2147483647 
i: 2147483647 

Node: 766160 
Node index: 5 
i: 5 

Node: 766260 
Node index: 4 
i: 4 

Node: 766280 
Node index: 3 
i: 3 

Node: 7662A0 
Node index: 2 
i: 2 

Node: 766300 
Node index: 0 
i: 0 

boundsetSize = 1
Freeset Size = 5
One node is: 75CE00
Freeset[0] is: 743820
Freeset[1] is: 743940
Entering for boundset loop. i = 0, node = 7662A0
Entering next loop. j = 0, node = 7662A0
Entering next loop. j = 1, node = 7662A0
Entering next loop. j = 2, node = 7662A0
Entering next loop. j = 3, node = 7662A0
Entering next loop. j = 4, node = 7662A0
Node is in freeset. j = 4, node = 7662A0
Node was added to bset_cutset.
Node was added to cutset.
Already in boundset loop. i = 0, node = 766041
cvar = 1

Cutset node[0] = 7662A0
temp_cvar = 1
i = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
temp_cvar = 0
number of bits = 2

Our boundset nodes: 766300
Our cutset nodes: 7662A0
Added 766300 to our mapping, then child: 7662A0, else child: 766041
Added 7662A0's encoding 0
Added 766041's encoding 1
One Node = 766040, Zero Node = 766041

*********Mapping**********
Mapping node = 766300, Mapping E_Enc = 1, Mapping T_Enc = 0

*********End of Mapping**********


Printing the BDD for f BEFORE: ptr to the nodes, T & E children

: 6 nodes 1 leaves 1.875 minterms
ID =  0x3b318	index = 0	T = 0x3b315	E = !1        
ID =  0x3b315	index = 2	T = 1        	E =  0x3b314
ID =  0x3b314	index = 3	T = 1        	E =  0x3b313
ID =  0x3b313	index = 4	T = 0x3b30b	E =  1        
ID =  0x3b30b	index = 5	T = 1        	E = !1        

Freeset node to be removed = 766040
Freeset node to be removed = 766160
Removing freeset 
Freeset node to be removed = 766260
Removing freeset 
Freeset node to be removed = 766280
Removing freeset 
Freeset node to be removed = 7662A0
Removing freeset 
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f AFTER: ptr to the nodes, T & E children

: 5 nodes 1 leaves 2 minterms
ID =  0x3b318	index = 0	T = 0x3b315	E = !1        
ID =  0x3b315	index = 2	T = 0x3b314	E =  0x3b314
ID =  0x3b314	index = 3	T = 0x3b313	E =  0x3b313
ID =  0x3b313	index = 4	T = 1        	E =  1        

Map_Node = 766300, Encoding = 0, Shifted Encoding = 0
Map node then child before assignment is: 7662A0
Map node then child after assignment is: 766041
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 766300, Encoding = 1, Shifted Encoding = 1
Map node else child before assignment is: 766041
Map node else child after assignment is: 766040
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 2 nodes 1 leaves 4 minterms
ID =  0x3b318	index = 0	T = 1        	E =  1        

Root node: 766300
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Map_Node = 766300, Encoding = 0, Shifted Encoding = 0
Map node then child before assignment is: 766040
Map node then child after assignment is: 766041
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 766300, Encoding = 1, Shifted Encoding = 0
Map node else child before assignment is: 766040
Map node else child after assignment is: 766041
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 2 nodes 1 leaves 2 minterms
ID =  0x3b318	index = 0	T = 1        	E = !1        

Root node: 766300
filename: ash_curt_files/hw5_1.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: s27b.bench
End of main


