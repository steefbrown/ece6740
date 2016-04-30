# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -second ./nanotrav/miniSecond.blif ./nanotrav/miniFirst.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 4



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 7 nodes 1 leaves 3 minterms
ID =  0xffd18	index = 0	T = 0xffd12	E =  0xffd17
ID =  0xffd17	index = 1	T = 0xffd0a	E = !1        
ID =  0xffd0a	index = 2	T = 0xffd07	E = !1        
ID =  0xffd07	index = 3	T = 1        	E = !1        
ID =  0xffd12	index = 1	T = 0xffd06	E = !1        
ID =  0xffd06	index = 2	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0x1FFA300 

Number of nodes: 7 

Number of levels: 4 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Node: 1FFA000 
Node index: 2147483647 
i: 2147483647 

Node: 1FFA0C0 
Node index: 2 
i: 2 

Node: 1FFA240 
Node index: 1 
i: 1 

Node: 1FFA0E0 
Node index: 3 
i: 3 

Node: 1FFA140 
Node index: 2 
i: 2 

Node: 1FFA2E0 
Node index: 1 
i: 1 

Node: 1FFA300 
Node index: 0 
i: 0 




 T node value: 1FFA0C0
number edges: 0 
E node value: 1FFA001
number edges: 1 



 T node value: 1FFA140
number edges: 1 
E node value: 1FFA001
number edges: 2 



 T node value: 1FFA240
number edges: 2 
E node value: 1FFA2E0
number edges: 2 
Node: 1FFA000 
Node index: 2147483647 
i: 2147483647 

Node: 1FFA0C0 
Node index: 2 
i: 2 

Node: 1FFA240 
Node index: 1 
i: 1 

Node: 1FFA0E0 
Node index: 3 
i: 3 

Node: 1FFA140 
Node index: 2 
i: 2 

Node: 1FFA2E0 
Node index: 1 
i: 1 

Node: 1FFA300 
Node index: 0 
i: 0 




 T node value: 1FFA0C0
number edges: 0 
E node value: 1FFA001
number edges: 1 



 T node value: 1FFA140
number edges: 1 
E node value: 1FFA001
number edges: 2 



 T node value: 1FFA240
number edges: 2 
E node value: 1FFA2E0
number edges: 2 



 T node value: 1FFA000
number edges: 2 
E node value: 1FFA001
number edges: 3 



 T node value: 1FFA0C0
number edges: 3 
E node value: 1FFA001
number edges: 4 



 T node value: 1FFA0E0
number edges: 4 
E node value: 1FFA001
number edges: 5 



 T node value: 1FFA140
number edges: 5 
E node value: 1FFA001
number edges: 6 



 T node value: 1FFA240
number edges: 6 
E node value: 1FFA2E0
number edges: 6 
Cut Level: 3

Number of Sigma Zero Edges = 6
i: 2147483647 
i: 2 
i: 1 
i: 3 
i: 2 
i: 1 
i: 0 
boundsetSize: 5
n: 2
Bound Set: 1FFA240, 1FFA2E0, 1FFA300, 1FFA0C0, 1FFA240,
Free Set: 1FFA000, 1FFA0C0,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

Entering for loop. i = 0
Node is in freeset. j = 1
Node was redirected to one node.
Entering for loop. i = 1
Entering for loop. i = 2
Entering for loop. i = 3
Node is in freeset. j = 0
Node was redirected to one node.
Entering for loop. i = 4
Node is in freeset. j = 0
Node was redirected to one node.
BDD reordering with sifting: from 7 to ... 6 nodes in 0 sec


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

Node: 2010560 
Node index: 2147483647 
i: 2147483647 

Node: 2010620 
Node index: 2 
i: 2 

Node: 20107A0 
Node index: 1 
i: 1 

Node: 2010640 
Node index: 3 
i: 3 

Node: 20106A0 
Node index: 2 
i: 2 

Node: 2010840 
Node index: 1 
i: 1 

Node: 2010860 
Node index: 0 
i: 0 

Node: 20197C0 
Node index: 2147483647 
i: 2147483647 

Node: 2019880 
Node index: 2 
i: 2 

Node: 2019A00 
Node index: 1 
i: 1 

Node: 20198A0 
Node index: 3 
i: 3 

Node: 2019900 
Node index: 2 
i: 2 

Node: 2019AA0 
Node index: 1 
i: 1 

Node: 2019AC0 
Node index: 0 
i: 0 

