public func sumOfMultiplesOf3or5(below limit: Int) -> Int {
    return LazySequence(3..<limit)
        .filter {$0.divisible(by: 3) || $0.divisible(by: 5)}
        .sum
}