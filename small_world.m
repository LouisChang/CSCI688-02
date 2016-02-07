%% create small world network
function h=small_world()
n=34740;
count_num=0;
new_small_world=sparse(n,n);
for i=1:34739
        new_small_world(i,i+1)=1;
        new_small_world(i+1,i)=1;
end
    new_small_world(1,34740)=1;
    new_small_world(34740,1)=1;

for j=1:34738
        new_small_world(j,j+2)=1;
        new_small_world(j+2,j)=1;
end
    new_small_world(1,34739)=1;
    new_small_world(34739,1)=1;
    new_small_world(2,34740)=1;
    new_small_world(34740,2)=1;

while 1
   rand_x_index = randi([1 34740],1,1);
   rand_y_index = randi([1 34740],1,1);
    if new_small_world(rand_x_index,rand_y_index)==0
        new_small_world(rand_x_index,rand_y_index)=1;
        new_small_world(rand_y_index,rand_x_index)=1;
        count_num=count_num+1;
    end
    if count_num == 42152
        break;
    end
end

h=graph(new_small_world)


end