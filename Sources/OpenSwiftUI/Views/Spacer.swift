import Foundation

public struct Spacer: View, Equatable {
    public typealias Body = Never
    
    public init() {
    }
}

extension Spacer {
    public var body: Never {
        fatalError()
    }
}
