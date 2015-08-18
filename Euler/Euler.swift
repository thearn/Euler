extension SequenceType where
    Generator.Element: IntegerLiteralConvertible,
    Generator.Element: IntegerArithmeticType
{
    var sum: Generator.Element {return self.reduce(0, combine: +)}
}

extension IntegerLiteralConvertible where Self: IntegerArithmeticType {
    func divisible(by divisor: Self) -> Bool {return self % divisor == 0}
}