# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -reordering genetic -drop -closest ./nanotrav/closest.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 3



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 4 nodes 1 leaves 3 minterms
ID =  0x3953b	index = 0	T = 0x39538	E =  0x3953a
ID =  0x3953a	index = 1	T = 0x39538	E = !1        
ID =  0x39538	index = 2	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0x72A760 

Number of nodes: 4 

Number of levels: 3 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Node: 72A640 
Node index: 2147483647 
i: 2147483647 

Node: 72A700 
Node index: 2 
i: 2 

Node: 72A740 
Node index: 1 
i: 1 

Node: 72A760 
Node index: 0 
i: 0 




 T node value: 72A700
number edges: 0 
E node value: 72A641
number edges: 1 



 T node value: 72A700
number edges: 1 
E node value: 72A740
number edges: 1 
Cut Level: 2

Number of Sigma Zero Edges = 1
i: 2147483647 
i: 2 
i: 1 
i: 0 
boundsetSize: 2
n: 2
Bound Set: 72A740, 72A760,
Free Set: 72A640, 72A700,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

Entering for loop. i = 0
Node is in freeset. j = 1
Node was redirected to one node.
Entering for loop. i = 1
Node is in freeset. j = 1
Node was redirected to one node.
BDD reordering with sifting: from 7 to ... 6 nodes in 0 sec


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

Node: 73FB80 
Node index: 2147483647 
i: 2147483647 

Node: 73FC40 
Node index: 2 
i: 2 

Node: 73FC80 
Node index: 1 
i: 1 

Node: 73FCA0 
Node index: 0 
i: 0 

Node: 748DE0 
Node index: 2147483647 
i: 2147483647 

Node: 748EA0 
Node index: 2 
i: 2 

Node: 748EE0 
Node index: 1 
i: 1 

Node: 748F00 
Node index: 0 
i: 0 

boundsetSize = 2
Freeset Size = 2
One node is: 73FB80
Freeset[0] is: 72A640
Freeset[1] is: 72A700
Entering for boundset loop. i = 0, node = 748EA0
Entering next loop. j = 0, node = 748EA0
Entering next loop. j = 1, node = 748EA0
Node is in freeset. j = 1, node = 748EA0
Node was added to bset_cutset.
Node was added to cutset.
Already in boundset loop. i = 0, node = 748DE1
Entering for boundset loop. i = 1, node = 748EA0
Entering next loop. j = 0, node = 748EA0
Entering next loop. j = 1, node = 748EA0
Node is in freeset. j = 1, node = 748EA0
Node was added to bset_cutset.
Already in boundset loop. i = 1, node = 748EE0
cvar = 1

Cutset node[0] = 748EA0
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

Our boundset nodes: 748EE0 748F00
Our cutset nodes: 748EA0
Added 748EE0 to our mapping, then child: 748EA0, else child: 748DE1
Added 748EA0's encoding 0
Added 748DE1's encoding 1
Added 748F00 to our mapping, then child: 748EA0, else child: 748EE0
Added 748EA0's encoding 0
One Node = 748DE0, Zero Node = 748DE1

*********Mapping**********
Mapping node = 748EE0, Mapping E_Enc = 1, Mapping T_Enc = 0
Mapping node = 748F00, Mapping E_Enc = 0, Mapping T_Enc = 0

*********End of Mapping**********
Map_Node = 748EE0, Encoding = 0, Shifted Encoding = 0
Map node child before assignment is: 748EA0
Map node child after assignment is: 748DE1
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 748EE0, Encoding = 1, Shifted Encoding = 1
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 4 nodes 1 leaves 4 minterms
ID =  0x3a478	index = 0	T = 0x3a475	E =  0x3a474
ID =  0x3a474	index = 1	T = 1        	E = !1        
ID =  0x3a475	index = 2	T = 1        	E = !1        

Map_Node = 748F00, Encoding = 0, Shifted Encoding = 0
Map node child before assignment is: 748EA0
Map node child after assignment is: 748DE1
BDD reordering with sifting: from 7 to ... 6 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 748F00, Encoding = 0, Shifted Encoding = 0
BDD reordering with sifting: from 6 to ... 6 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 2 nodes 1 leaves 4 minterms
ID =  0x3a478	index = 0	T = 1        	E = !1        

Root node: 748F00
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Map_Node = 748EE0, Encoding = 0, Shifted Encoding = 0
Map node child before assignment is: 748F20
Map node child after assignment is: 748DE1
BDD reordering with sifting: from 6 to ... 6 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 748EE0, Encoding = 1, Shifted Encoding = 0
BDD reordering with sifting: from 6 to ... 6 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 2 nodes 1 leaves 4 minterms
ID =  0x3a478	index = 0	T = 1        	E = !1        

Map_Node = 748F00, Encoding = 0, Shifted Encoding = 0
Map node child before assignment is: 748DE0
Map node child after assignment is: 748DE1
BDD reordering with sifting: from 6 to ... 6 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 748F00, Encoding = 0, Shifted Encoding = 0
BDD reordering with sifting: from 6 to ... 6 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 2 nodes 1 leaves 4 minterms
ID =  0x3a478	index = 0	T = 1        	E = !1        

Root node: 748F00
filename: ash_curt_files/hw5_1.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: closest
End of main


