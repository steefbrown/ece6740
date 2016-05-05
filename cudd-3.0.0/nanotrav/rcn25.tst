# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -envelope ./nanotrav/rcn25.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 0



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 2 nodes 1 leaves 0.5 minterms
ID =  0x11debd	index = 1	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0x23BD7A0 

Number of nodes: 2 

Number of levels: 2 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Cut Level: 0

Number of Sigma Zero Edges = 0
i: 2147483647 
i: 1 
boundsetSize: 0
n: 2
Bound Set:
Free Set: 0, 0,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

Dumping out the divisor


**************BUILDING QUOTIENT BDD***************

Printing Quotient BLIF
Printing Quotient DOT

End of Bi-Decomposition Method.




Starting Functional Decomposition Method

Node: 2419E20 
Node index: 2147483647 
i: 2147483647 

Node: 2419EC0 
Node index: 1 
i: 1 

Node: 2422EC0 
Node index: 2147483647 
i: 2147483647 

Node: 2422F60 
Node index: 1 
i: 1 

boundsetSize = 0
Freeset Size = 2
One node is: 2419E20
Freeset[0] is: 0
Freeset[1] is: 0
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
One Node = 2422EC0, Zero Node = 2422EC1

*********Mapping**********

*********End of Mapping**********


Printing the BDD for f BEFORE: ptr to the nodes, T & E children

: 2 nodes 1 leaves 0.5 minterms
ID =  0x12117b	index = 1	T = 1        	E = !1        

Freeset node to be removed = 2422EC0
Freeset node to be removed = 2422F60
Removing freeset 
BDD reordering with sifting: from 869 to ... 731 nodes in 0 sec


Printing the BDD for f AFTER: ptr to the nodes, T & E children

: 2 nodes 1 leaves 0.5 minterms
ID =  0x12117b	index = 1	T = 1        	E = !1        

Root node: 2422F60
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: rcn25
End of main


