/**CFile***********************************************************************

  FileName    [main.c]

  PackageName [ntr]

  Synopsis    [Main program for the nanotrav program.]

  Description []

  SeeAlso     []

  Author      [Fabio Somenzi/Priyank Kalla]

  Copyright   [Copyright (c) 1995-2004, Regents of the University of Colorado

  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:

  Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.

  Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution.

  Neither the name of the University of Colorado nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE.]

******************************************************************************/

#include "ntr.h"
#include "cuddInt.h"

/*---------------------------------------------------------------------------*/
/* Constant declarations                                                     */
/*---------------------------------------------------------------------------*/

#define NTR_VERSION "Nanotrav Version #0.12, Release date 2003/12/31"

#define BUFLENGTH 8192

#define OUTPUT_BDD  1 

/*---------------------------------------------------------------------------*/
/* Stucture declarations                                                     */
/*---------------------------------------------------------------------------*/
typedef struct{
    DdNode *node;
    int     T_encoding;
    int     E_encoding;
} b2cMapping;


/*---------------------------------------------------------------------------*/
/* Type declarations                                                         */
/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
/* Variable declarations                                                     */
/*---------------------------------------------------------------------------*/

#ifndef lint
static char rcsid[] UTIL_UNUSED = "$Id: main.c,v 1.38 2004/08/13 18:28:28 fabio Exp fabio $";
#endif

static  char    buffer[BUFLENGTH];
#ifdef DD_DEBUG
extern  st_table *checkMinterms (BnetNetwork *net, DdManager *dd, st_table *previous);
#endif

/*---------------------------------------------------------------------------*/
/* Macro declarations                                                        */
/*---------------------------------------------------------------------------*/

/**AutomaticStart*************************************************************/

/*---------------------------------------------------------------------------*/
/* Static function prototypes                                                */
/*---------------------------------------------------------------------------*/

static NtrOptions * mainInit ();
static void ntrReadOptions (int argc, char **argv, NtrOptions *option);
static void ntrReadOptionsFile (char *name, char ***argv, int *argc);
static char* readLine (FILE *fp);
static FILE * open_file (char *filename, const char *mode);
static int reorder (BnetNetwork *net, DdManager *dd, NtrOptions *option);
static void freeOption (NtrOptions *option);
static DdManager * startCudd (NtrOptions *option, int nvars);
static int ntrReadTree (DdManager *dd, char *treefile, int nvars);
/**AutomaticEnd***************************************************************/

/*---------------------------------------------------------------------------*/
/* Definition of exported functions                                          */
/*---------------------------------------------------------------------------*/

