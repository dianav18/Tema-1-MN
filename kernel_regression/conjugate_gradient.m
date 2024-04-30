function [x] = conjugate_gradient(A, b, x0, tol, max_iter)
    r = b - A * x0;         
    v = r;                   
    x = x0;                  
    tolSquared = tol^2;     
    k = 1;               

    while k <= max_iter && (r' * r) > tolSquared              
        tk = (r' * r) / (v' * A * v);        
        x = x + tk * v;                
        r_new = r - tk * A * v;           
        sk = (r_new' * r_new) / (r' * r);       
        v = r_new + sk * v;             
        r = r_new;
        k = k + 1;     
    end
end
