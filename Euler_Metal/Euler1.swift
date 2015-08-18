public func sumOfMultiplesOf3or5(below limit: Int) -> Int {
    return Euler1(limit: limit).compute()
}

public class Euler1: EulerProblem {
    public init(limit: Int) {super.init(
        functionName: "sumOfMultiplesOf3or5",
        limit: limit,
        threadgroupsPerGrid: {threadExecutionWidth in
            limit / threadExecutionWidth + 1
        },
        threadsPerGroup: {threadExecutionWidth in threadExecutionWidth}
    )}
}