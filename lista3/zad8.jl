set_bigfloat_precision(128)

f(x::BigFloat) = e^(-x) - sin(x)


function steffensen( f, desired_er::BigFloat, max_iter, starting_point::BigFloat )
    prev = starting_point
    n = 1
    while true
        next = prev - ( f(prev)^2 / ( f(prev + f(prev)) - f(prev) ) )
        n += 1
        current_er = abs(next - prev)
        @printf("Iter %d | %.20f | current error: %e | value: %e\n",n,next,
            current_er,f(next));
        if current_er <= desired_er || n >= max_iter 
            break;
        end
        prev = next
    end
end

steffensen(f,BigFloat(1)/1000000000000000,100,BigFloat(5))
