# Nanotrav Version #0.12, Release date 2003/12/31
# nanotrav/nanotrav -p 1 -trav -image depend -depend ./nanotrav/s27c.blif
# CUDD Version 3.0.0


**************READING IN NETWORK***************

Number of inputs: 1



**************GENERATING NETWORK BDD***************



Printing the BDD for f: ptr to the nodes, T & E children

: 4 nodes 1 leaves 1.25 minterms
ID =  0x375bc	index = 0	T = 1        	E = !0x375bb
ID =  0x375bb	index = 1	T = 1        	E = !0x375ba
ID =  0x375ba	index = 2	T = 1        	E = !1        



**************COUNTING BDD NODES***************


Top node: 0x6EB780 

Number of nodes: 4 

Number of levels: 3 


**************DETERMINING BOUNDSET AND FREESET NODES***************

Node: 6EB680 
Node index: 2147483647 
i: 2147483647 

Node: 6EB740 
Node index: 2 
i: 2 

Node: 6EB760 
Node index: 1 
i: 1 

Adding node to our bound set*****************************
boundsetSize increments to: 1
Node: 6EB780 
Node index: 0 
i: 0 

Adding node to our bound set*****************************
boundsetSize increments to: 2



 T node value: 6EB680
number edges: 0 
E node value: 6EB741
number edges: 0 



 T node value: 6EB680
number edges: 0 
E node value: 6EB761
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
Free Set: 6EB680, 6EB740, 0, 0,


**************DETERMINING NUMBER OF SIG ZERO EDGES***************



**************BUILDING DIVISOR BDD***************

Dumping out the divisor


**************BUILDING QUOTIENT BDD***************

Printing Quotient BLIF
Printing Quotient DOT

End of Bi-Decomposition Method.




Starting Functional Decomposition Method

Node: 700BC0 
Node index: 2147483647 
i: 2147483647 

Node: 700C80 
Node index: 2 
i: 2 

Node: 700CA0 
Node index: 1 
i: 1 

Node: 700CC0 
Node index: 0 
i: 0 

Node: 709E20 
Node index: 2147483647 
i: 2147483647 

Node: 709EE0 
Node index: 2 
i: 2 

Node: 709F00 
Node index: 1 
i: 1 

Node: 709F20 
Node index: 0 
i: 0 

boundsetSize = 0
Freeset Size = 4
One node is: 700BC0
Freeset[0] is: 6EB680
Freeset[1] is: 6EB740
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
One Node = 709E20, Zero Node = 709E21

*********Mapping**********

*********End of Mapping**********


Printing the BDD for f BEFORE: ptr to the nodes, T & E children

: 4 nodes 1 leaves 1.25 minterms
ID =  0x384f9	index = 0	T = 1        	E = !0x384f8
ID =  0x384f8	index = 1	T = 1        	E = !0x384f7
ID =  0x384f7	index = 2	T = 1        	E = !1        

Freeset node to be removed = 709E20
Freeset node to be removed = 709EE0
Removing freeset 
Freeset node to be removed = 709F00
Removing freeset 
Freeset node to be removed = 709F20
Removing freeset 
BDD reordering with sifting: from 4 to ... 4 nodes in 0 sec


Printing the BDD for f AFTER: ptr to the nodes, T & E children

: 4 nodes 1 leaves 1 minterms
ID =  0x384f9	index = 0	T = 0x384f8	E = !0x384f8
ID =  0x384f8	index = 1	T = 0x384f7	E = !0x384f7
ID =  0x384f7	index = 2	T = 1        	E = !1        

Root node: 709F20
filename: ash_curt_files/hw5_0.blif
Creating blif...
Optimizing variable ordering...
Estimated delay: 0.5us...
Net name: s27c.bench
End of main


