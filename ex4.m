/* Ankur Ankan (s4753828) */
////////////////////
/* Exercise 4(i)  */
////////////////////


sieve := function(B)
    /* Reducing the size of the all_values set. */
    all_values := {2..B by 2} diff {3..B by 3} diff {5..B by 5} diff {7..B by 7};
    all_primes := [2, 3, 5, 7];

    for i in all_values do
        all_primes[#all_primes + 1] := i;
        all_values := all_values diff {i..B by i};
    end for;
    return all_primes;
end function;


//////////////////////
/* Exercise 4(ii)   */
//////////////////////
sieve_encoding := function(B)
    all_primes := [1 : i in [1..B]];
    all_primes[1] := 0;

    for i in [2..B] do
        if all_primes[i] eq 1 then
            multiples := i*2;
            while multiples le B do
                all_primes[multiples] := 0;
                multiples +:= i;
            end while;
        end if;
    end for;
    return all_primes;
end function;


///////////////////////
/* Exercise 4(iii)   */
///////////////////////
nth_prime := function(primes, n)
    count := 0;
    for index in [1..#primes] do
        if primes[index] eq 1 then
            count +:= 1;
            if count eq n then
                return index;
            end if;
        end if;
    end for;
end function;

