# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -cover ./nanotrav/C17.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 2



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 7 nodes 1 leaves 2.25 minterms
ID = !0xc11d0	index = 1	T = 0xc11ca	E =  0xc11cf
ID =  0xc11cf	index = 2	T = 0xc11ce	E = !0xc11c8
ID =  0xc11c8	index = 4	T = 1        	E = !1        
ID =  0xc11ce	index = 3	T = 1        	E = !0xc11c8
ID =  0xc11ca	index = 2	T = 0xc11c7	E = !1        
ID =  0xc11c7	index = 3	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0x1823A01 

Number of nodes: 7 

Number of levels: 5 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Node: 1823800 
Node index: 2147483647 
i: 2147483647 

Node: 18238E0 
Node index: 3 
i: 3 

Node: 1823940 
Node index: 2 
i: 2 

Node: 1823900 
Node index: 4 
i: 4 

Node: 18239C0 
Node index: 3 
i: 3 

Node: 18239E0 
Node index: 2 
i: 2 

Node: 1823A00 
Node index: 1 
i: 1 

Adding node to our bound set*****************************
boundsetSize increments to: 1



 T node value: 1823940
number edges: 0 
E node value: 18239E0
number edges: 0 
Node: 1823800 
Node index: 2147483647 
i: 2147483647 

Node: 18238E0 
Node index: 3 
i: 3 

Node: 1823940 
Node index: 2 
i: 2 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: 1823900 
Node index: 4 
i: 4 

Node: 18239C0 
Node index: 3 
i: 3 

Node: 18239E0 
Node index: 2 
i: 2 

Adding node to our bound set*****************************
boundsetSize increments to: 2
Node: 1823A00 
Node index: 1 
i: 1 

Adding node to our bound set*****************************
boundsetSize increments to: 3



 T node value: 18238E0
number edges: 0 
E node value: 1823801
number edges: 1 



 T node value: 18239C0
number edges: 1 
E node value: 1823901
number edges: 1 



 T node value: 1823940
number edges: 1 
E node value: 18239E0
number edges: 1 
Node: 1823800 
Node index: 2147483647 
i: 2147483647 

Node: 18238E0 
Node index: 3 
i: 3 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: 1823940 
Node index: 2 
i: 2 

Adding node to our bound set*****************************
boundsetSize increments to: 2
Node: 1823900 
Node index: 4 
i: 4 

Node: 18239C0 
Node index: 3 
i: 3 

Adding node to our bound set*****************************
boundsetSize increments to: 3
Node: 18239E0 
Node index: 2 
i: 2 

Adding node to our bound set*****************************
boundsetSize increments to: 4
Node: 1823A00 
Node index: 1 
i: 1 

Adding node to our bound set*****************************
boundsetSize increments to: 5



 T node value: 1823800
number edges: 0 
E node value: 1823801
number edges: 1 



 T node value: 18238E0
number edges: 1 
E node value: 1823801
number edges: 2 



 T node value: 1823800
number edges: 2 
E node value: 1823901
number edges: 2 



 T node value: 18239C0
number edges: 2 
E node value: 1823901
number edges: 2 



 T node value: 1823940
number edges: 2 
E node value: 18239E0
number edges: 2 
Cut Level: 4

Number of Sigma Zero Edges = 2
i: 2147483647 
i: 3 
boundsetSize increments to: 1
i: 2 
boundsetSize increments to: 2
i: 4 
i: 3 
boundsetSize increments to: 3
i: 2 
boundsetSize increments to: 4
i: 1 
boundsetSize increments to: 5
boundsetSize: 5
n: 2
Bound Set: 18238E0, 1823940, 18239C0, 18239E0, 1823A00,
Free Set: 1823800, 1823900,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

Entering for loop. i = 0
Node is in freeset. j = 0
Node was redirected to one node.
Before Reduce Heap
BDD reordering with sifting: from 11 to ... 9 nodes in 0 sec
After Reduce Heap
BDD reordering with sifting: from 9 to ... 7 nodes in 0 sec
Entering for loop. i = 1
Before Reduce Heap
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec
After Reduce Heap
Node is in freeset else child. j = 0
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec
Entering for loop. i = 2
Node is in freeset. j = 0
Node was redirected to one node.
Before Reduce Heap
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec
After Reduce Heap
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec
Entering for loop. i = 3
Before Reduce Heap
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec
After Reduce Heap
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec
Entering for loop. i = 4
Before Reduce Heap
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec
After Reduce Heap
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec
Dumping out the divisor


