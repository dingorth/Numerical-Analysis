f(x) = x^2
df(x) = 2x

function newton( f, df, desired_er::BigFloat, max_iter,
 starting_point::BigFloat )
    prev = starting_point
    n = 1
    while true
        next = prev - f(prev)/df(prev)
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

newton(f, df, BigFloat(1)/100000000, 100, BigFloat(30) )