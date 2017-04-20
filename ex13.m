find_k_m := function(N)
    k := 0;
    m := N;
    while true do
        q, r := Quotrem(m, 2);
        if r eq 0 then
            k +:= 1;
            m := q;
        else
            return k, m;
        end if;
    end while;
end function;

MyIsPrime := function(N, n)
    if N eq 1 then
        return -1;
    elif (N eq 2) or (N eq 3) then
        return 1;
    end if;

    k, m := find_k_m(N-1);
    for iter := 1 to n do
        a := Random([2..N-2]); 
        x := Modexp(a, m, N);
        if (x eq 1) or (x eq N-1) then
            continue iter;
        end if;
        for i := 2 to k do
            x := Modexp(x, 2, N);
            if x eq 1 then
                return 0;
            end if;
            if x eq N-1 then
                continue iter;
            end if;
        end for;
        return 0; 
    end for;
    return 1;
end function;

MyNextPrime := function(N)
    while MyIsPrime(N) eq 0 do
        N +:= 1;
    end while;
    print(N);
end function;

