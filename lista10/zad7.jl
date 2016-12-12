t = atan(5)

la = 
[(2/5)*t,
0,
(1/125)*(15-28*t),
0,
(399*t-370)/1875,
0,
(2*(10955-9491*t))/78125,
0,
(3324769*t-4223470)/10937500,
0]

function lp(n)
    return 2/(2*n+1)
end

function lePol(x,N)
    if N == 0
        return 1
    end
    if N == 1
        return x
    end

    return ((2*N - 1)/N)*x*lePol(x,N-1) - ((N-1)/N)*lePol(x,N-2)
end

function legendre9(x)
    rtn = 0

    for k in 0:1:9
        rtn += (la[k+1]/lp(k))*lePol(x,k)
    end

    return rtn
end

function runge(x)
    return 1/(25*x*x + 1)
end

function plotLegendre()
    _args = -1:0.01:1

    lvalues = map(legendre9,_args)
    rvalues = map(runge,_args)

    leg = scatter(;x=_args, y=lvalues, mode="lines", name = "legendre")
    run = scatter(;x=_args, y=rvalues, mode="lines", name = "runge")
    
    layout = Layout(;title="legendre approx",xaxis=attr(title="argumenty"),yaxis=attr(title="wartości"))

    plot([leg,run], layout)
end

# TERAZ CZEBYSZEWA

ca = 
[0.616117,
0,
-0.414079,
0,
0.278294,
0,
-0.187035,
0,
0.125702,
0]

function cp(n)
    if n == 0
        return pi
    else 
        return pi/2
    end
end


function cePol(x,k)
    if k == 0
        return 1
    end
    if k == 1
        return x
    end

    return 2*x*cePol(x,k-1) - cePol(x,k-2)
end

function chebyshev9(x)
    rtn = 0

    for k in 0:1:9
        rtn += (ca[k+1]/cp(k))*cePol(x,k)
    end

    return rtn
end

function plotChebyshev()
    _args = -1:0.01:1

    cvalues = map(chebyshev9,_args)
    rvalues = map(runge,_args)

    che = scatter(;x=_args, y=cvalues, mode="lines", name = "chebyshev")
    run = scatter(;x=_args, y=rvalues, mode="lines", name = "runge")
    
    layout = Layout(;title="chebyshev approx",xaxis=attr(title="argumenty"),yaxis=attr(title="wartości"))

    plot([che,run], layout)
end


function error7(f,approxFunction,N)

    max = 0

    for i in -1:2/N:1
        tmp = abs(f(i) - approxFunction(i))
        if  tmp > max
            max = tmp
        end
    end

    return max
end