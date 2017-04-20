////////////////////////////////
/*    Exercise 13(i)          */
////////////////////////////////

/* Function to compute k and m for N-1 = 2^k * m */
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

/* Function to compute the next prime number */
MyNextPrime := function(N, n)
    while MyIsPrime(N, n) eq 0 do
        N +:= 1;
    end while;
    return N;
end function;

////////////////////////////////
/*    Exercise 13(ii)         */
////////////////////////////////
compute_next_primes := procedure()
    m := [128, 256, 512, 1024];
    for i in m do
        print(MyNextPrime(2^i, 10));
        print("\n");
    end for;
end procedure;

/*    Results    
340282366920938463463374607431768211507

115792089237316195423570985008687907853269984665640564039457584007913129640233

1340780792994259709957402499820584612747936582059239337772356144372176403007354\
6976801874298166903427690031858186486050853753882811946569946433649006084171

1797693134862315907729305190789024733617976978942306572734300811577326758055009\
6313270847732240753602112011387987139335765878976881441662249284743063947412437\
7767893424865485276302219601246094119453082952085005768838150682342462881473913\
110540827237163350510684586298239947245938479716304835356329624224137859
*/

////////////////////////////////
/*    Exercise 13(iii)        */
////////////////////////////////
generate_fermat := function(n)
    return 2^(2^n) + 1;
end function;

check_fermat_prime := procedure()
    for n in [1..20] do
        is_prime := MyIsPrime(generate_fermat(n), 10);
        if is_prime eq 1 then
            print "F", n, "is prime";
        else
            print "F", n, "is not prime";
        end if;
    end for;
end procedure;

////////////////////////////////
/*    Exercise 13(iv)         */
////////////////////////////////
check_timing := function(n)
    t := [];
//    for n in [1000..2000] do
    rand := Random([(10^n)..(10^(n+1))]);
    p := NextPrime(rand);
    t_0 := Cputime();
    _ := MyIsPrime(p, 10);
    t_1 := Cputime();
    print t_1 - t_0;
    t[#t + 1] := (t_1 - t_0);
//    end for;
    return t;
end function;
