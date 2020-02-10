import XCTest
@testable import GISIBKit

final class GISIBKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GISIBKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
