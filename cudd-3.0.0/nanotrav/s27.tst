# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -ordering hw -reordering annealing -trav ./nanotrav/s27.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 2



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 6 nodes 1 leaves 1.875 minterms
ID =  0x7a463	index = 0	T = 0x7a45d	E = !1        
ID =  0x7a45d	index = 1	T = 1        	E =  0x7a45c
ID =  0x7a45c	index = 3	T = 0x7a45b	E =  1        
ID =  0x7a45b	index = 4	T = 1        	E =  0x7a44e
ID =  0x7a44e	index = 6	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0xF48C60 

Number of nodes: 6 

Number of levels: 7 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Node: F48880 
Node index: 2147483647 
i: 2147483647 

Node: F489C0 
Node index: 6 
i: 6 

Node: F48B60 
Node index: 4 
i: 4 

Node: F48B80 
Node index: 3 
i: 3 

Node: F48BA0 
Node index: 1 
i: 1 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: F48C60 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 2



 T node value: F48880
number edges: 0 
E node value: F48B80
number edges: 0 



 T node value: F48BA0
number edges: 0 
E node value: F48881
number edges: 1 
Node: F48880 
Node index: 2147483647 
i: 2147483647 

Node: F489C0 
Node index: 6 
i: 6 

Node: F48B60 
Node index: 4 
i: 4 

Node: F48B80 
Node index: 3 
i: 3 

Node: F48BA0 
Node index: 1 
i: 1 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: F48C60 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 2



 T node value: F48880
number edges: 0 
E node value: F48B80
number edges: 0 



 T node value: F48BA0
number edges: 0 
E node value: F48881
number edges: 1 
Node: F48880 
Node index: 2147483647 
i: 2147483647 

Node: F489C0 
Node index: 6 
i: 6 

Node: F48B60 
Node index: 4 
i: 4 

Node: F48B80 
Node index: 3 
i: 3 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: F48BA0 
Node index: 1 
i: 1 

Adding node to our bound set*****************************
boundsetSize increments to: 2
Node: F48C60 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 3



 T node value: F48B60
number edges: 0 
E node value: F48880
number edges: 0 



 T node value: F48880
number edges: 0 
E node value: F48B80
number edges: 0 



 T node value: F48BA0
number edges: 0 
E node value: F48881
number edges: 1 
Node: F48880 
Node index: 2147483647 
i: 2147483647 

Node: F489C0 
Node index: 6 
i: 6 

Node: F48B60 
Node index: 4 
i: 4 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: F48B80 
Node index: 3 
i: 3 

Adding node to our bound set*****************************
boundsetSize increments to: 2
Node: F48BA0 
Node index: 1 
i: 1 

Adding node to our bound set*****************************
boundsetSize increments to: 3
Node: F48C60 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 4



 T node value: F48880
number edges: 0 
E node value: F489C0
number edges: 0 



 T node value: F48B60
number edges: 0 
E node value: F48880
number edges: 0 



 T node value: F48880
number edges: 0 
E node value: F48B80
number edges: 0 



 T node value: F48BA0
number edges: 0 
E node value: F48881
number edges: 1 
Node: F48880 
Node index: 2147483647 
i: 2147483647 

Node: F489C0 
Node index: 6 
i: 6 

Node: F48B60 
Node index: 4 
i: 4 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: F48B80 
Node index: 3 
i: 3 

Adding node to our bound set*****************************
boundsetSize increments to: 2
Node: F48BA0 
Node index: 1 
i: 1 

Adding node to our bound set*****************************
boundsetSize increments to: 3
Node: F48C60 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 4



 T node value: F48880
number edges: 0 
E node value: F489C0
number edges: 0 



 T node value: F48B60
number edges: 0 
E node value: F48880
number edges: 0 



 T node value: F48880
number edges: 0 
E node value: F48B80
number edges: 0 



 T node value: F48BA0
number edges: 0 
E node value: F48881
number edges: 1 
Cut Level: 2

Number of Sigma Zero Edges = 1
i: 2147483647 
i: 6 
i: 4 
i: 3 
i: 1 
boundsetSize increments to: 1
i: 0 
boundsetSize increments to: 2
boundsetSize: 2
n: 4
Bound Set: F48B60, F48B80,
Free Set: F48880, F489C0, F48B60, F48B80,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

Entering for loop. i = 0
Node is in freeset. j = 0
Node was redirected to one node.
Before Reduce Heap
BDD reordering with sifting: from 16 to ... 10 nodes in 0 sec
After Reduce Heap
Node is in freeset else child. j = 0
BDD reordering with sifting: from 10 to ... 10 nodes in 0 sec
Entering for loop. i = 1
Node is in freeset. j = 0
Node was redirected to one node.
Before Reduce Heap
BDD reordering with sifting: from 10 to ... 10 nodes in 0 sec
After Reduce Heap
Node is in freeset else child. j = 0
BDD reordering with sifting: from 10 to ... 10 nodes in 0 sec
Dumping out the divisor


