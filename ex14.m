/* Ankur Ankan (s4753828) */

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

/* Results
 In around 2 hours, I was able to compute values till only 9 digits.

 > apply_pollard();                          
 59
 233
 1409
 57853
 456037
 7796917
 93183199
 996513139

*/
////////////////////////////////
/*    Exercise 14(iii)         */
////////////////////////////////

/* Results
p := NextPrime(Random([(10^7)..((10^8)-1)]));
q := NextPrime(Random([(10^6)..((10^7)-1)]));

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
    x := [Random([(2)..(n-1)])];
    for i := 1 to k do
        x[#x+1] := f(x[#x], c) mod n;
        gcd := GCD(n, (x[#x] - x[#x div 2]));
        if gcd ne 1 then
            return gcd;
        end if;
    end for;
    return 1;
end function;

/* Results
   > p := NextPrime(Random([(10^7)..((10^8)-1)])); 
   > q := NextPrime(Random([(10^6)..((10^7)-1)]));

   > time new_pollard(p*q, 10^7, 0);
   44293871
   Time: 0.080
   > time new_pollard(p*q, 10^7, 1);
   44293871
   Time: 0.060
   > time new_pollard(p*q, 10^7, 2);
   9417689
   Time: 0.030
   > time new_pollard(p*q, 10^7, -2);
   44293871
   Time: 0.020

   The new pollard method is much faster than the original one.
 */
////////////////////////////////
/*    Exercise 14(v)        */
////////////////////////////////

apply_new_pollard := procedure()
    q := NextPrime(Random([(10^25)..((10^26)-1)]));
    for i := 1 to 25 do
        rand := Random([(10^i)..((10^(i+1))-1)]);
        p := NextPrime(rand);
        factor := new_pollard(p*q, 10^((25+i) div 2), 2);
        print(factor);
    end for;
end procedure;

/* Results
 With the new pollard algorithm, I was able to compute the factors for q (25 digits) and p (16 digits) 
 in 2 hours.

 > apply_new_pollard();
 67
 239
 3467
 92831
 414241
 6312547
 88622351
 685914857
 5481333457
 11563545397
 204177342983
 4455437849617
 49581808939249
 513625656658159
 6704810272445309

 */
