import XCTest
@testable import OpenSwiftUI

final class OpenSwiftUITests: XCTestCase {
    func testExample() {
        let body = VStack {
            Text("Hello")
            Text("World")
        }
        
        let body = HStack {
            if true {
                Text("Hello")
            }
            Text("World")
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
