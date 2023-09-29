using DataFrames
using CSV
using Pkg
using Plots
using LaTeXStrings
using ScikitLearn

hamiltonian = DataFrame(CSV.File("H2SHamiltonianWithQuantumNumbers.csv"))
print(hamiltonian[1:5, :])