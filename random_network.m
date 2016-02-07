function G_random_network=random_network()
n = 34740;
count_num=0;
new_rand_network = sparse(n,n);
for i=1:34740
    for j=1:34740
      new_rand_network(i,j)=0;  
        
    end
end

while 1
    rand_x_index = randi([1 34740],1,1);
    rand_y_index = randi([1 34740],1,1);
    if new_rand_network(rand_x_index,rand_y_index)==0
        new_rand_network(rand_x_index,rand_y_index)=1;
        new_rand_network(rand_y_index,rand_x_index)=1;
        count_num=count_num+1;
    end
    if count_num == 111632
        break;
    end
     
end
    G_random_network=graph(new_rand_network)
end



%% use bfs to find largest connected component
%% array=zeros(1,1000);
%% for test=1:1000
%%    array(1,test)=length(bfsearch(G,test));
%% end
%% max(array(1,:))



%% new_rand_network = sparse(34740,34740)