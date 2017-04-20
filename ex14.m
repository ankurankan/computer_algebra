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

wiki_pollard := function(n, k, c)
    x := 2;
    y := 2;
    d := 1;

    while d eq 1 do
        x := f(x, c);
        y := f(f(x, c), c);
        d := GCD(EuclideanNorm(x - y), n);
    end while;
    if d eq n then
        return 1;
    else
        return d;
    end if;
end function;

////////////////////////////////
/*    Exercise 14(ii)         */
////////////////////////////////
apply_pollard := procedure()
    q := NextPrime(Random([(10^25)..((10^26)-1)]));
    for i := 1 to 25 do
        rand := Random([(10^i)..((10^i+1)-1)]);
        p := NextPrime(rand);
        factor := pollard(p*q, 10^((25+i) div 2), 2);
        print(factor);
    end for;
end procedure;


////////////////////////////////
/*    Exercise 14(ii)         */
////////////////////////////////
check_c := procedure()
    c_values := [0, 1, 2, -2];
    q := NextPrime(Random([(10^10)..((10^11)-1)]));
    p := NextPrime(Random([(10^11)..((10^12)-1)]));
    for c in c_values do
        t_0 := Cputime();
        factor := pollard(p*q, 10^11, c);
        t_1 := Cputime();
        print t_1 - t_0;
    end for;
end procedure;


////////////////////////////////
/*    Exercise 14(iii)        */
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
/*    Exercise 14(iii)        */
////////////////////////////////

