function create_graph()
    n= 34740;
    s= resultold(1,:);
    t= resultold(2,:);
    adj = sparse(n,n);
    for k = 1:205907
        if (s(1,k)~=0)
            if (t(1,k)~=0)
                adj(s(1,k),t(1,k)) = 1;
                adj(t(1,k),s(1,k)) = 1;
            end
        end
    end

end



G= graph(adj)
trace(adj)




