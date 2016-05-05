# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -reordering genetic -drop -closest ./nanotrav/closest.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 3



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 4 nodes 1 leaves 1 minterms
ID = !0x4a6be	index = 0	T = 1        	E =  0x4a6bd
ID =  0x4a6bd	index = 1	T = 1        	E =  0x4a6b8
ID =  0x4a6b8	index = 2	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0x94D7C1 

Number of nodes: 4 

Number of levels: 3 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Node: 94D640 
Node index: 2147483647 
i: 2147483647 

Node: 94D700 
Node index: 2 
i: 2 

Node: 94D7A0 
Node index: 1 
i: 1 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: 94D7C0 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 2



 T node value: 94D640
number edges: 0 
E node value: 94D700
number edges: 0 



 T node value: 94D640
number edges: 0 
E node value: 94D7A0
number edges: 0 
Cut Level: 0

Number of Sigma Zero Edges = 0
i: 2147483647 
i: 2 
i: 1 
i: 0 
boundsetSize: 0
n: 4
Bound Set:
Free Set: 94D640, 94D700, 0, 0,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

Dumping out the divisor


**************BUILDING QUOTIENT BDD***************

Printing Quotient BLIF
Printing Quotient DOT

End of Bi-Decomposition Method.




Starting Functional Decomposition Method

Node: 962B80 
Node index: 2147483647 
i: 2147483647 

Node: 962C40 
Node index: 2 
i: 2 

Node: 962CE0 
Node index: 1 
i: 1 

Node: 962D00 
Node index: 0 
i: 0 

Node: 96BDE0 
Node index: 2147483647 
i: 2147483647 

Node: 96BEA0 
Node index: 2 
i: 2 

Node: 96BF40 
Node index: 1 
i: 1 

Node: 96BF60 
Node index: 0 
i: 0 

boundsetSize = 0
Freeset Size = 4
One node is: 962B80
Freeset[0] is: 94D640
Freeset[1] is: 94D700
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
One Node = 96BDE0, Zero Node = 96BDE1

*********Mapping**********

*********End of Mapping**********


Printing the BDD for f BEFORE: ptr to the nodes, T & E children

: 4 nodes 1 leaves 1 minterms
ID = !0x4b5fb	index = 0	T = 1        	E =  0x4b5fa
ID =  0x4b5fa	index = 1	T = 1        	E =  0x4b5f5
ID =  0x4b5f5	index = 2	T = 1        	E = !1        

Freeset node to be removed = 96BDE0
Freeset node to be removed = 96BEA0
Removing freeset 
Freeset node to be removed = 96BF40
Removing freeset 
Freeset node to be removed = 96BF60
Removing freeset 
BDD reordering with sifting: from 7 to ... 7 nodes in 0 sec


Printing the BDD for f AFTER: ptr to the nodes, T & E children

: 4 nodes 1 leaves 4 minterms
ID = !0x4b5fb	index = 0	T = 0x4b5fa	E =  0x4b5fa
ID =  0x4b5fa	index = 1	T = 0x4b5f5	E =  0x4b5f5
ID =  0x4b5f5	index = 2	T = 1        	E = !1        

Root node: 96BF61
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: closest
End of main


