public func sumOfEvenFibonacciValues(below limit: Int) -> Int {
    var values = (1, 1)
    var sum = 0
    repeat {
        let newValue = values.0 + values.1
        if newValue.divisible(by: 2) {sum += newValue}
        values.0 = values.1
        values.1 = newValue
    } while values.1 < limit
    return sum
}