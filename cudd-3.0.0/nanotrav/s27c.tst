# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -trav -image depend -depend ./nanotrav/s27c.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 2



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 4 nodes 1 leaves 1.5 minterms
ID = !0x7c73c	index = 0	T = 1        	E = !0x7c73b
ID =  0x7c73b	index = 1	T = 1        	E = !0x7c73a
ID =  0x7c73a	index = 2	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0xF8E781 

Number of nodes: 4 

Number of levels: 3 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Node: F8E680 
Node index: 2147483647 
i: 2147483647 

Node: F8E740 
Node index: 2 
i: 2 

Node: F8E760 
Node index: 1 
i: 1 

Node: F8E780 
Node index: 0 
i: 0 




 T node value: F8E680
number edges: 0 
E node value: F8E741
number edges: 0 



 T node value: F8E680
number edges: 0 
E node value: F8E761
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
Free Set: F8E680, F8E740, 0, 0,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

BDD reordering with sifting: from 4 to ... 4 nodes in 0 sec


**************BUILDING QUOTIENT BDD***************

Printing Quotient BLIF
Printing Quotient DOT

End of Bi-Decomposition Method.




Starting Functional Decomposition Method

Node: FA3BC0 
Node index: 2147483647 
i: 2147483647 

Node: FA3C80 
Node index: 2 
i: 2 

Node: FA3CA0 
Node index: 1 
i: 1 

Node: FA3CC0 
Node index: 0 
i: 0 

Node: FACE20 
Node index: 2147483647 
i: 2147483647 

Node: FACEE0 
Node index: 2 
i: 2 

Node: FACF00 
Node index: 1 
i: 1 

Node: FACF20 
Node index: 0 
i: 0 

boundsetSize = 0
Freeset Size = 4
One node is: FA3BC0
Freeset[0] is: F8E680
Freeset[1] is: F8E740
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
One Node = FACE20, Zero Node = FACE21

*********Mapping**********

*********End of Mapping**********
Root node: FACF21
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: s27c.bench
End of main


