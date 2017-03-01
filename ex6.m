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
