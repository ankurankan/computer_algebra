function coeff1(n, k)
    if k eq 1 then
        return n;
    else
        return ((n-k+1)/k) * coeff1(n, k-1);
    end if;
end function;

memo := [];

function hash(a, b, n)
    return a + b * n;
end function;

function coeff2(n, k)
     if k eq 1 then
         return n;
     elif n eq k then
         return 1;
     else
         return coeff2(n-1, k) + coeff2(n-1, k-1);
     end if;
 end function;
