import XCTest
@testable import OpenSwiftUI

final class OpenSwiftUITests: XCTestCase {
    func testExample() {
        let body = VStack {
            Text("Hello")
            Text("World")
        }
        
    }

    func testAnyViewFromValueWithInDoesNotYieldView() {
        let anyView = AnyView(_fromValue: 42)
        XCTAssertNil(anyView)
    }

    func testAnyViewFromValueWithTextYieldsAnyView() {
        let expectedText = "Hello"
        let value: Any = Text(expectedText)
        let anyView = AnyView(_fromValue: value)
        XCTAssertNotNil(anyView)

        guard let storage = anyView?._storage as? AnyViewStorage<Text> else {
            XCTFail("View storage is not an AnyViewStorage of Text")
            return
        }

        switch storage._view._storage {
        case .verbatim(let string):
            XCTAssertEqual(string, expectedText)
        case .anyTextStorage(let storage):
            XCTAssertEqual(storage.storage, expectedText)
        }
    }

    static var allTests = [
        ("testExample", testExample),
        ("testAnyViewFromValueWithInDoesNotYieldView", testAnyViewFromValueWithInDoesNotYieldView),
        ("testAnyViewFromValueWithTextYieldsAnyView", testAnyViewFromValueWithTextYieldsAnyView),
    ]
}
