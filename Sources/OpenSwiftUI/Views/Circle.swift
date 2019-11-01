import Foundation

public struct Circle: View, Equatable {
    public typealias Body = Never
    
    public init() {
    }
}

extension Circle {
    public var body: Never {
        fatalError()
    }
}
