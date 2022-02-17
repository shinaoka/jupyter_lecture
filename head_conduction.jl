using Plots


function solve()
    println("Solving...")
    x = Array(0:0.1:100)
    u = 200 .* ℯ.^( .-0.01 .*( x .- 50).^2) .+ 27
    plot(x,u)

    u_next = copy(u)
    dt = 0.1
    dx = x[2] - x[1]
    a=2
    t_max = 5000
    t=0
    d = 0
    
    while t_max >= t
        for i in 1:length(x)
            if i == 1 || i == length(x)
                continue
            else
                u_next[i] = a*(u[i+1] - 2*u[i] + u[i-1])*dt/(dx)^2 + u[i] #熱伝導方程式
            end
        end
        if d != 0
            if d%8000 == 0
                plot!(x,u)
            end
        end
        u = copy(u_next)
        t += dt
        d += 1
    end

    plot!()
end

solve()
