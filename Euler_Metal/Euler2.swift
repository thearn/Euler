public func sumOfEvenFibonacciValues(below limit: Int) -> Int {
    return Euler2(limit: limit).compute()
}

public class Euler2: EulerProblem {
    public init(limit: Int) {super.init(
        functionName: "sumOfEvenFibonacciValues",
        limit: limit,
        threadgroupsPerGrid: {_ in 1},
        threadsPerGroup: {_ in 1}
    )}
}