boundsetSize = 5
Freeset Size = 2
One node is: 2010560
Freeset[0] is: 1FFA000
Freeset[1] is: 1FFA0C0
Entering for boundset loop. i = 0, node = 20197C0
Entering next loop. j = 0, node = 20197C0
Node is in freeset. j = 0, node = 20197C0
Node was added to bset_cutset.
Node was added to cutset.
Already in boundset loop. i = 0, node = 20197C1
Entering for boundset loop. i = 1, node = 2019880
Entering next loop. j = 0, node = 2019880
Entering next loop. j = 1, node = 2019880
Already in boundset loop. i = 1, node = 20197C1
Entering for boundset loop. i = 2, node = 20198A0
Entering next loop. j = 0, node = 20198A0
Entering next loop. j = 1, node = 20198A0
Node is in freeset. j = 1, node = 20198A0
Node was added to bset_cutset.
Node was added to cutset.
Already in boundset loop. i = 2, node = 20197C1
Entering for boundset loop. i = 3, node = 2019900
Entering next loop. j = 0, node = 2019900
Entering next loop. j = 1, node = 2019900
Already in boundset loop. i = 3, node = 20197C1
Entering for boundset loop. i = 4, node = 2019A00
Entering next loop. j = 0, node = 2019A00
Entering next loop. j = 1, node = 2019A00
Already in boundset loop. i = 4, node = 2019AA0
cvar = 2

Cutset node[0] = 20197C0
Cutset node[1] = 20198A0
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

Our boundset nodes: 2019880 2019900
Our cutset nodes: 20197C0 20198A0
Added 2019880 to our mapping, then child: 20197C0, else child: 20197C1
Added 20197C0's encoding 3
Added 20197C1's encoding 2
Added 2019900 to our mapping, then child: 20198A0, else child: 20197C1
Added 20198A0's encoding 1
Added 20197C1's encoding 2
One Node = 20197C0, Zero Node = 20197C1

*********Mapping**********
Mapping node = 2019880, Mapping E_Enc = 2, Mapping T_Enc = 3
Mapping node = 2019900, Mapping E_Enc = 2, Mapping T_Enc = 1

*********End of Mapping**********
Map_Node = 2019880, Encoding = 3, Shifted Encoding = 3
BDD reordering with sifting: from 7 to ... 5 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 2019880, Encoding = 2, Shifted Encoding = 2
BDD reordering with sifting: from 5 to ... 5 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 5 nodes 1 leaves 3 minterms
ID =  0x100cd6	index = 2	T = 0x100cd0	E = !1        
ID =  0x100cd0	index = 1	T = 0x100cc6	E = !1        
ID =  0x100cc6	index = 0	T = 1        	E =  0x100cc5
ID =  0x100cc5	index = 3	T = 1        	E = !1        

Map_Node = 2019900, Encoding = 1, Shifted Encoding = 1
BDD reordering with sifting: from 5 to ... 5 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 2019900, Encoding = 2, Shifted Encoding = 2
BDD reordering with sifting: from 5 to ... 5 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 4 nodes 1 leaves 2 minterms
ID =  0x100cd6	index = 2	T = 0x100ccb	E = !1        
ID =  0x100ccb	index = 1	T = 0x100cc5	E = !1        
ID =  0x100cc5	index = 3	T = 1        	E = !1        

Root node: 2019AC0
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Map_Node = 2019880, Encoding = 3, Shifted Encoding = 1
BDD reordering with sifting: from 5 to ... 5 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 2019880, Encoding = 2, Shifted Encoding = 1
BDD reordering with sifting: from 5 to ... 5 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 4 nodes 1 leaves 2 minterms
ID =  0x100cd6	index = 2	T = 0x100ccb	E = !1        
ID =  0x100ccb	index = 1	T = 0x100cc5	E = !1        
ID =  0x100cc5	index = 3	T = 1        	E = !1        

Map_Node = 2019900, Encoding = 1, Shifted Encoding = 0
Map node child before assignment is: 20198E0
Map node child after assignment is: 20197C1
BDD reordering with sifting: from 5 to ... 5 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

Map_Node = 2019900, Encoding = 2, Shifted Encoding = 1
BDD reordering with sifting: from 5 to ... 5 nodes in 0 sec


Printing the BDD for f: ptr to the nodes, T & E children

: 4 nodes 1 leaves 6 minterms
ID =  0x100cd6	index = 2	T = 0x100cc9	E = !1        
ID =  0x100cc9	index = 3	T = 1        	E = !0x100cc3
ID =  0x100cc3	index = 1	T = 1        	E = !1        

Root node: 2019AC0
filename: ash_curt_files/hw5_1.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: first
End of main


