# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -trav -image part -autodyn -automethod sifting -drop -scc -shortpaths bellman ./nanotrav/s382.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 1



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 2 nodes 1 leaves 1 minterms
ID =  0x1317e0	index = 10	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0x262FC00 

Number of nodes: 2 

Number of levels: 11 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Node: 262FA40 
Node index: 2147483647 
i: 2147483647 

Node: 262FC00 
Node index: 10 
i: 10 

Node: 262FA40 
Node index: 2147483647 
i: 2147483647 

Node: 262FC00 
Node index: 10 
i: 10 

Node: 262FA40 
Node index: 2147483647 
i: 2147483647 

Node: 262FC00 
Node index: 10 
i: 10 

Node: 262FA40 
Node index: 2147483647 
i: 2147483647 

Node: 262FC00 
Node index: 10 
i: 10 

Node: 262FA40 
Node index: 2147483647 
i: 2147483647 

Node: 262FC00 
Node index: 10 
i: 10 

Node: 262FA40 
Node index: 2147483647 
i: 2147483647 

Node: 262FC00 
Node index: 10 
i: 10 

Node: 262FA40 
Node index: 2147483647 
i: 2147483647 

Node: 262FC00 
Node index: 10 
i: 10 

Node: 262FA40 
Node index: 2147483647 
i: 2147483647 

Node: 262FC00 
Node index: 10 
i: 10 

Node: 262FA40 
Node index: 2147483647 
i: 2147483647 

Node: 262FC00 
Node index: 10 
i: 10 

Cut Level: 0

Number of Sigma Zero Edges = 0
i: 2147483647 
i: 10 
boundsetSize: 0
n: 2
Bound Set:
Free Set: 262FA40, 262FC00,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

BDD reordering with sifting: from 168 to ... 121 nodes in 0 sec


**************BUILDING QUOTIENT BDD***************

Printing Quotient BLIF
Printing Quotient DOT

End of Bi-Decomposition Method.




Starting Functional Decomposition Method

Node: 265B1A0 
Node index: 2147483647 
i: 2147483647 

Node: 265B360 
Node index: 10 
i: 10 

Node: 2664240 
Node index: 2147483647 
i: 2147483647 

Node: 2664400 
Node index: 10 
i: 10 

boundsetSize = 0
Freeset Size = 2
One node is: 265B1A0
Freeset[0] is: 262FA40
Freeset[1] is: 262FC00
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
One Node = 2664240, Zero Node = 2664241

*********Mapping**********

*********End of Mapping**********
Root node: 2664400
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: s382.bench
End of main


