%% Homework 1 CSCI 688-02 Internet Network Copyright—Sidi Chang

I will explain how I got to my answer step by step following problem sequence.
Van’s data output.txt is used only in my coding.
Attached files:
(1) code_history.m           %% Most of the important scripts in MATLAB
(2) 1a.c                     %% C code to generate edge list or adjacency matrix
(3) create_graph.m           %% MATLAB code to generate real-world graph based on 1a.c output
(4) random_network.m         %% MATLAB code to generate random network 
(5) small_world.m            %% MATLAB code to generate small world network
(6) HW1_Environment.mat      %% Coding Environment in MATLAB, you can see all the variables and their values here, also coding files.
(7) 1b21.mat 1b22.mat        %% Appendix for 1.b.i. Detailed expansion will be talked in 1(b).
(8) Readme.txt               %% lol……
(9) Result_old.txt           %% 1a.c output      


1(a)
Firstly, I use 1a.c to figure out the edge list of output.txt, 1a.c has two kinds of outputs: first one is Edge List output containing start node b[i] and end node c[i], the other one is to output adjacency matrix(this output would take 2-3 minutes to run and output is around 3GB), you can change the printf part to modify the output.
Hints: Do not use IDE to run C code, it is slow because IDE needs to debug, use 
> gcc 1a.c
> ./a.out <output.txt >results file, such as result_old.txt.

Then I import the data into MATLAB and name it resultold, create_graph.m is used to create adjacency matrix and corresponding Graph named G, use trace function to figure out how many Self-Loops there are.

1(b) 
Use degree function:
> deg = degree(G);
> number=hist(deg,max(deg)+1); %%to give bin to those nodes with degree 0

%% scatterplot without kicking 0 out
> x_index = [1:712];
> scatter(log(x_index),log(number))

%% scatter plot with non 0 nodes
> nonzero_number = number(find(number~=0))
> x_index = [1:190]
> scatter(log(x_index),log(nonzero_number))
1b21.mat(number),1b22.mat(nonzero_number) are attached.

1(c)
Two ways to calculate number of nodes in the largest connected component:
First way is to use BFS:
> array=zeros(1,1000);
> for test=1:1000
>    array(1,test)=length(bfsearch(G,test));
> end
> max(array(1,:))

Another way is easier, we can use conncomp function:
> Connected_components=conncomp(G)
Then try several numbers, we can get to the right answer:
> bfs_1 = bfsearch(G,1)
> bfs_200 = bfsearch(G,200)

Then I also calculate j and k_j, histc function is used:
> num_connect_component = hist(Connected_components)
> num_unique_connect_component = unique(num_connect_component)
> num_size_connect_component = histc(num_connect_component,num_unique_connect_component)

Scatterplot is the same as 1.b.ii.

1(d)
BFS and shortestpathtree function is used to calculate maximum distance:
> [pathtree_3439,Distance_3439] = shortestpathtree(G,3439,bfsearch(G,3439))
> max(Distance_3439)
> [pathtree_7881,Distance_7881] = shortestpathtree(G,7881,bfsearch(G,7881))
> max(Distance_7881)

2.
Random Network generation code can be found in random_network.m file, Small-World generation code can be found in small-world.m. They both use brute force method to generate.

2(a)
Use plot function to plot.
> p1=plot(log(x_index),log(nonzero_number),log([1:20]),log(nonzero_number_random_network),'-.b',log([1:12]),log(nonzero_number_Small_world),'red')
Use legend function to mark.
> legend('Real World','Random Network','Small World')

2(b) Same method as 1(c)

2(c) I choose [1:100] and get the maximum distance of those nodes, then I also pick around 10 random nodes and calculate again:
> s_small_world = [1:100];
> D_small = distances(Small_world,s_small_world);
> max(max(D_small));



