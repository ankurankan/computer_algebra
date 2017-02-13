max_pow := function(n: k:=2)
    i := -1;
    while k^(i+1) le n do
        i +:= 1;
    end while;
    return i;
end function;

sequence := function(n: k:=2)
    max_ := max_pow(n);
    seq_ := [];

    while max_ ge 0 do
        value := k^max_;
        if n ge value then
            seq_[#seq_ + 1] := 1;
            n -:= value;
        else
            seq_[#seq_ + 1] := 0;
        end if;
        max_ -:= 1;
    end while;
    return Reverse(seq_);
end function;

modx := function(a, m, n)
    mod_value := 1;
    seq_ := sequence(m);
    last_value := a mod n;

    if m eq 0 then
        return 1 mod n;
    end if;

    if seq_[1] eq 1 then
        mod_value := last_value;
    end if;

    for i in [2..#seq_] do
        last_value := last_value^2 mod n;
        if seq_[i] eq 1 then
            mod_value := (mod_value * last_value) mod n;
        end if;
    end for;
    return mod_value;
end function;
