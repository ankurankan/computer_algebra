sieve := function(B)
    all_values := {2..B by 2} diff {3..B by 3} diff {5..B by 5} diff {7..B by 7};
    all_primes := [2, 3, 5, 7];

    for i in all_values do
        all_primes[#all_primes + 1] := i;
        all_values := all_values diff {i..B by i};
    end for;
    return all_primes;
end function;
