import Euler_Metal; import Euler_Swift
import XCTest

class Euler1Tests: XCTestCase {
    func test23_Swift() {
        XCTAssertEqual(Euler_Swift.sumOfMultiplesOf3or5(below: 10), 23)
    }
    
    func testEquality10() {
        XCTAssertEqual(
            Euler_Swift.sumOfMultiplesOf3or5(below: 10),
            Euler_Metal.sumOfMultiplesOf3or5(below: 10)
        )
    }
    
    func testEquality100() {
        XCTAssertEqual(
            Euler_Swift.sumOfMultiplesOf3or5(below: 100),
            Euler_Metal.sumOfMultiplesOf3or5(below: 100)
        )
    }
    
    func testPerformanceExample_Swift() {
        self.measureBlock {
            Euler_Swift.sumOfMultiplesOf3or5(below: 5_000_000)
        }
    }
    
    func testPerformanceExample_Metal() {
        measureBlock {Euler_Metal.sumOfMultiplesOf3or5(below: 5_000_000)}
    }
    
    func testPerformanceExample_Metal_Fast() {
        let euler1 = Euler_Metal.Euler1(limit: 5_000_000)
        measureBlock {euler1.compute()}
    }
}