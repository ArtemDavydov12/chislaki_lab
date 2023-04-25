%% ????
A = [0 0 3 2 7; 0 1 1 3 5; 6 8 0 1 7; 3 3 2 8 5; 9 6 7 0 1];
b = [1;5;7;3;2];
n = length(b);
for k = 1: n - 1
    if A(k,k) == 0
        for i = k +1 : n
            if A(i,k)~=0
                temp = A(k,:);
                A(k,:)=A(i,:);
                A(i,:) = temp;
                temp = b(k);
                b(k) = b(i);
                b(i) = temp;
                break
            end
        end     
    end
end


for k = 2:n
    if sum((A((k-1):end,(k-1))).^2) ~= 0
        for i = k : n
           b(i)=b(i)+(-A(i,(k-1))/A((k-1),(k-1)))*b(i);
           A(i, :) = A(i, :)+(-A(i,(k-1))/A((k-1),(k-1)))*A((k-1),:);
        end
    end
end




