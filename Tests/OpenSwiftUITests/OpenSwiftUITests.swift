import XCTest
@testable import OpenSwiftUI

final class OpenSwiftUITests: XCTestCase {
    func testExample() {
        let _ = VStack {
            Text("Hello")
            Text("World")
        }
        
        let _ = HStack {
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