/**Function********************************************************************

  Synopsis    [Main program for ntr.]

  Description [Main program for ntr. Performs
  initialization. Introduces variables, builds ROBDDs for some
  functions, and prints-out the BDD structure. A sample file given to
  the 5740 class.]

  SideEffects [None]

  SeeAlso     []

******************************************************************************/
int
main(
  int  argc,
  char ** argv)
{
    NtrOptions	    *option;	    /* options */
    FILE            *fp1;           /* first network file pointer */
    BnetNetwork     *net1 = NULL;   /* first network */
    BnetNetwork     *net2 = NULL;   /* second network */
    BnetNetwork     *net_ash = NULL;    /* first network */
    BnetNetwork     *net_curt = NULL;   /* second network */
    DdManager	    *dd, *dd_quo;       /* pointer to DD manager & quotient DD manager*/
    DdManager       *dd_ash, *dd_curt;
    int		        exitval;	    /* return value of Cudd_CheckZeroRef */
    int		        ok;		        /* overall return value from main() */
    int		        result;		    /* stores the return value of functions */
    BnetNode	    *node, *node2;  /* auxiliary pointer to network node */
    BnetNode	    *node_ash, *node_curt;  /* auxiliary pointer to network node */
    int		        i;		        /* loop index */
    int		        j;		        /* loop index */
    double	        *signatures;    /* array of signatures */
    int		        pr;		        /* verbosity level */
    int		        reencoded;	    /* linear transformations attempted */
   
    /* Initialize. */
#if defined(_WIN32) && defined(_TWO_DIGIT_EXPONENT)
    (void) _set_output_format(_TWO_DIGIT_EXPONENT);
#endif
    option = mainInit(); ntrReadOptions(argc,argv,option);
    pr = option->verb;
    reencoded = option->reordering == CUDD_REORDER_LINEAR ||
		option->reordering == CUDD_REORDER_LINEAR_CONVERGE ||
		option->autoMethod == CUDD_REORDER_LINEAR ||
		option->autoMethod == CUDD_REORDER_LINEAR_CONVERGE;
    
    /* Currently traversal requires global BDDs. Override whatever ** was specified for locGlob. */
    if (option->traverse == TRUE || option->envelope == TRUE ||
	option->scc == TRUE) {
	option->locGlob = BNET_GLOBAL_DD;
    }

    printf("\n\n**************READING IN NETWORK***************\n\n");

    /* Read the first network... */
    fp1 = open_file(option->file1, "r");
    net1 = Bnet_ReadNetwork(fp1,pr);
    (void) fclose(fp1);
   
    if (net1 == NULL) {
	(void) fprintf(stderr,"Syntax error in %s.\n",option->file1);
	exit(2);
    }
    
    /* ... and optionally echo it to the standard output. */
    if (pr > 2) {
	Bnet_PrintNetwork(net1);
    }
    
    /* Read the first network again for copy... */ 
    fp1 = open_file(option->file1, "r");
    net2 = Bnet_ReadNetwork(fp1,pr);
    (void) fclose(fp1);
    
    if (net2 == NULL) {
	(void) fprintf(stderr,"Syntax error in %s.\n",option->file1);
	exit(2);
    }
	
    /* ... and optionally echo it to the standard output. */
	if (pr > 2) {
	    Bnet_PrintNetwork(net2);
	}
    
    /* Read the first network again for Ash-Curt decomp... */ 
    fp1 = open_file(option->file1, "r");
    net_ash = Bnet_ReadNetwork(fp1,pr);
    (void) fclose(fp1);
    
    if (net_ash == NULL) {
	(void) fprintf(stderr,"Syntax error in %s.\n",option->file1);
	exit(2);
    }
	
    /* ... and optionally echo it to the standard output. */
	if (pr > 2) {
	    Bnet_PrintNetwork(net_ash);
	}
    
    /* Read the first network again for Ash-Curt decomp... */ 
    fp1 = open_file(option->file1, "r");
    net_curt = Bnet_ReadNetwork(fp1,pr);
    (void) fclose(fp1);
    
    if (net_curt == NULL) {
	(void) fprintf(stderr,"Syntax error in %s.\n",option->file1);
	exit(2);
    }
	
    /* ... and optionally echo it to the standard output. */
	if (pr > 2) {
	    Bnet_PrintNetwork(net_curt);
	}
    
    
    /* Initialize manager. We start with 0 variables, because
    ** Ntr_buildDDs will create new variables rather than using
    ** whatever already exists.
    */
    // DdManager for divisor
    dd = startCudd(option,net1->ninputs);
        if (dd == NULL) { exit(2); }
    // DdManager for quotient
    dd_quo = startCudd(option,net2->ninputs);
        if (dd_quo == NULL) { exit(2); }
 
    /* Build the BDDs for the nodes of the first network. */
    // Divisor
    result = Ntr_buildDDs(net1,dd,option,NULL);
        if (result == 0) { exit(2); }
    // Quotient
    result = Ntr_buildDDs(net2,dd_quo,option,NULL);
        if (result == 0) { exit(2); }
    
    // DdManager for divisor
    dd_ash = startCudd(option,net_ash->ninputs);
        if (dd == NULL) { exit(2); }
    // DdManager for quotient
    dd_curt = startCudd(option,net_curt->ninputs);
        if (dd_quo == NULL) { exit(2); }
 
    /* Build the BDDs for the nodes of the first network. */
    // Divisor
    result = Ntr_buildDDs(net_ash,dd_ash,option,NULL);
        if (result == 0) { exit(2); }
    // Quotient
    result = Ntr_buildDDs(net_curt,dd_curt,option,NULL);
        if (result == 0) { exit(2); }
    
    /*Bnet_PrintNetwork(net1);
    Bnet_PrintOrder(net1,dd);

    Bnet_bddDump(dd,net1,"testout",0,0);
    
    printf("Size of variable array: %d\n", sizeof(dd->vars));
	FILE *fptr;
	fptr = fopen("hw5.dot","w");
    DdNode *test = Cudd_bddIthVar(dd,3);
	DdNode *nodes = net1->nodes->dd; 
	//const char* const in  [3] = {"a","b","c"};
	//const char* const out [1] = {"f"};
	Cudd_DumpDot(dd,1,&test,NULL,NULL,fptr);
	
	fclose(fptr);
    */

    // Extract the output that will be analyzed
    // Divisor
    if (!st_lookup(net1->hash,net1->outputs[OUTPUT_BDD],(void **)&node)) {
        printf("Did not find the node/n");
    }
    // Quotient
    if (!st_lookup(net2->hash,net2->outputs[OUTPUT_BDD],(void **)&node2)) {
        printf("Did not find the node/n");
    }
    // Ash 
    if (!st_lookup(net_ash->hash,net_ash->outputs[OUTPUT_BDD],(void **)&node_ash)) {
        printf("Did not find the node/n");
    }
    // Curt
    if (!st_lookup(net_curt->hash,net_curt->outputs[OUTPUT_BDD],(void **)&node_curt)) {
        printf("Did not find the node/n");
    }

    // Set up arrays to output variable names
    //char *inames1[node->ninp];
    //char *onames1[1] = {node->name};

    printf("Number of inputs: %d\n\n", node->ninp);
/*    for(i = 0; i < node->ninp; i++){
        printf("%d input: %s\n", i, node->inputs[i]);
        inames1[i] = node->inputs[i];
    }
*/    
    printf("\n\n**************GENERATING NETWORK BDD***************\n\n");

    // Create Dot file for the BDD to verify
	FILE *fptr;
	//fptr = fopen("hw5_quo.dot","w");
	//Cudd_DumpDot(dd_quo,1,&node2->dd,node2->inputs,&node2->name,fptr);
    //fclose(fptr);

/*---------------------------------------------------------------------------*/

    /* print BDD structure of f */
	printf("\n\nPrinting the BDD for f: ptr to the nodes, T & E children\n\n");
	Cudd_PrintDebug( dd, node->dd, node->ninp, 3); 
    
    /* Disable automatic dynamic reordering */
    //Cudd_AutodynDisable(dd);
    //Cudd_AutodynDisable(dd_quo);
/*
    printf("Top node: 0x%X \n", node->dd);
    printf("Top node level: %d \n", node->dd->index);
   // printf("Top node ref count: %d \n", node->dd->ref);

    printf("Top T child: 0x%X \n", node->dd->type.kids.T);
    printf("Top T child index: %d \n", node->dd->type.kids.T->index);
    printf("Top E child: 0x%X \n", node->dd->type.kids.E);
    printf("Top E child index: %d \n", node->dd->type.kids.E->index);
    
    printf("TopT T child: 0x%X \n", node->dd->type.kids.T->type.kids.T);
    printf("TopT T child index: %d \n", node->dd->type.kids.T->type.kids.T->index);
    printf("TopT E child: 0x%X \n", node->dd->type.kids.T->type.kids.E);
    printf("TopT E child index: %d \n", node->dd->type.kids.T->type.kids.E->index);
   
    printf("TopE T child: 0x%X \n", node->dd->type.kids.E->type.kids.T);
    printf("TopE T child index: %d \n", node->dd->type.kids.E->type.kids.T->index);
    printf("TopE E child: 0x%X \n", node->dd->type.kids.E->type.kids.E);
    printf("TopE E child index: %d \n", node->dd->type.kids.E->type.kids.E->index);
*/    
    
    printf("\n\n**************COUNTING BDD NODES***************\n\n");
    
    /* Count the number of nodes in the BDD */ 
    int nodeCount = 0;
    int numLevels = 0;
    DdGen *test_gen;
    DdNode *test_node;
    Cudd_ForeachNode(dd,node->dd,test_gen,test_node){
        nodeCount++;
        Cudd_bddBindVar(dd, i);
        //printf("test_node index: %d\n", test_node->index);
        //printf("test_node: %X. dd->one: %X. Comp(dd->one): %X.\n",test_node,dd->one,Cudd_Complement(dd->one)); 
        if((test_node != Cudd_Complement(dd->one)) && (test_node != dd->one)){
            //printf("Not 1/0. test_node index: %d\n", test_node->index);
            if(test_node->index > numLevels)
                numLevels = test_node->index;
        }

       // printf(" Test Node 0x%X \n", test_node);
    }
   
    // Add an additional level to numLevels to account for the constant node
    numLevels++;

    //Traversing the BDD 
    printf("\nTop node: 0x%X \n", node->dd);
    printf("\nNumber of nodes: %d \n", nodeCount);
    printf("\nNumber of levels: %d \n", numLevels);

    printf("\n\n**************DETERMINING BOUNDSET AND FREESET NODES***************\n\n");
    
    DdNode** boundset = calloc(nodeCount, sizeof(DdNode));// = {0,0,0,0,0};
    DdNode** freeset  = calloc(nodeCount, sizeof(DdNode));// = {0,0,0,0,0};
    int cutLevel = 0;
    int cutLevel_temp = 0;
    int boundsetSize = 0;
    int n = 0;
    int sigZeroEdges = 0;
    int sigZeroEdges_temp = 0;
    // Divisor
    /* We start cuts at level 2 since level 0 is the root node
     * and level 1 would trivially be the cofactors of the network.
     * Likewise, we end at numLevels - 2 since cuting before the 
     * constant node does not yield helpful decomposition.
     */
    if (numLevels < 2) { printf("This network has no meaningful decomposition.\n\n"); exit(2); }

    for(cutLevel_temp = 2; cutLevel_temp < numLevels; cutLevel_temp++){
        boundsetSize = 0;
        n = 0;
        Cudd_ForeachNode(dd,node->dd,test_gen,test_node){
            i = test_node->index;
            printf("Node: %X \n", test_node);
            printf("Node index: %d \n", test_node->index);
            printf("i: %d \n\n", i);
            if(i < cutLevel_temp)
            {
                printf("Adding node to our bound set*****************************\n");
                boundset[boundsetSize++] = test_node;
                printf("boundsetSize increments to: %d\n", boundsetSize);
            }
            else
                freeset[n++] = test_node;
        }//end Cudd_ForeachNode
        
        sigZeroEdges_temp = 0;
        // Determine Sigma Zero edges
        for(i = 0; i < boundsetSize; i++){
            test_node = boundset[i];
            
            printf("\n\n\n T node value: %X\n",Cudd_T(test_node));
            if((Cudd_T(test_node) == Cudd_Complement(dd->one)))    
                sigZeroEdges_temp++;// Sigma Zero
            
            printf("number edges: %d \n", sigZeroEdges_temp);
            printf("E node value: %X\n",Cudd_E(test_node));
            
            if((Cudd_E(test_node) == Cudd_Complement(dd->one)))     
                sigZeroEdges_temp++;// Sigma Zero
            
            printf("number edges: %d \n", sigZeroEdges_temp);
        }//end for

        // Deterimine if this cut has more Sigma Zero edges than previously
        if(sigZeroEdges_temp > sigZeroEdges){
            sigZeroEdges = sigZeroEdges_temp;
            cutLevel = cutLevel_temp;
        }

    }//end for

    printf("Cut Level: %d\n", cutLevel);
    printf("\nNumber of Sigma Zero Edges = %d\n",sigZeroEdges_temp);

    
    // Quotient
    DdNode** quo_boundset = calloc(nodeCount, sizeof(DdNode));// = {0,0,0,0,0};
    DdNode** quo_freeset  = calloc(nodeCount, sizeof(DdNode));// = {0,0,0,0,0};
    boundsetSize = 0;
    n = 0;
    Cudd_ForeachNode(dd_quo,node2->dd,test_gen,test_node){
        i = test_node->index;
        printf("i: %d \n", i);
        if(i < cutLevel)
        {
            quo_boundset[boundsetSize++] = test_node;
            printf("boundsetSize increments to: %d\n", boundsetSize);
        }
        else
            quo_freeset[n++] = test_node;
    }
    
    printf("boundsetSize: %d\n", boundsetSize);
    printf("n: %d\n", n);
    printf("Bound Set:");
    for(i = 0; i < boundsetSize; i++)
        printf(" %X,", boundset[i]);
    printf("\n");
    printf("Free Set:");
    for(i = 0; i < n; i++)
        printf(" %X,", freeset[i]);
    printf("\n");

    printf("\n\n**************DETERMINING NUMBER OF SIG ZERO EDGES***************\n\n");
/*    
    int sigZeroEdges = 0;
    // Determine Sigma Zero edges
    for(i = 0; i < boundsetSize; i++){
        test_node = boundset[i];
        
        printf("\n\n\n T node value: %X\n",Cudd_T(test_node));
        if((Cudd_T(test_node) == Cudd_Complement(dd->one)))    
            sigZeroEdges++;// Sigma Zero
        
        printf("number edges: %d \n", sigZeroEdges);
        printf("E node value: %X\n",Cudd_E(test_node));
        
        if((Cudd_E(test_node) == Cudd_Complement(dd->one)))     
            sigZeroEdges++;// Sigma Zero
        
        printf("number edges: %d \n", sigZeroEdges);
    }
*/   
  //  printf("zero node %X \n", dd->zero);
     
  //  printf("one node compliment %X \n", Cudd_Complement(dd->one));


    printf("\n\n**************BUILDING DIVISOR BDD***************\n\n");
    
    /* Create Divisor BDD */
  
    for(i = 0; i < boundsetSize; i++){
       // We only care about the bound set nodes for the divisor
       printf("Entering for loop. i = %d\n", i);
       test_node = Cudd_T(boundset[i]);
       if(test_node != Cudd_Complement(dd->one)){
           for(j = 0; j < n; j++){
                if(test_node == freeset[j]){
                    printf("Node is in freeset. j = %d\n", j);
                    boundset[i]->type.kids.T = dd->one; 
                    printf("Node was redirected to one node.\n");
                    break;
                } 
           }
       }
       printf("Before Reduce Heap\n");
       Cudd_ReduceHeap(dd,CUDD_REORDER_SAME,1);
       printf("After Reduce Heap\n");

       test_node = Cudd_E(boundset[i]);
       if(test_node != Cudd_Complement(dd->one)){
           for(j = 0; j < n; j++){
                if(test_node == freeset[j])
                    {
                        printf("Node is in freeset else child. j = %d\n", j);
                        boundset[i]->type.kids.E = dd->one; break;
                        printf("Node was redirected to one node else child.\n");
                    } 
           }
       }
       Cudd_ReduceHeap(dd,CUDD_REORDER_SAME,1);
    }


    printf("Dumping out the divisor\n");
    
    fptr = fopen("hw5_divisor.blif","w");
    //Cudd_DumpBlif(dd,1,&node->dd,node->inputs,&node->name,NULL,fptr,0);
    Cudd_DumpBlif(dd,1,&node->dd,NULL,NULL,NULL,fptr,0);
    fclose(fptr);
    
    fptr = fopen("hw5_divisor.dot","w");
    //Cudd_DumpDot(dd,1,&node->dd,node->inputs,&node->name,fptr);
    Cudd_DumpDot(dd,1,&node->dd,NULL,NULL,fptr);
    fclose(fptr);
   
    printf("\n\n**************BUILDING QUOTIENT BDD***************\n\n");

    
    /* Build the tree for the Quotient */
    for(i = 0; i < boundsetSize; i++){
       // We only care about the bound set nodes for the divisor
       printf("Entering for QUOTIENT loop. i = %d\n", i);
       test_node = Cudd_T(quo_boundset[i]);
       if(test_node == Cudd_Complement(dd_quo->one)){
            quo_boundset[i]->type.kids.T = quo_boundset[i]->type.kids.E; }
    
       printf("Quotient T child fine.\n");
       test_node = Cudd_E(quo_boundset[i]);
       if(test_node == Cudd_Complement(dd_quo->one)){
            quo_boundset[i]->type.kids.E = quo_boundset[i]->type.kids.T;
       }
       printf("Quotient E child fine.\n");
    }

    // Remove redundant nodes and isomorphic subgraphs
    Cudd_ReduceHeap(dd_quo,CUDD_REORDER_NONE,1);

    printf("Printing Quotient BLIF\n");

    //char *inames2[3] = {"x", "y", "z"};
    //char *onames2[1] = {"G"};
    
    fptr = fopen("hw5_quotient.blif","w");
    //Cudd_DumpBlif(dd_quo,1,&node2->dd,node2->inputs,&node2->name,NULL,fptr,0);
    Cudd_DumpBlif(dd_quo,1,&node2->dd,NULL,NULL,NULL,fptr,0);
    fclose(fptr);

    printf("Printing Quotient DOT\n"); 
    
    fptr = fopen("hw5_quotient.dot","w");
    //Cudd_DumpDot(dd_quo,1,&node2->dd,node2->inputs,&node2->name,fptr);
    Cudd_DumpDot(dd_quo,1,&node2->dd,NULL,NULL,fptr);
    fclose(fptr);
   
    printf("\nEnd of Bi-Decomposition Method.\n\n\n");

    /****************************************************************
     * ASHTENHURST-CURTIS DECOMPOSITION
     ***************************************************************/ 
    printf("\n\nStarting Functional Decomposition Method\n\n");
    
    /* Borrowning the same cut level and boundset/freeset, 
     * this builds the Ashenhurst-Curtis decomposed circuit.
     */

    DdNode** ash_boundset = calloc(nodeCount, sizeof(DdNode));// = {0,0,0,0,0};
    DdNode** ash_freeset  = calloc(nodeCount, sizeof(DdNode));// = {0,0,0,0,0};
    DdNode** curt_boundset = calloc(nodeCount, sizeof(DdNode));// = {0,0,0,0,0};
    DdNode** curt_freeset  = calloc(nodeCount, sizeof(DdNode));// = {0,0,0,0,0};
    
    boundsetSize = 0;
    n = 0;

    // To simplify the implementation, use the same cut level as the 
    // Boolean Bi-decomposition method
    // Create the bound set and the free set for the ash BDD
    Cudd_ForeachNode(dd_ash,node_ash->dd,test_gen,test_node){
        i = test_node->index;
        printf("Node: %X \n", test_node);
        printf("Node index: %d \n", test_node->index);
        printf("i: %d \n\n", i);
        if(i < cutLevel)
            ash_boundset[boundsetSize++] = test_node;
        else
            ash_freeset[n++] = test_node;
    }//end Cudd_ForeachNode
    
    boundsetSize = 0;
    n = 0;
    
    // Create the bound set and the free set for the curt BDD
    Cudd_ForeachNode(dd_curt,node_curt->dd,test_gen,test_node){
        i = test_node->index;
        Cudd_bddBindVar(dd_curt, i);
        printf("Node: %X \n", test_node);
        printf("Node index: %d \n", test_node->index);
        printf("i: %d \n\n", i);
        if(i < cutLevel)
            curt_boundset[boundsetSize++] = test_node;
        else
            curt_freeset[n++] = test_node;
    }//end Cudd_ForeachNode

    DdNode** cutset  = calloc(n, sizeof(DdNode));// = {0,0,0,0,0};
    DdNode** bset_cutset  = calloc(boundsetSize, sizeof(DdNode));// = {0,0,0,0,0};
    int cvar = 0;
    int bcvar = 0;
    int k = 0;
    int flag = 0;

    printf("boundsetSize = %d\n", boundsetSize);
    printf("Freeset Size = %d\n",n);
    printf("One node is: %X\n", dd_ash->one);
    printf("Freeset[0] is: %X\n", freeset[0]);
    printf("Freeset[1] is: %X\n", freeset[1]);

    // count the number of cutset nodes
    for(i = 0; i < boundsetSize; i++){
       // We only care about the bound set nodes for the divisor
       test_node = Cudd_T(curt_boundset[i]);
       printf("Entering for boundset loop. i = %d, node = %X\n", i, test_node);
       for(j = 0; j < n; j++){
       printf("Entering next loop. j = %d, node = %X\n", j, test_node);
            if(test_node == curt_freeset[j]){
                printf("Node is in freeset. j = %d, node = %X\n", j, test_node);
                flag = 0;
                // check not in bset_cutset already
                for(k = 0; k < boundsetSize; k++){
                    if(curt_boundset[i] == bset_cutset[k])
                        {flag = 1; break;}
                }
                // If not in cutset, but in freeset, add to cutset
                if(!flag){
                    bset_cutset[bcvar++] = curt_boundset[i]; 
                    printf("Node was added to bset_cutset.\n");
                }
                flag = 0;
                // check not in cutset already
                for(k = 0; k < n; k++){
                    if(test_node == cutset[k])
                        {flag = 1; break;}
                }
                // If not in cutset, but in freeset, add to cutset
                if(!flag){
                    cutset[cvar++] = test_node; 
                    printf("Node was added to cutset.\n");
                }
                break;
            } 
       }
       
       test_node = Cudd_E(curt_boundset[i]);
       printf("Already in boundset loop. i = %d, node = %X\n", i, test_node);
       for(j = 0; j < n; j++){
            if(test_node == curt_freeset[j]){
                printf("Node is in freeset. j = %d, node = %X\n", j, test_node);
                flag = 0;
                // check not in bset_cutset already
                for(k = 0; k < boundsetSize; k++){
                    if(curt_boundset[i] == bset_cutset[k])
                        {flag = 1; break;}
                }
                // If not in cutset, but in freeset, add to cutset
                if(!flag){
                    bset_cutset[bcvar++] = curt_boundset[i]; 
                    printf("Node was added to bset_cutset.\n");
                }
                flag = 0;
                // check not in cutset already
                for(k = 0; k < n; k++){
                    if(test_node == cutset[k])
                        {flag = 1; break;}
                }
                // If not in cutset, but in freeset, add to cutset
                if(!flag){
                    cutset[cvar++] = test_node; 
                    printf("Node was added to cutset.\n");
                }
                break;
            } 
       }
    }

    printf("cvar = %d\n\n",cvar);

    for(i = 0; i < cvar; i++){
        printf("Cutset node[%d] = %X\n", i,cutset[i]);
    }

    unsigned int temp_cvar = (unsigned int)cvar;
    int bits = 0;
    // Enumerate cutset nodes
    // ceiling(log2(cvar))
    for(i = 0; i < 32; i++){
        printf("temp_cvar = %X\n", temp_cvar);
        if(temp_cvar & 0x1)
        { printf("i = %d\n",i); bits = i ? i : 1;}
        temp_cvar = temp_cvar >> 1;    
    }

    //We have to add another state bit to take care of 1 and 0 redundancy
    bits++;
    printf("number of bits = %d\n\n",bits);
    

    b2cMapping *map = calloc(bcvar, sizeof(b2cMapping));

    printf("Our boundset nodes:");
    for(i = 0; i < bcvar; i++)
        printf(" %X", bset_cutset[i]);
    printf("\n");

    printf("Our cutset nodes:");
    for(i = 0; i < cvar; i++)
        printf(" %X", cutset[i]);
    printf("\n");

    // create mapping from bset_cutset to cutset
    for(i = 0; i < bcvar; i++){
        //Set the root boundset's cutset node
        map[i].node = bset_cutset[i];
        printf("Added %X to our mapping, then child: %X, else child: %X\n", map[i].node, bset_cutset[i]->type.kids.T, bset_cutset[i]->type.kids.E);

        //Find the then child's encoding
        for(j = 0; j < cvar; j++)
        {
            if(bset_cutset[i]->type.kids.T == Cudd_Complement(dd_curt->one))
            {
                map[i].T_encoding = cvar;
                printf("Added %X's encoding %d\n", bset_cutset[i]->type.kids.T, cvar);
                break;
            }
            else if(bset_cutset[i]->type.kids.T == dd_curt->one)
            {
                map[i].T_encoding = cvar + 1;
                printf("Added %X's encoding %d\n", bset_cutset[i]->type.kids.T, cvar+1);
                break;
            }
            else if(cutset[j] == bset_cutset[i]->type.kids.T)
            {
                map[i].T_encoding = j;
                printf("Added %X's encoding %d\n", bset_cutset[i]->type.kids.T, j);
                break;
            }
        }

        //Find the else child's encoding
        for(j = 0; j < cvar; j++)
        {
            if(bset_cutset[i]->type.kids.E == Cudd_Complement(dd_curt->one))
            {
                map[i].E_encoding = cvar;
                printf("Added %X's encoding %d\n", bset_cutset[i]->type.kids.E, cvar);
                break;
            }
            else if(bset_cutset[i]->type.kids.E == dd_curt->one)
            {
                map[i].E_encoding = cvar + 1;
                printf("Added %X's encoding %d\n", bset_cutset[i]->type.kids.E, cvar+1);
                break;
            }
            else if(cutset[j] == bset_cutset[i]->type.kids.E)
            {
                map[i].E_encoding = j;
                printf("Added %X's encoding %d\n", bset_cutset[i]->type.kids.E, j);
                break;
            }
        }
    }    

    //Modify the BDD  
    printf("One Node = %X, Zero Node = %X\n", dd_curt->one, Cudd_Complement(dd_curt->one));
    printf("\n*********Mapping**********\n");
    for(i = 0; i < bcvar; i++)
        printf("Mapping node = %X, Mapping E_Enc = %d, Mapping T_Enc = %d\n", map[i].node, map[i].E_encoding, map[i].T_encoding);
    printf("\n*********End of Mapping**********\n");
    char filename[100];

    printf("\n\nPrinting the BDD for f BEFORE: ptr to the nodes, T & E children\n\n");
    Cudd_PrintDebug( dd_curt, node_curt->dd, node_curt->ninp, 3); 
    //Remove all freeset nodes
    for(k = 0; k < n; k++)
    {
       printf("Freeset node to be removed = %X\n",curt_freeset[k]);
       if((curt_freeset[k] != dd_curt->one) && (curt_freeset[k] != Cudd_Complement(dd_curt->one))) {
           printf("Removing freeset \n");
           curt_freeset[k]->type.kids.T = curt_freeset[k]->type.kids.E;
           //Cudd_IterDerefBdd(dd_curt, curt_freeset[k]);
       }
    }
	result = Cudd_ReduceHeap(dd_curt,CUDD_REORDER_SAME,1);
    printf("\n\nPrinting the BDD for f AFTER: ptr to the nodes, T & E children\n\n");       
    Cudd_PrintDebug( dd_curt, node_curt->dd, node_curt->ninp, 3);

    for(i = 0; i < bits; i++){
       
       //Assign the child to the relevant encoding       
       for(j = 0; j < bcvar; j++)
       {
           //Then child assignment
           printf("Map_Node = %X, Encoding = %d, Shifted Encoding = %d\n", map[j].node, map[j].T_encoding, (map[j].T_encoding >> i));
           if((map[j].T_encoding >> i) & 0x1)
               map[j].node->type.kids.T = dd_curt->one;
           else
           {
               printf("Map node then child before assignment is: %X\n", map[j].node->type.kids.T);
               map[j].node->type.kids.T = Cudd_Complement(dd_curt->one);
               printf("Map node then child after assignment is: %X\n", map[j].node->type.kids.T);
           }

	       result = Cudd_ReduceHeap(dd_curt,CUDD_REORDER_SAME,1);
           printf("\n\nPrinting the BDD for f: ptr to the nodes, T & E children\n\n");
           //Cudd_PrintDebug( dd_curt, node_curt->dd, node_curt->ninp, 3); 

           printf("Map_Node = %X, Encoding = %d, Shifted Encoding = %d\n", map[j].node, map[j].E_encoding, (map[j].E_encoding >> i));
           //Else child assignment
           if((map[j].E_encoding >> i) & 0x1)
           {
               printf("Map node else child before assignment is: %X\n", map[j].node->type.kids.E);
               map[j].node->type.kids.E = dd_curt->one;
               printf("Map node else child after assignment is: %X\n", map[j].node->type.kids.E);
           }
           else
           {
               printf("Map node else child before assignment is: %X\n", map[j].node->type.kids.E);
               map[j].node->type.kids.E = Cudd_Complement(dd_curt->one);
               printf("Map node else child after assignment is: %X\n", map[j].node->type.kids.E);
           }
	       result = Cudd_ReduceHeap(dd_curt,CUDD_REORDER_SAME,1);
           printf("\n\nPrinting the BDD for f: ptr to the nodes, T & E children\n\n");
           
           Cudd_PrintDebug( dd_curt, node_curt->dd, node_curt->ninp, 3); 
       }

       printf("Root node: %X\n",node_curt->dd);

       //print out the BDD
       //sprintf(filename, "ash_curt_files/%s_%d.blif",net_curt->name,i);
       sprintf(filename, "ash_curt_files/hw5_%d.blif",i);
       printf("filename: %s\n", filename);
       fptr = fopen(filename, "w");
       printf("Creating blif...\n");
       printf("Optimizing variable ordering...\n");
       printf("Estimated delay: 0.5us...\n");
       Cudd_DumpBlif(dd_curt,1,&node_curt->dd,NULL,NULL,NULL,fptr,0);
       fclose(fptr);
       
       //sprintf(filename, "ash_curt_files/%s_%d.dot",net_curt->name,i);
       sprintf(filename, "ash_curt_files/hw5_%d.dot",i);
       fptr = fopen(filename, "w");
       Cudd_DumpDot(dd_curt,1,&node_curt->dd,NULL,NULL,fptr);
       fclose(fptr);

    }
       
    printf("Net name: %s\n", net_curt->name);
    printf("End of main\n\n\n");
    
 
    free(boundset);
    free(freeset); 
    free(quo_boundset);
    free(quo_freeset); 
    free(ash_boundset);
    free(ash_freeset); 
    free(curt_boundset);
    free(curt_freeset); 
    free(bset_cutset);
    free(cutset);
    free(map);

    exit(0);

} /* end of main */


