using DataFrames
using CSV
using Pkg
using Plots
using Pkg
using LaTeXStrings

hamiltonianDimensions = 198
hamiltonian = DataFrame(CSV.File("HamiltonianH2S.csv"))




# print(quantumNumbers)
# for j in 2:198
#     print(hamiltonian[j, 1:4])
#     # quantumNumbers[j, :] = hamiltonian[j, 1:4]
# end
iValue = []
jValue = []
for i in 1:hamiltonianDimensions 
    # Inner For-loop
    for j in 1:hamiltonianDimensions
        append!(iValue, i)
        append!(jValue, j)
        # Print statement
        # print(i, " ")
    end
    # println() 
end
insertcols!(hamiltonian,  1, :j => jValue)
insertcols!(hamiltonian,  1, :i => iValue)

JMapping = Dict{Int, Int}()
Nu1Mapping = Dict{Int, Int}()
Nu2Mapping = Dict{Int, Int}()
Nu3Mapping = Dict{Int, Int}()

# function AssignQuantumNumbersToMatrixIndex(quantumNumberMap, hamiltonianDimensions)
#     for i in range
#     b = length(r)
#     ans = 0
#     for i in 1:b 
#       ans = ans + r[i] 
#     end
#     println(ans)
# end


for i in 1:hamiltonianDimensions
    JMapping[i]   = hamiltonian[i, 3]
    Nu1Mapping[i] = hamiltonian[i, 4]
    Nu2Mapping[i] = hamiltonian[i, 5]
    Nu3Mapping[i] = hamiltonian[i, 6]
end
# print(iValue)
J = []
nu1 = []
nu2 = []
nu3 = []

for i in 1:hamiltonianDimensions
    for j in 1:hamiltonianDimensions
        append!(J, JMapping[i])
        append!(nu1, Nu1Mapping[i])
        append!(nu2, Nu2Mapping[i])
        append!(nu3, Nu3Mapping[i])
    end
end
insertcols!(hamiltonian,  3, :nu3 => nu3)
insertcols!(hamiltonian,  3, :nu2 => nu2)
insertcols!(hamiltonian,  3, :nu1 => nu1)
insertcols!(hamiltonian,  3, :J => J)

hamiltonian = filter(row -> row.i <= row.j, hamiltonian)
# print(hamiltonian[1:5, 3:11])
print(hamiltonian[:, 3:11])
CSV.write("H2SHamiltonianWithQuantumNumbers.csv", hamiltonian[:, 3:11])




# histogram(hamiltonian.Energy)
# xlabel!(L"Matrix Element cm$^{-1}$")
# ylabel!("Frequency")
# xlims!(-10, 10)
# # plot!(xscale=:log10)
# savefig("myplot.png") 
# display(histogram)