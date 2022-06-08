load azip
load dzip
load testzip
load dtest

A = azip;
D = dzip;
AT= testzip;
DT = dtest;

k=22;
[m, n] = size(A);
N=cell(10);
for i=0:9 
    J = find(D==i);
    B = A(:,J);
    [U ,G,V] = svd(B);
    N{i+1}=U(:, 1:k);
    
end


index=-1;
cnt_of_right_guesses=0;
for j=0:n-1
    min =1000;
    for i=0:9
   
    c = norm(AT(:,j+1)-N{i+1}*N{i+1}'*AT(:,j+1));
    if min>c
        min = c;
        index = i;
       
    end
    end
    if index == DT(j+1)
        cnt_of_right_guesses = cnt_of_right_guesses+1;
      
    end
end
success = cnt_of_right_guesses/n*100;

fprintf("Succes is %f persent\n", success);