**************BUILDING QUOTIENT BDD***************

Entering for QUOTIENT loop. i = 0
Quotient T child fine.
Quotient E child fine.
Entering for QUOTIENT loop. i = 1
Quotient T child fine.
Quotient E child fine.
Printing Quotient BLIF
Printing Quotient DOT

End of Bi-Decomposition Method.




Starting Functional Decomposition Method

Node: F61E40 
Node index: 2147483647 
i: 2147483647 

Node: F61F80 
Node index: 6 
i: 6 

Node: F62120 
Node index: 4 
i: 4 

Node: F62140 
Node index: 3 
i: 3 

Node: F62160 
Node index: 1 
i: 1 

Node: F62220 
Node index: 0 
i: 0 

Node: F6B0A0 
Node index: 2147483647 
i: 2147483647 

Node: F6B1E0 
Node index: 6 
i: 6 

Node: F6B380 
Node index: 4 
i: 4 

Node: F6B3A0 
Node index: 3 
i: 3 

Node: F6B3C0 
Node index: 1 
i: 1 

Node: F6B480 
Node index: 0 
i: 0 

boundsetSize = 2
Freeset Size = 4
One node is: F61E40
Freeset[0] is: F48880
Freeset[1] is: F489C0
Entering for boundset loop. i = 0, node = F6B0A0
Entering next loop. j = 0, node = F6B0A0
Node is in freeset. j = 0, node = F6B0A0
Node was added to bset_cutset.
Node was added to cutset.
Already in boundset loop. i = 0, node = F6B3A0
Node is in freeset. j = 3, node = F6B3A0
Node was added to cutset.
Entering for boundset loop. i = 1, node = F6B3C0
Entering next loop. j = 0, node = F6B3C0
Entering next loop. j = 1, node = F6B3C0
Entering next loop. j = 2, node = F6B3C0
Entering next loop. j = 3, node = F6B3C0
Already in boundset loop. i = 1, node = F6B0A1
cvar = 2

Cutset node[0] = F6B0A0
Cutset node[1] = F6B3A0
temp_cvar = 2
temp_cvar = 1
i = 1
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

Our boundset nodes: F6B3C0
Our cutset nodes: F6B0A0 F6B3A0
Added F6B3C0 to our mapping, then child: F6B0A0, else child: F6B3A0
Added F6B0A0's encoding 3
Added F6B3A0's encoding 1
One Node = F6B0A0, Zero Node = F6B0A1

*********Mapping**********
Mapping node = F6B3C0, Mapping E_Enc = 1, Mapping T_Enc = 3

*********End of Mapping**********


Printing the BDD for f BEFORE: ptr to the nodes, T & E children

: 6 nodes 1 leaves 1.875 minterms
ID =  0x7b5a4	index = 0	T = 0x7b59e	E = !1        
ID =  0x7b59e	index = 1	T = 1        	E =  0x7b59d
ID =  0x7b59d	index = 3	T = 0x7b59c	E =  1        
ID =  0x7b59c	index = 4	T = 1        	E =  0x7b58f
ID =  0x7b58f	index = 6	T = 1        	E = !1        

Freeset node to be removed = F6B0A0
Freeset node to be removed = F6B1E0
Removing freeset 
Freeset node to be removed = F6B380
Removing freeset 
Freeset node to be removed = F6B3A0
Removing freeset 
BDD reordering with sifting: from 16 to ... 14 nodes in 0 sec


Printing the BDD for f AFTER: ptr to the nodes, T & E children

: 4 nodes 1 leaves 2 minterms
ID =  0x7b5a4	index = 0	T = 0x7b59e	E = !1        
ID =  0x7b59e	index = 1	T = 1        	E =  0x7b59d
ID =  0x7b59d	index = 3	T = 1        	E =  1        

Map_Node = F6B3C0, Encoding = 3, Shifted Encoding = 3
BDD reordering with sifting: from 14 to ... 14 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = F6B3C0, Encoding = 1, Shifted Encoding = 1
Map node else child before assignment is: F6B3A0
Map node else child after assignment is: F6B0A0
BDD reordering with sifting: from 14 to ... 14 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 3 nodes 1 leaves 2 minterms
ID =  0x7b5a4	index = 0	T = 0x7b59e	E = !1        
ID =  0x7b59e	index = 1	T = 1        	E =  1        

Root node: F6B480
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Map_Node = F6B3C0, Encoding = 3, Shifted Encoding = 1
BDD reordering with sifting: from 14 to ... 14 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = F6B3C0, Encoding = 1, Shifted Encoding = 0
Map node else child before assignment is: F6B0A0
Map node else child after assignment is: F6B0A1
BDD reordering with sifting: from 14 to ... 14 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 3 nodes 1 leaves 1 minterms
ID =  0x7b5a4	index = 0	T = 0x7b59e	E = !1        
ID =  0x7b59e	index = 1	T = 1        	E = !1        

Root node: F6B480
filename: ash_curt_files/hw5_1.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: s27.bench
End of main


