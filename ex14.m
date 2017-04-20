////////////////////////////////
/*    Exercise 14(i)          */
////////////////////////////////

f := function(x, c)
    return x^2 + c;
end function;

pollard := function(n, k, c)
    x := [Random([2..(n-1)])];
    for i := 1 to k do
        x[#x+1] := f(x[#x], c) mod n;
        for j := 1 to (#x-1) do
            gcd := GCD(n, (x[#x] - x[j]));
            if gcd ne 1 then
                return gcd;
            end if;
        end for;
    end for;
    return 1;
end function;

////////////////////////////////
/*    Exercise 14(ii)         */
////////////////////////////////
apply_pollard := procedure()
    q := NextPrime(Random([(10^25)..((10^26)-1)]));
    for i := 1 to 25 do
        rand := Random([(10^i)..((10^(i+1))-1)]);
        p := NextPrime(rand);
        factor := pollard(p*q, 10^((25+i) div 2), 2);
        print(factor);
    end for;
end procedure;


////////////////////////////////
/*    Exercise 14(iii)         */
////////////////////////////////
check_c := procedure()
    c_values := [0, 1, 2, -2];
    q := NextPrime(Random([(10^6)..((10^7)-1)]));
    p := NextPrime(Random([(10^7)..((10^8)-1)]));
    for c in c_values do
        t_0 := Cputime();
        factor := pollard(p*q, 10^7, c);
        t_1 := Cputime();
        print t_1 - t_0;
    end for;
end procedure;

/* Results
> time pollard(p*q, 10^7, 0);
29249393
Time: 5.670
> time pollard(p*q, 10^7, 1);
3605027
Time: 3.220
> time pollard(p*q, 10^7, 2);
3605027
Time: 2.530
> time pollard(p*q, 10^7, -2);
29249393
Time: 6.270

c = -2 seems to take the most time in finding the factor.
 */

////////////////////////////////
/*    Exercise 14(iv)        */
////////////////////////////////
new_pollard := function(n, k, c)
    x := [Random([2..(n-1)])];
    for i := 1 to k do
        x[#x+1] := f(x[#x], c) mod n;
        gcd := GCD(n, (x[#x] - x[#x mod 2]));
        if gcd ne 1 then
            return gcd;
        end if;
    end for;
    return 1;
end function;


////////////////////////////////
/*    Exercise 14(v)        */
////////////////////////////////