**************BUILDING QUOTIENT BDD***************

Entering for QUOTIENT loop. i = 0
Quotient T child fine.
Quotient E child fine.
Entering for QUOTIENT loop. i = 1
Quotient T child fine.
Quotient E child fine.
Entering for QUOTIENT loop. i = 2
Quotient T child fine.
Quotient E child fine.
Entering for QUOTIENT loop. i = 3
Quotient T child fine.
Quotient E child fine.
Entering for QUOTIENT loop. i = 4
Quotient T child fine.
Quotient E child fine.
Printing Quotient BLIF
Printing Quotient DOT

End of Bi-Decomposition Method.




Starting Functional Decomposition Method

Node: 183AD80 
Node index: 2147483647 
i: 2147483647 

Node: 183AE60 
Node index: 3 
i: 3 

Node: 183AEC0 
Node index: 2 
i: 2 

Node: 183AE80 
Node index: 4 
i: 4 

Node: 183AF40 
Node index: 3 
i: 3 

Node: 183AF60 
Node index: 2 
i: 2 

Node: 183AF80 
Node index: 1 
i: 1 

Node: 1843FE0 
Node index: 2147483647 
i: 2147483647 

Node: 18440C0 
Node index: 3 
i: 3 

Node: 1844120 
Node index: 2 
i: 2 

Node: 18440E0 
Node index: 4 
i: 4 

Node: 18441A0 
Node index: 3 
i: 3 

Node: 18441C0 
Node index: 2 
i: 2 

Node: 18441E0 
Node index: 1 
i: 1 

boundsetSize = 5
Freeset Size = 2
One node is: 183AD80
Freeset[0] is: 1823800
Freeset[1] is: 1823900
Entering for boundset loop. i = 0, node = 1843FE0
Entering next loop. j = 0, node = 1843FE0
Node is in freeset. j = 0, node = 1843FE0
Node was added to bset_cutset.
Node was added to cutset.
Already in boundset loop. i = 0, node = 1843FE1
Entering for boundset loop. i = 1, node = 18440C0
Entering next loop. j = 0, node = 18440C0
Entering next loop. j = 1, node = 18440C0
Already in boundset loop. i = 1, node = 1843FE1
Entering for boundset loop. i = 2, node = 1843FE0
Entering next loop. j = 0, node = 1843FE0
Node is in freeset. j = 0, node = 1843FE0
Node was added to bset_cutset.
Already in boundset loop. i = 2, node = 18440E1
Entering for boundset loop. i = 3, node = 18441A0
Entering next loop. j = 0, node = 18441A0
Entering next loop. j = 1, node = 18441A0
Already in boundset loop. i = 3, node = 18440E1
Entering for boundset loop. i = 4, node = 1844120
Entering next loop. j = 0, node = 1844120
Entering next loop. j = 1, node = 1844120
Already in boundset loop. i = 4, node = 18441C0
cvar = 1

Cutset node[0] = 1843FE0
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

Our boundset nodes: 18440C0 18441A0
Our cutset nodes: 1843FE0
Added 18440C0 to our mapping, then child: 1843FE0, else child: 1843FE1
Added 1843FE0's encoding 2
Added 1843FE1's encoding 1
Added 18441A0 to our mapping, then child: 1843FE0, else child: 18440E1
Added 1843FE0's encoding 2
One Node = 1843FE0, Zero Node = 1843FE1

*********Mapping**********
Mapping node = 18440C0, Mapping E_Enc = 1, Mapping T_Enc = 2
Mapping node = 18441A0, Mapping E_Enc = 0, Mapping T_Enc = 2

*********End of Mapping**********


Printing the BDD for f BEFORE: ptr to the nodes, T & E children

: 7 nodes 1 leaves 2.25 minterms
ID = !0xc220f	index = 1	T = 0xc2209	E =  0xc220e
ID =  0xc220e	index = 2	T = 0xc220d	E = !0xc2207
ID =  0xc2207	index = 4	T = 1        	E = !1        
ID =  0xc220d	index = 3	T = 1        	E = !0xc2207
ID =  0xc2209	index = 2	T = 0xc2206	E = !1        
ID =  0xc2206	index = 3	T = 1        	E = !1        

