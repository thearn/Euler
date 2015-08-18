import Euler_Metal; import Euler_Swift
import XCTest

class Euler2Tests: XCTestCase {
    func testFirstThree() {
        XCTAssertEqual(Euler_Swift.sumOfEvenFibonacciValues(below: 10), 10)
    }

    func testEquality() {
        XCTAssertEqual(
            Euler_Swift.sumOfEvenFibonacciValues(below: 10),
            Euler_Metal.sumOfEvenFibonacciValues(below: 10)
        )
    }

    func testEquality1000() {
        XCTAssertEqual(
            Euler_Swift.sumOfEvenFibonacciValues(below: 1000),
            Euler_Metal.sumOfEvenFibonacciValues(below: 1000)
        )
    }
    
    func test4_000_000() {
        XCTAssertEqual(
            Euler_Swift.sumOfEvenFibonacciValues(below: 4_000_000),
            4_613_732
        )
    }
    
    func testEquality4_000_000() {
        XCTAssertEqual(
            Euler_Swift.sumOfEvenFibonacciValues(below: 4_000_000),
            Euler_Metal.sumOfEvenFibonacciValues(below: 4_000_000)
        )
    }

    func testPerformanceExample_Swift() {
        self.measureBlock {
            Euler_Swift.sumOfEvenFibonacciValues(below: 1_000_000_000)
        }
    }

    func testPerformanceExample_Metal() {
        let euler1 = Euler_Metal.Euler2(limit: 1_000_000_000)
        measureBlock {euler1.compute()}
    }
}