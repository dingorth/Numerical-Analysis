set_bigfloat_precision(128)

function c(k)
    if k == 2
        return big"0"
    end

    return sqrt(BigFloat(0.5)*(BigFloat(1)+c(k-BigFloat(1))))
end

function s(k)
    if k == 2
        return big"1"
    end

    return sqrt(BigFloat(0.5)*(BigFloat(1)-c(k-BigFloat(1))))
end

function P(k)
    if k == 2
        return big"2"
    end

    return big"2"^(k-BigFloat(1)) * s(k)
end


t = 52

i = big"2"
while i <= t
    z = BigFloat(P(i))
    @printf("2^%d | wynik: %.20f | roznica: %e\n",i, z, z - pi )
    i +=1
end