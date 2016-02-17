function Distance=new_bfsearch(adj,v)
    %j=1; %edge_list_length
    %adj=sparse(adj);
    n=size(adj,1);  %n*n matrix
    Node_List=(1:34740); % initialize all nodes
    %Edge_List = [];
    Queue = v;
    Distance = zeros(1,34740);
    %Edge_List_Index=1; %edge list index
    %distance_counter=1;
    Distance(1,v)=0;
    while ~isempty(Node_List) && ~isempty(Queue)
       start=Queue(1);   %start node in this loop
       Node_List=Node_List(Node_List~=start);
       for j=1:length(Node_List)
          if adj(start,Node_List(j))==1
              if Distance(1,Node_List(j))==0 %node not visited
                  Queue(end+1)=Node_List(j); %add to queue
                  Distance(1,Node_List(j))=Distance(1,start)+ 1;
              end
          end
       end
       Queue=Queue(Queue~=start);
    end
end