using DataFrames
using CSV
using Pkg
using Plots
using LaTeXStrings
# using ScikitLearn
using Random
using GLM
using StatsBase
using MLBase
using ROCAnalysis

hamiltonian = DataFrame(CSV.File("H2SHamiltonianWithQuantumNumbers.csv"))
energyCutOff = 2
insertcols!(hamiltonian, 10, :setToZero => abs.(hamiltonian.Energy) .< energyCutOff)

Random.seed!(123)


testFraction = 0.2

isTesting = rand(size(hamiltonian, 1)) .< testFraction

trainingHamiltonian = hamiltonian[.!isTesting, :]
trainingQuantumNumbers = trainingHamiltonian[:, 1:8]
trainingSetToZero = trainingHamiltonian[:, 10]

testingHamiltonian = hamiltonian[isTesting, :]
testingQuantumNumbers = testingHamiltonian[:, 1:8]
testingSetToZero = testingHamiltonian[:, 10]

# print(size(testingHamiltonian[:, 1]))
# print(size(trainingHamiltonian[:, 1]))
numberSetToZero = size(filter(row -> row.setToZero == 1, hamiltonian)[:, 1])[1]
numberOfElementsKept = size(hamiltonian[:, 1])[1] - numberSetToZero
print("Number of elements that should be set to zero: ", numberSetToZero)
println()
print("Number of elements that should be kept: ", numberOfElementsKept)
println()
numberSetToZero = size(filter(row -> row.setToZero == 1, trainingHamiltonian)[:, 1])[1]
numberOfElementsKept = size(trainingHamiltonian[:, 1])[1] - numberSetToZero
print("Number of elements that should be set to zero: ", numberSetToZero)
println()
print("Number of elements that should be kept: ", numberOfElementsKept)
println()

modelParameters = @formula(setToZero ~ bJ + bnu1 + bnu2 + 
              bnu3 + kJ + knu1 + knu2 +
              knu3)
@time model = glm(modelParameters, trainingHamiltonian, Binomial(), ProbitLink())
predictedTestSetToZero = predict(model, testingQuantumNumbers) .>= 0.5
# print(Int.(predictedTestSetToZero .=== predictedTestSetToZero))
# println()
# accuracy = sum(Int.(predictedTestSetToZero .== predictedTestSetToZero))*100/size(predictedTestSetToZero)
# print(testingSetToZero[1:20])
# println()
# print(predictedTestSetToZero[1:20])
# println()
# print(sum(Int.(predictedTestSetToZero .== testingSetToZero))*100/size(testingSetToZero)[1])
# println()
# print(accuracy)
# accuracy = sum(predictedTestSetToZero .== testingSetToZero)*100/size(predictedTestSetToZero)
# print(accuracy)
println()

# print(hamiltonian[1:5,:])
# println()
# print(abs.(hamiltonian.Energy[1:5]) .< energyCutOff)
# println()



# model = LogisticRegression()


# fit!(model, trainingQuantumNumbers, trainingSetToZero)
