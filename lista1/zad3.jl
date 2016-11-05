w32a(x) = x*x*x - 6*x*x + 3*x - Float32(0.149)
w64a(x) = x*x*x - 6*x*x + 3*x - Float64(0.149)

w32b(x) = (((x-6)*x) + 3) * x - Float32(0.149)
w64b(x) = (((x-6)*x) + 3) * x - Float64(0.149)

x32 = Float32(4.71)
x64 = Float64(4.71)
x = -14.636489

blad_bezwzgledny(a,b) = abs(a - b)
blad_wzgledny(a,x) = blad_bezwzgledny(a,x) / abs(x)

println("gsdf")

#=
@printf "blad_wzgledny 32 bity wersja a: %f\n" blad_wzgledny(w32a(x32),x)
@printf "blad_wzgledny 64 bity wersja a: %f\n" blad_wzgledny(w64a(x64),x)
@printf "blad_wzgledny 32 bity wersja b: %f\n" blad_wzgledny(w32b(x32),x)
@printf "blad_wzgledny 64 bity wersja b: %f\n" blad_wzgledny(w64b(x64),x)
=#