Freeset node to be removed = 1843FE0
Freeset node to be removed = 18440E0
Removing freeset 
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f AFTER: ptr to the nodes, T & E children

: 7 nodes 1 leaves 2.25 minterms
ID = !0xc220f	index = 1	T = 0xc2209	E =  0xc220e
ID =  0xc220e	index = 2	T = 0xc220d	E = !0xc2207
ID =  0xc2207	index = 4	T = 1        	E = !1        
ID =  0xc220d	index = 3	T = 1        	E = !0xc2207
ID =  0xc2209	index = 2	T = 0xc2206	E = !1        
ID =  0xc2206	index = 3	T = 1        	E = !1        

Map_Node = 18440C0, Encoding = 2, Shifted Encoding = 2
Map node then child before assignment is: 1843FE0
Map node then child after assignment is: 1843FE1
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 18440C0, Encoding = 1, Shifted Encoding = 1
Map node else child before assignment is: 1843FE1
Map node else child after assignment is: 1843FE0
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 7 nodes 1 leaves 1.75 minterms
ID = !0xc220f	index = 1	T = 0xc2209	E =  0xc220e
ID =  0xc220e	index = 2	T = 0xc220d	E = !0xc2207
ID =  0xc2207	index = 4	T = 1        	E = !1        
ID =  0xc220d	index = 3	T = 1        	E = !0xc2207
ID =  0xc2209	index = 2	T = 0xc2206	E = !1        
ID =  0xc2206	index = 3	T = 1        	E =  1        

Map_Node = 18441A0, Encoding = 2, Shifted Encoding = 2
Map node then child before assignment is: 1843FE0
Map node then child after assignment is: 1843FE1
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 18441A0, Encoding = 0, Shifted Encoding = 0
Map node else child before assignment is: 18440E1
Map node else child after assignment is: 1843FE1
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 7 nodes 1 leaves 2 minterms
ID = !0xc220f	index = 1	T = 0xc2209	E =  0xc220e
ID =  0xc220e	index = 2	T = 0xc220d	E = !0xc2207
ID =  0xc2207	index = 4	T = 1        	E = !1        
ID =  0xc220d	index = 3	T = 1        	E = !1        
ID =  0xc2209	index = 2	T = 0xc2206	E = !1        
ID =  0xc2206	index = 3	T = 1        	E =  1        

Root node: 18441E1
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Map_Node = 18440C0, Encoding = 2, Shifted Encoding = 1
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 18440C0, Encoding = 1, Shifted Encoding = 0
Map node else child before assignment is: 1843FE0
Map node else child after assignment is: 1843FE1
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 7 nodes 1 leaves 2.5 minterms
ID = !0xc220f	index = 1	T = 0xc2209	E =  0xc220e
ID =  0xc220e	index = 2	T = 0xc220d	E = !0xc2207
ID =  0xc2207	index = 4	T = 1        	E = !1        
ID =  0xc220d	index = 3	T = 1        	E = !1        
ID =  0xc2209	index = 2	T = 0xc2206	E = !1        
ID =  0xc2206	index = 3	T = 1        	E = !1        

Map_Node = 18441A0, Encoding = 2, Shifted Encoding = 1
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 18441A0, Encoding = 0, Shifted Encoding = 0
Map node else child before assignment is: 1843FE1
Map node else child after assignment is: 1843FE1
BDD reordering with sifting: from 11 to ... 11 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 7 nodes 1 leaves 2.5 minterms
ID = !0xc220f	index = 1	T = 0xc2209	E =  0xc220e
ID =  0xc220e	index = 2	T = 0xc220d	E = !0xc2207
ID =  0xc2207	index = 4	T = 1        	E = !1        
ID =  0xc220d	index = 3	T = 1        	E = !1        
ID =  0xc2209	index = 2	T = 0xc2206	E = !1        
ID =  0xc2206	index = 3	T = 1        	E = !1        

Root node: 18441E1
filename: ash_curt_files/hw5_1.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: C17.iscas
End of main


