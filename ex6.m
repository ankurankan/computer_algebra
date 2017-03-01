////////////////////////////////
/*   Exercise 6(i)            */
////////////////////////////////

euclid := function(a, b)
    while true do
        q, r := Quotrem(a, b);
        if r eq 0 then
            return b;
        else
            a := b;
            b := r;
        end if;
    end while;
end function;

////////////////////////////////
/*   Exercise 6(ii)           */
////////////////////////////////

/* Function to just remove some repititivie code */
assign := function(old_value, value, quotient)
    return value, old_value - quotient * value;
end function;

extended_euclid := function(a, b)
    s := 0;
    old_s := 1;
    t := 1;
    old_t := 0;
    r := b;
    old_r := a;

    while r ne 0 do
        quotient, _ := Quotrem(old_r, r);
        old_r, r := assign(old_r, r, quotient);
        old_s, s := assign(old_s, s, quotient);
        old_t, t := assign(old_t, t, quotient);    
    end while; 
    return old_r, t, s;
end function;

////////////////////////////////
/*   Exercise 6(iv)           */
////////////////////////////////

/* Function to find common factors in factorized tuples */
common_factors := function(factors_a, factors_b)
    common := [];
    for i in factors_a do
        for j in factors_b do
            if i[1] eq j[1] then
                common[#common + 1] := <i[1], Min(i[2], j[2])>;
            end if;
        end for;
    end for;
    return common;
end function;

gcd_factorization := function(a, b)
    factors_a := Factorization(a);
    factors_b := Factorization(b);
   
    /* Just to speedup when one number is too large */
    if #factors_a lt #factors_b then
        gcd := common_factors(factors_a, factors_b);
    else
        gcd := common_factors(factors_b, factors_a);
    end if;

    final_gcd := 1;
    for i in gcd do
        final_gcd *:= i[1]^i[2];
    end for;
    return final_gcd;
end function;

////////////////////////////////
/*   Exercise 6(v)            */
////////////////////////////////

compare := function(k)
    a := Random(10^k, 10^(k+1));
    b := Random(10^k, 10^(k+1));

    timings := [];
    for func in [euclid, extended_euclid, gcd_factorization] do
        t := Cputime();
        gcd := func(a, b);
        timings[#timings + 1] := Cputime(t);
    end for;
    print "Euclid's algorithm took: ", timings[1], "Extended Euclid's took: ", timings[2], "Factorization took: ", timings[3];
    return 0;
end function;
