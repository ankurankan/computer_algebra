///////////////////////
/* Exercise 5(i)     */
///////////////////////

/* Binomial Coefficient using the relation nCk = nC(k-1) (n-k+1)/k */
function coeff1(n, k)
    if k eq 1 then
        return n;
    else
        return ((n-k+1)/k) * coeff1(n, k-1);
    end if;
end function;

/* Binomial coefficient using recursion */
function coeff2(n, k)
    if k eq 1 then
       return n;
    elif n eq k then
       return 1;
    else
       value := coeff2(n-1, k) + coeff2(n-1, k-1);
       return value;
    end if;
 end function;

////////////////////////
/* Exercise 5(ii)     */
////////////////////////
coeff1(2880, 1079);
coeff2(2880, 1079);

