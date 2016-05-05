# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -trav -image part -autodyn -automethod sifting -drop -scc -shortpaths bellman ./nanotrav/s382.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 1



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 2 nodes 1 leaves 1 minterms
ID =  0xaf25f	index = 9	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0x15E4BE0 

Number of nodes: 2 

Number of levels: 10 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Node: 15E4A40 
Node index: 2147483647 
i: 2147483647 

Node: 15E4BE0 
Node index: 9 
i: 9 

Node: 15E4A40 
Node index: 2147483647 
i: 2147483647 

Node: 15E4BE0 
Node index: 9 
i: 9 

Node: 15E4A40 
Node index: 2147483647 
i: 2147483647 

Node: 15E4BE0 
Node index: 9 
i: 9 

Node: 15E4A40 
Node index: 2147483647 
i: 2147483647 

Node: 15E4BE0 
Node index: 9 
i: 9 

Node: 15E4A40 
Node index: 2147483647 
i: 2147483647 

Node: 15E4BE0 
Node index: 9 
i: 9 

Node: 15E4A40 
Node index: 2147483647 
i: 2147483647 

Node: 15E4BE0 
Node index: 9 
i: 9 

Node: 15E4A40 
Node index: 2147483647 
i: 2147483647 

Node: 15E4BE0 
Node index: 9 
i: 9 

Node: 15E4A40 
Node index: 2147483647 
i: 2147483647 

Node: 15E4BE0 
Node index: 9 
i: 9 

Cut Level: 0

Number of Sigma Zero Edges = 0
i: 2147483647 
i: 9 
boundsetSize: 0
n: 2
Bound Set:
Free Set: 15E4A40, 15E4BE0,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

Dumping out the divisor


**************BUILDING QUOTIENT BDD***************

Printing Quotient BLIF
Printing Quotient DOT

End of Bi-Decomposition Method.




Starting Functional Decomposition Method

Node: 16101A0 
Node index: 2147483647 
i: 2147483647 

Node: 1610340 
Node index: 9 
i: 9 

Node: 1619240 
Node index: 2147483647 
i: 2147483647 

Node: 16193E0 
Node index: 9 
i: 9 

boundsetSize = 0
Freeset Size = 2
One node is: 16101A0
Freeset[0] is: 15E4A40
Freeset[1] is: 15E4BE0
cvar = 0

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
temp_cvar = 0
number of bits = 1

Our boundset nodes:
Our cutset nodes:
One Node = 1619240, Zero Node = 1619241

*********Mapping**********

*********End of Mapping**********


Printing the BDD for f BEFORE: ptr to the nodes, T & E children

: 2 nodes 1 leaves 1 minterms
ID =  0xb0c9f	index = 9	T = 1        	E = !1        

Freeset node to be removed = 1619240
Freeset node to be removed = 16193E0
Removing freeset 
BDD reordering with sifting: from 168 to ... 121 nodes in 0.01 sec


Printing the BDD for f AFTER: ptr to the nodes, T & E children

: 2 nodes 1 leaves 1 minterms
ID =  0xb0c9f	index = 9	T = 1        	E = !1        

Root node: 16193E0
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: s382.bench
End of main


