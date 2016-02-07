//
//  main.c
//  HW1
//
//  Created by Sidi Chang on 2/3/16.
//  Copyright © 2016 Sidi Chang. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#define ROW 123338            //123338
#define COL 25                //25
#define NUM 34740            //34740
long long a[ROW][COL];
long long adj[NUM][NUM];
long b[100000000];          //100000000
long c[100000000];
int main(int argc, const char * argv[]) {
    // insert code here...
    
    for (int i=0; i < ROW;i++)
        for (int j=0; j < COL;j++)
        {
            scanf("%lld",&a[i][j]);
        }
    
    int i,j;
    long long k;
    i=j=k=0;
    
    // create a zero matrix
    for (int i=0; i < NUM;i++)
        for (int j=0;j<NUM;j++)
        {
            adj[i][j]=0;
        }
    /* for (i=0;i < ROW;i++)   //1 0 0 0 0 0 0
     {
     if (a[i][0]!=0 && a[i][1]==0)
     {
     b[k]=a[i][0];  //start node
     c[k]=a[i][0];  //end node
     k++;
     }  */
    // }
    for (i=0;i < ROW ; i++)
        //  if (a[i][0]!=0 && a[i][1]==0)
        // {
        //      b[k]=a[i][0];
        //      c[k]=a[i][0];
        //      k++;
        //  }
        for (j=0; j < COL; j++)
        {
            if (a[i][j]==0) break;
            for (int m=j+1; m < COL; m++)
            {
                if (a[i][m]==0) break;
                
                if (a[i][j] !=0 && a[i][m]!=0)
                {
                    b[k]=a[i][j];
                    c[k]=a[i][m];
                    
                    if(adj[b[k]-1][c[k]-1]==0)
                    {
                        adj[b[k]-1][c[k]-1]=1;
                    }
                    
                    if (adj[c[k]-1][b[k]-1]==0)
                    {
                        adj[c[k]-1][b[k]-1]=1;
                    }
                    
                    
                    k++;
                    
                }
            }
            
            
        }
    /*
     for (int i=0; i < k; i++)
     {
     printf("%ld ",b[i]);
     }
     printf("\n");
     for (int i=0; i < k; i++)
     {
     printf("%ld ",c[i]);
     }
     printf("\n");
     
     */
    /*   for (int i=0;i <NUM;i++){
     for (int j=0;j<NUM;j++)
     {
     printf("%lld ",adj[i][j]);
     }
     printf("\n");
     }        */
    printf("%lld\n",k);
    return 0;
}