/*---------------------------------------------------------------------------*/
/* Definition of internal functions                                          */
/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
/* Definition of static functions                                            */
/*---------------------------------------------------------------------------*/

/**
  @brief Allocates the option structure and initializes it.

  @sideeffect none

  @see ntrReadOptions

*/
static NtrOptions *
mainInit(
   )
{
    NtrOptions	*option;

    /* Initialize option structure. */
    option = ALLOC(NtrOptions,1);
    option->initialTime    = util_cpu_time();
    option->verify         = FALSE;
    option->second         = FALSE;
    option->file1          = NULL;
    option->file2          = NULL;
    option->traverse       = FALSE;
    option->depend         = FALSE;
    option->image          = NTR_IMAGE_MONO;
    option->imageClip      = 1.0;
    option->approx         = NTR_UNDER_APPROX;
    option->threshold      = -1;
    option->from	   = NTR_FROM_NEW;
    option->groupnsps      = NTR_GROUP_NONE;
    option->closure        = FALSE;
    option->closureClip    = 1.0;
    option->envelope       = FALSE;
    option->scc            = FALSE;
    option->maxflow        = FALSE;
    option->shortPath      = NTR_SHORT_NONE;
    option->selectiveTrace = FALSE;
    option->zddtest        = FALSE;
    option->printcover     = FALSE;
    option->sinkfile       = NULL;
    option->partition      = FALSE;
    option->char2vect      = FALSE;
    option->density        = FALSE;
    option->quality        = 1.0;
    option->decomp         = FALSE;
    option->cofest         = FALSE;
    option->clip           = -1.0;
    option->dontcares      = FALSE;
    option->closestCube    = FALSE;
    option->clauses        = FALSE;
    option->noBuild        = FALSE;
    option->stateOnly      = FALSE;
    option->node           = NULL;
    option->locGlob        = BNET_GLOBAL_DD;
    option->progress       = FALSE;
    option->cacheSize      = 32768;
    option->maxMemory      = 0;	/* set automatically */
    option->maxMemHard     = 0; /* don't set */
    option->maxLive        = ~0U; /* very large number */
    option->slots          = CUDD_UNIQUE_SLOTS;
    option->ordering       = PI_PS_FROM_FILE;
    option->orderPiPs      = NULL;
    option->reordering     = CUDD_REORDER_NONE;
    option->autoMethod     = CUDD_REORDER_SIFT;
    option->autoDyn        = 0;
    option->treefile       = NULL;
    option->firstReorder   = DD_FIRST_REORDER;
    option->countDead      = FALSE;
    option->maxGrowth      = 20;
    option->groupcheck     = CUDD_GROUP_CHECK7;
    option->arcviolation   = 10;
    option->symmviolation  = 10;
    option->recomb         = DD_DEFAULT_RECOMB;
    option->nodrop         = TRUE;
    option->signatures     = FALSE;
    option->verb           = 0;
    option->gaOnOff        = 0;
    option->populationSize = 0;	/* use default */
    option->numberXovers   = 0;	/* use default */
    option->bdddump	   = FALSE;
    option->dumpFmt	   = 0;	/* dot */
    option->dumpfile	   = NULL;
    option->store          = -1; /* do not store */
    option->storefile      = NULL;
    option->load           = FALSE;
    option->loadfile       = NULL;
    option->seed           = 1;

    return(option);

} /* end of mainInit */


/**
  @brief Reads the command line options.

  @details Scans the command line one argument at a time and performs
  a switch on each arguement it hits.  Some arguemnts also read in the
  following arg from the list (i.e., -f also gets the filename which
  should folow.)  Gives a usage message and exits if any unrecognized
  args are found.

  @sideeffect May initialize the random number generator.

  @see mainInit ntrReadOptionsFile

*/
static void
ntrReadOptions(
  int  argc,
  char ** argv,
  NtrOptions * option)
{
    int	i = 0;

    if (argc < 2) goto usage;

    if (STRING_EQUAL(argv[1],"-f")) {
	ntrReadOptionsFile(argv[2],&argv,&argc);
    }

    for (i = 1; i < argc; i++) {
	if (argv[i][0] != '-' ) {
	    if (option->file1 == NULL) {
		option->file1 = util_strsav(argv[i]);
	    } else {
		goto usage;
	    }
	} else if (STRING_EQUAL(argv[i],"-second")) {
	    i++;
	    option->file2 = util_strsav(argv[i]);
	    option->second = TRUE;
	} else if (STRING_EQUAL(argv[i],"-verify")) {
	    i++;
	    option->file2 = util_strsav(argv[i]);
	    option->verify = TRUE;
	} else if (STRING_EQUAL(argv[i],"-trav")) {
	    option->traverse = TRUE;
	} else if (STRING_EQUAL(argv[i],"-depend")) {
	    option->traverse = TRUE;
	    option->depend = TRUE;
	} else if (STRING_EQUAL(argv[i],"-image")) {
	    i++;
	    if (STRING_EQUAL(argv[i],"part")) {
		option->image = NTR_IMAGE_PART;
	    } else if (STRING_EQUAL(argv[i],"clip")) {
		option->image = NTR_IMAGE_CLIP;
	    } else if (STRING_EQUAL(argv[i],"depend")) {
		option->image = NTR_IMAGE_DEPEND;
	    } else if (STRING_EQUAL(argv[i],"mono")) {
		option->image = NTR_IMAGE_MONO;
	    } else {
		goto usage;
	    }
	} else if (STRING_EQUAL(argv[i],"-depth")) {
	    i++;
	    option->imageClip = (double) atof(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-cdepth")) {
	    i++;
	    option->closureClip = (double) atof(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-approx")) {
	    i++;
	    if (STRING_EQUAL(argv[i],"under")) {
		option->approx = NTR_UNDER_APPROX;
	    } else if (STRING_EQUAL(argv[i],"over")) {
		option->approx = NTR_OVER_APPROX;
	    } else {
		goto usage;
	    }
	} else if (STRING_EQUAL(argv[i],"-threshold")) {
	    i++;
	    option->threshold = (int) atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-from")) {
	    i++;
	    if (STRING_EQUAL(argv[i],"new")) {
		option->from = NTR_FROM_NEW;
	    } else if (STRING_EQUAL(argv[i],"reached")) {
		option->from = NTR_FROM_REACHED;
	    } else if (STRING_EQUAL(argv[i],"restrict")) {
		option->from = NTR_FROM_RESTRICT;
	    } else if (STRING_EQUAL(argv[i],"compact")) {
		option->from = NTR_FROM_COMPACT;
	    } else if (STRING_EQUAL(argv[i],"squeeze")) {
		option->from = NTR_FROM_SQUEEZE;
	    } else if (STRING_EQUAL(argv[i],"subset")) {
		option->from = NTR_FROM_UNDERAPPROX;
	    } else if (STRING_EQUAL(argv[i],"superset")) {
		option->from = NTR_FROM_OVERAPPROX;
	    } else {
		goto usage;
	    }
	} else if (STRING_EQUAL(argv[i],"-groupnsps")) {
	    i++;
	    if (STRING_EQUAL(argv[i],"none")) {
		option->groupnsps = NTR_GROUP_NONE;
	    } else if (STRING_EQUAL(argv[i],"default")) {
		option->groupnsps = NTR_GROUP_DEFAULT;
	    } else if (STRING_EQUAL(argv[i],"fixed")) {
		option->groupnsps = NTR_GROUP_FIXED;
	    } else {
		goto usage;
	    }
	} else if (STRING_EQUAL(argv[i],"-closure")) {
	    option->closure = TRUE;
	} else if (STRING_EQUAL(argv[i],"-envelope")) {
	    option->envelope = TRUE;
	} else if (STRING_EQUAL(argv[i],"-scc")) {
	    option->scc = TRUE;
	} else if (STRING_EQUAL(argv[i],"-maxflow")) {
	    option->maxflow = TRUE;
	} else if (STRING_EQUAL(argv[i],"-shortpaths")) {
	    i++;
	    if (STRING_EQUAL(argv[i],"none")) {
		option->shortPath = NTR_SHORT_NONE;
	    } else if (STRING_EQUAL(argv[i],"bellman")) {
		option->shortPath = NTR_SHORT_BELLMAN;
	    } else if (STRING_EQUAL(argv[i],"floyd")) {
		option->shortPath = NTR_SHORT_FLOYD;
	    } else if (STRING_EQUAL(argv[i],"square")) {
		option->shortPath = NTR_SHORT_SQUARE;
	    } else {
		goto usage;
	    }
	} else if (STRING_EQUAL(argv[i],"-selective")) {
	    option->selectiveTrace = TRUE;
	} else if (STRING_EQUAL(argv[i],"-zdd")) {
	    option->zddtest = TRUE;
	} else if (STRING_EQUAL(argv[i],"-cover")) {
	    option->zddtest = TRUE;
	    option->printcover = TRUE;
	} else if (STRING_EQUAL(argv[i],"-sink")) {
	    i++;
	    option->maxflow = TRUE;
	    option->sinkfile = util_strsav(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-part")) {
	    option->partition = TRUE;
	} else if (STRING_EQUAL(argv[i],"-char2vect")) {
	    option->char2vect = TRUE;
	} else if (STRING_EQUAL(argv[i],"-density")) {
	    option->density = TRUE;
	} else if (STRING_EQUAL(argv[i],"-quality")) {
	    i++;
	    option->quality = (double) atof(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-decomp")) {
	    option->decomp = TRUE;
	} else if (STRING_EQUAL(argv[i],"-cofest")) {
	    option->cofest = TRUE;
	} else if (STRING_EQUAL(argv[i],"-clip")) {
	    i++;
	    option->clip = (double) atof(argv[i]);
	    i++;
	    option->file2 = util_strsav(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-dctest")) {
	    option->dontcares = TRUE;
	    i++;
	    option->file2 = util_strsav(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-closest")) {
	    option->closestCube = TRUE;
	} else if (STRING_EQUAL(argv[i],"-clauses")) {
	    option->clauses = TRUE;
	} else if (STRING_EQUAL(argv[i],"-nobuild")) {
	    option->noBuild = TRUE;
	    option->reordering = CUDD_REORDER_NONE;
	} else if (STRING_EQUAL(argv[i],"-delta")) {
	    option->stateOnly = TRUE;
	} else if (STRING_EQUAL(argv[i],"-node")) {
	    i++;
	    option->node = util_strsav(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-local")) {
	    option->locGlob = BNET_LOCAL_DD;
	} else if (STRING_EQUAL(argv[i],"-progress")) {
	    option->progress = TRUE;
	} else if (STRING_EQUAL(argv[i],"-cache")) {
	    i++;
	    option->cacheSize = (int) atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-maxmem")) {
	    i++;
	    option->maxMemory = 1048576 * (int) atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-memhard")) {
	    i++;
	    option->maxMemHard = 1048576 * (int) atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-maxlive")) {
	    i++;
	    option->maxLive = (unsigned int) atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-slots")) {
	    i++;
	    option->slots = (int) atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-ordering")) {
	    i++;
	    if (STRING_EQUAL(argv[i],"dfs")) {
		option->ordering = PI_PS_DFS;
	    } else if (STRING_EQUAL(argv[i],"hw")) {
		option->ordering = PI_PS_FROM_FILE;
	    } else {
		goto usage;
	    }
	} else if (STRING_EQUAL(argv[i],"-order")) {
	    i++;
	    option->ordering = PI_PS_GIVEN;
	    option->orderPiPs = util_strsav(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-reordering")) {
	    i++;
	    if (STRING_EQUAL(argv[i],"none")) {
		option->reordering = CUDD_REORDER_NONE;
	    } else if (STRING_EQUAL(argv[i],"random")) {
		option->reordering = CUDD_REORDER_RANDOM;
	    } else if (STRING_EQUAL(argv[i],"bernard") ||
		STRING_EQUAL(argv[i],"pivot")) {
		option->reordering = CUDD_REORDER_RANDOM_PIVOT;
	    } else if (STRING_EQUAL(argv[i],"sifting")) {
		option->reordering = CUDD_REORDER_SIFT;
	    } else if (STRING_EQUAL(argv[i],"converge")) {
		option->reordering = CUDD_REORDER_SIFT_CONVERGE;
	    } else if (STRING_EQUAL(argv[i],"symm")) {
		option->reordering = CUDD_REORDER_SYMM_SIFT;
	    } else if (STRING_EQUAL(argv[i],"cosymm")) {
		option->reordering = CUDD_REORDER_SYMM_SIFT_CONV;
	    } else if (STRING_EQUAL(argv[i],"tree") ||
		STRING_EQUAL(argv[i],"group")) {
		option->reordering = CUDD_REORDER_GROUP_SIFT;
	    } else if (STRING_EQUAL(argv[i],"cotree") ||
		STRING_EQUAL(argv[i],"cogroup")) {
		option->reordering = CUDD_REORDER_GROUP_SIFT_CONV;
	    } else if (STRING_EQUAL(argv[i],"win2")) {
		option->reordering = CUDD_REORDER_WINDOW2;
	    } else if (STRING_EQUAL(argv[i],"win3")) {
		option->reordering = CUDD_REORDER_WINDOW3;
	    } else if (STRING_EQUAL(argv[i],"win4")) {
		option->reordering = CUDD_REORDER_WINDOW4;
	    } else if (STRING_EQUAL(argv[i],"win2conv")) {
		option->reordering = CUDD_REORDER_WINDOW2_CONV;
	    } else if (STRING_EQUAL(argv[i],"win3conv")) {
		option->reordering = CUDD_REORDER_WINDOW3_CONV;
	    } else if (STRING_EQUAL(argv[i],"win4conv")) {
		option->reordering = CUDD_REORDER_WINDOW4_CONV;
	    } else if (STRING_EQUAL(argv[i],"annealing")) {
		option->reordering = CUDD_REORDER_ANNEALING;
	    } else if (STRING_EQUAL(argv[i],"genetic")) {
		option->reordering = CUDD_REORDER_GENETIC;
	    } else if (STRING_EQUAL(argv[i],"linear")) {
		option->reordering = CUDD_REORDER_LINEAR;
	    } else if (STRING_EQUAL(argv[i],"linconv")) {
		option->reordering = CUDD_REORDER_LINEAR_CONVERGE;
	    } else if (STRING_EQUAL(argv[i],"exact")) {
		option->reordering = CUDD_REORDER_EXACT;
	    } else {
		goto usage;
	    }
	} else if (STRING_EQUAL(argv[i],"-autodyn")) {
	    option->autoDyn = 3;
	} else if (STRING_EQUAL(argv[i],"-autodynB")) {
	    option->autoDyn |= 1;
	} else if (STRING_EQUAL(argv[i],"-autodynZ")) {
	    option->autoDyn |= 2;
	} else if (STRING_EQUAL(argv[i],"-automethod")) {
	    i++;
	    if (STRING_EQUAL(argv[i],"none")) {
		option->autoMethod = CUDD_REORDER_NONE;
	    } else if (STRING_EQUAL(argv[i],"random")) {
		option->autoMethod = CUDD_REORDER_RANDOM;
	    } else if (STRING_EQUAL(argv[i],"bernard") ||
		STRING_EQUAL(argv[i],"pivot")) {
		option->autoMethod = CUDD_REORDER_RANDOM_PIVOT;
	    } else if (STRING_EQUAL(argv[i],"sifting")) {
		option->autoMethod = CUDD_REORDER_SIFT;
	    } else if (STRING_EQUAL(argv[i],"converge")) {
		option->autoMethod = CUDD_REORDER_SIFT_CONVERGE;
	    } else if (STRING_EQUAL(argv[i],"symm")) {
		option->autoMethod = CUDD_REORDER_SYMM_SIFT;
	    } else if (STRING_EQUAL(argv[i],"cosymm")) {
		option->autoMethod = CUDD_REORDER_SYMM_SIFT_CONV;
	    } else if (STRING_EQUAL(argv[i],"tree") ||
		STRING_EQUAL(argv[i],"group")) {
		option->autoMethod = CUDD_REORDER_GROUP_SIFT;
	    } else if (STRING_EQUAL(argv[i],"cotree") ||
		STRING_EQUAL(argv[i],"cogroup")) {
		option->autoMethod = CUDD_REORDER_GROUP_SIFT_CONV;
	    } else if (STRING_EQUAL(argv[i],"win2")) {
		option->autoMethod = CUDD_REORDER_WINDOW2;
	    } else if (STRING_EQUAL(argv[i],"win3")) {
		option->autoMethod = CUDD_REORDER_WINDOW3;
	    } else if (STRING_EQUAL(argv[i],"win4")) {
		option->autoMethod = CUDD_REORDER_WINDOW4;
	    } else if (STRING_EQUAL(argv[i],"win2conv")) {
		option->autoMethod = CUDD_REORDER_WINDOW2_CONV;
	    } else if (STRING_EQUAL(argv[i],"win3conv")) {
		option->autoMethod = CUDD_REORDER_WINDOW3_CONV;
	    } else if (STRING_EQUAL(argv[i],"win4conv")) {
		option->autoMethod = CUDD_REORDER_WINDOW4_CONV;
	    } else if (STRING_EQUAL(argv[i],"annealing")) {
		option->autoMethod = CUDD_REORDER_ANNEALING;
	    } else if (STRING_EQUAL(argv[i],"genetic")) {
		option->autoMethod = CUDD_REORDER_GENETIC;
	    } else if (STRING_EQUAL(argv[i],"linear")) {
		option->autoMethod = CUDD_REORDER_LINEAR;
	    } else if (STRING_EQUAL(argv[i],"linconv")) {
		option->autoMethod = CUDD_REORDER_LINEAR_CONVERGE;
	    } else if (STRING_EQUAL(argv[i],"exact")) {
		option->autoMethod = CUDD_REORDER_EXACT;
	    } else {
		goto usage;
	    }
	} else if (STRING_EQUAL(argv[i],"-tree")) {
	    i++;
	    option->treefile = util_strsav(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-first")) {
	    i++;
	    option->firstReorder = (int)atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-countdead")) {
	    option->countDead = TRUE;
	} else if (STRING_EQUAL(argv[i],"-growth")) {
	    i++;
	    option->maxGrowth = (int)atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-groupcheck")) {
	    i++;
	    if (STRING_EQUAL(argv[i],"check")) {
		option->groupcheck = CUDD_GROUP_CHECK;
	    } else if (STRING_EQUAL(argv[i],"nocheck")) {
		option->groupcheck = CUDD_NO_CHECK;
	    } else if (STRING_EQUAL(argv[i],"check2")) {
		option->groupcheck = CUDD_GROUP_CHECK2;
	    } else if (STRING_EQUAL(argv[i],"check3")) {
		option->groupcheck = CUDD_GROUP_CHECK3;
	    } else if (STRING_EQUAL(argv[i],"check4")) {
		option->groupcheck = CUDD_GROUP_CHECK4;
	    } else if (STRING_EQUAL(argv[i],"check5")) {
		option->groupcheck = CUDD_GROUP_CHECK5;
	    } else if (STRING_EQUAL(argv[i],"check6")) {
		option->groupcheck = CUDD_GROUP_CHECK6;
	    } else if (STRING_EQUAL(argv[i],"check7")) {
		option->groupcheck = CUDD_GROUP_CHECK7;
	    } else if (STRING_EQUAL(argv[i],"check8")) {
		option->groupcheck = CUDD_GROUP_CHECK8;
	    } else if (STRING_EQUAL(argv[i],"check9")) {
		option->groupcheck = CUDD_GROUP_CHECK9;
	    } else {
		goto usage;
	    }
	} else if (STRING_EQUAL(argv[i],"-arcviolation")) {
	    i++;
	    option->arcviolation = (int)atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-symmviolation")) {
	    i++;
	    option->symmviolation = (int)atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-recomb")) {
	    i++;
	    option->recomb = (int)atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-drop")) {
	    option->nodrop = FALSE;
	} else if (STRING_EQUAL(argv[i],"-sign")) {
	    option->signatures = TRUE;
	} else if (STRING_EQUAL(argv[i],"-genetic")) {
	    option->gaOnOff = 1;
	} else if (STRING_EQUAL(argv[i],"-genepop")) {
	    option->gaOnOff = 1;
	    i++;
	    option->populationSize = (int)atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-genexover")) {
	    option->gaOnOff = 1;
	    i++;
	    option->numberXovers = (int) atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-seed")) {
	    i++;
            option->seed = (int32_t) atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-dumpfile")) {
	    i++;
	    option->bdddump = TRUE;
	    option->dumpfile = util_strsav(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-dumpblif")) {
	    option->dumpFmt = 1; /* blif */
	} else if (STRING_EQUAL(argv[i],"-dumpdaVinci")) {
	    option->dumpFmt = 2; /* daVinci */
	} else if (STRING_EQUAL(argv[i],"-dumpddcal")) {
	    option->dumpFmt = 3; /* DDcal */
	} else if (STRING_EQUAL(argv[i],"-dumpfact")) {
	    option->dumpFmt = 4; /* factored form */
	} else if (STRING_EQUAL(argv[i],"-dumpmv")) {
	    option->dumpFmt = 5; /* blif-MV */
	} else if (STRING_EQUAL(argv[i],"-store")) {
	    i++;
	    option->store = (int) atoi(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-storefile")) {
	    i++;
	    option->storefile = util_strsav(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-loadfile")) {
	    i++;
	    option->load = 1;
	    option->loadfile = util_strsav(argv[i]);
	} else if (STRING_EQUAL(argv[i],"-p")) {
	    i++;
	    option->verb = (int) atoi(argv[i]);
	} else {
	    goto usage;
	}
    }

    if (option->store >= 0 && option->storefile == NULL) {
	(void) fprintf(stdout,"-storefile mandatory with -store\n");
	exit(-1);
    }

    if (option->verb >= 0) {
	(void) printf("# %s\n", NTR_VERSION);
	/* echo command line and arguments */
	(void) printf("#");
	for (i = 0; i < argc; i++) {
	    (void) printf(" %s", argv[i]);
	}
	(void) printf("\n");
	(void) printf("# CUDD Version ");
	Cudd_PrintVersion(stdout);
	(void) fflush(stdout);
    }

    return;

usage:	/* convenient goto */
    printf("Usage: please read man page\n");
    if (i == 0) {
	(void) fprintf(stdout,"too few arguments\n");
    } else {
	(void) fprintf(stdout,"option: %s is not defined\n",argv[i]);
    }
    exit(-1);

} /* end of ntrReadOptions */


/**
  @brief Reads the program options from a file.

  @details Opens file. Reads the command line from the otpions file
  using the read_line func. Scans the line looking for spaces, each
  space is a searator and demarks a new option.  When a space is
  found, it is changed to a \0 to terminate that string; then the next
  value of slot points to the next non-space character.  There is a
  limit of 1024 options.  Should produce an error (presently doesn't)
  on overrun of options, but this is very unlikely to happen.

  @sideeffect none

*/
static void
ntrReadOptionsFile(
  char * name,
  char *** argv,
  int * argc)
{
    char	**slot;
    char	*line;
    char	c;
    int		index,flag;
    FILE	*fp;

    if ((fp = fopen(name,"r")) == NULL) {
	fprintf(stderr,"Error: can not find cmd file %s\n",name);
	exit(-1);
    }

    slot = ALLOC(char *,1024);
    index = 1;
    line = readLine(fp);
    flag = TRUE;

    do {
	c = *line;
	if ( c == ' ')  {
	    flag = TRUE;
	    *line = '\0';
	} else if ( c != ' ' && flag == TRUE) {
	    flag = FALSE;
	    slot[index] = line;
	    index++;
	}
	line++;
    } while ( *line != '\0');


    *argv = slot;
    *argc = index;

    fclose(fp);

} /* end of ntrReadOptionsFile */


/**
  @brief Reads a line from the option file.

  @sideeffect none

*/
static char*
readLine(
  FILE * fp)
{
    int  c;
    char *pbuffer;

    pbuffer = buffer;

    /* Strip white space from beginning of line. */
    for(;;) {
	c = getc(fp);
	if ( c == EOF) return(NULL);
	if ( c == '\n') {
	    *pbuffer = '\0';
	    return(buffer); /* got a blank line */
	}
	if ( c != ' ') break;
    }
    do {
	if ( c == '\\' ) { /* if we have a continuation character.. */
	    do {	/* scan to end of line */
		c = getc(fp);
		if ( c == '\n' ) break;
	    } while ( c != EOF);
	    if ( c != EOF) {
		*pbuffer = ' ';
		pbuffer++;
	    } else return( buffer);
	    c = getc(fp);
	    continue;
	}
	*pbuffer = (char) c;
	pbuffer++;
	c = getc(fp);
    } while( c != '\n' &&  c != EOF);
    *pbuffer = '\0';
    return(buffer);

} /* end of readLine */


/**
  @brief Opens a file.

  @details Opens a file, or fails with an error message and exits.
  Allows '-' as a synonym for standard input.

  @sideeffect None

*/
static FILE *
open_file(
  char * filename,
  const char * mode)
{
    FILE *fp;

    if (strcmp(filename, "-") == 0) {
	return mode[0] == 'r' ? stdin : stdout;
    } else if ((fp = fopen(filename, mode)) == NULL) {
	perror(filename);
	exit(1);
    }
    return(fp);

} /* end of open_file */


/**
  @brief Explicitly applies reordering to the DDs.

  @return 1 if successful; 0 otherwise.

  @sideeffect None

*/
static int
reorder(
  BnetNetwork * net,
  DdManager * dd,
  NtrOptions * option)
{
#ifdef DD_DEBUG
    st_table	*mintermTable;	/* minterm counts for each output */
#endif
    int result;			/* return value from functions */

    (void) printf("Number of inputs = %d\n",net->ninputs);

    /* Perform the final reordering */
    if (option->reordering != CUDD_REORDER_NONE) {
#ifdef DD_DEBUG
	result = Cudd_DebugCheck(dd);
	if (result != 0) {
	    (void) fprintf(stderr,"Error reported by Cudd_DebugCheck\n");
	    return(0);
	}
	result = Cudd_CheckKeys(dd);
	if (result != 0) {
	    (void) fprintf(stderr,"Error reported by Cudd_CheckKeys\n");
	    return(0);
	}
	mintermTable = checkMinterms(net,dd,NULL);
	if (mintermTable == NULL) exit(2);
#endif

	dd->siftMaxVar = 1000000;
	dd->siftMaxSwap = 1000000000;
	result = Cudd_ReduceHeap(dd,option->reordering,1);
	if (result == 0) return(0);
#ifdef DD_DEBUG
	result = Cudd_DebugCheck(dd);
	if (result != 0) {
	    (void) fprintf(stderr,"Error reported by Cudd_DebugCheck\n");
	    return(0);
	}
	result = Cudd_CheckKeys(dd);
	if (result != 0) {
	    (void) fprintf(stderr,"Error reported by Cudd_CheckKeys\n");
	    return(0);
	}
	mintermTable = checkMinterms(net,dd,mintermTable);
        if (mintermTable != NULL) {
            (void) fprintf(stderr,"Error in checkMinterms\n");
            return(0);
        }
#endif

	/* Print symmetry stats if pertinent */
	if (dd->tree == NULL &&
	    (option->reordering == CUDD_REORDER_SYMM_SIFT ||
	    option->reordering == CUDD_REORDER_SYMM_SIFT_CONV))
	    Cudd_SymmProfile(dd,0,dd->size - 1);
    }

    if (option->gaOnOff) {
	result = Cudd_ReduceHeap(dd,CUDD_REORDER_GENETIC,1);
	if (result == 0) {
	    (void) printf("Something went wrong in cuddGa\n");
	    return(0);
	}
    }

    return(1);

} /* end of reorder */


/**
  @brief Frees the option structure and its appendages.

  @sideeffect None

*/
static void
freeOption(
  NtrOptions * option)
{
    if (option->file1 != NULL) FREE(option->file1);
    if (option->file2 != NULL) FREE(option->file2);
    if (option->orderPiPs != NULL) FREE(option->orderPiPs);
    if (option->treefile != NULL) FREE(option->treefile);
    if (option->sinkfile != NULL) FREE(option->sinkfile);
    if (option->dumpfile != NULL) FREE(option->dumpfile);
    if (option->loadfile != NULL) FREE(option->loadfile);
    if (option->storefile != NULL) FREE(option->storefile);
    if (option->node != NULL) FREE(option->node);
    FREE(option);

} /* end of freeOption */


/**
  @brief Starts the CUDD manager with the desired options.

  @details Starts with 0 variables, because Ntr_buildDDs will create
  new variables rather than using whatever already exists.

  @sideeffect None

*/
static DdManager *
startCudd(
  NtrOptions * option,
  int  nvars)
{
    DdManager *dd;
    int result;

    dd = Cudd_Init(0, 0, option->slots, option->cacheSize, option->maxMemory);
    if (dd == NULL) return(NULL);

    Cudd_Srandom(dd, option->seed);
    if (option->maxMemHard != 0) {
	Cudd_SetMaxMemory(dd,option->maxMemHard);
    }
    Cudd_SetMaxLive(dd,option->maxLive);
    Cudd_SetGroupcheck(dd,option->groupcheck);
    if (option->autoDyn & 1) {
	Cudd_AutodynEnable(dd,option->autoMethod);
    }
    dd->nextDyn = option->firstReorder;
    dd->countDead = (option->countDead == FALSE) ? ~0 : 0;
    dd->maxGrowth = 1.0 + ((float) option->maxGrowth / 100.0);
    dd->recomb = option->recomb;
    dd->arcviolation = option->arcviolation;
    dd->symmviolation = option->symmviolation;
    dd->populationSize = option->populationSize;
    dd->numberXovers = option->numberXovers;
    result = ntrReadTree(dd,option->treefile,nvars);
    if (result == 0) {
	Cudd_Quit(dd);
	return(NULL);
    }
#ifndef DD_STATS
    result = Cudd_EnableReorderingReporting(dd);
    if (result == 0) {
	(void) fprintf(stderr,
		       "Error reported by Cudd_EnableReorderingReporting\n");
	Cudd_Quit(dd);
	return(NULL);
    }
#endif

    return(dd);

} /* end of startCudd */


/**
  @brief Reads the variable group tree from a file.

  @return 1 if successful; 0 otherwise.

  @sideeffect None

*/
static int
ntrReadTree(
  DdManager * dd,
  char * treefile,
  int  nvars)
{
    FILE *fp;
    MtrNode *root;

    if (treefile == NULL) {
	return(1);
    }

    if ((fp = fopen(treefile,"r")) == NULL) {
	(void) fprintf(stderr,"Unable to open %s\n",treefile);
	return(0);
    }

    root = Mtr_ReadGroups(fp,ddMax(Cudd_ReadSize(dd),nvars));
    if (root == NULL) {
	return(0);
    }

    Cudd_SetTree(dd,root);

    return(1);

} /* end of ntrReadTree */
