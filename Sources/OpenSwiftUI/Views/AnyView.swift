import Foundation

public struct AnyView: View {
    public let viewType: Any.Type
    
    public init<V: View>(_ view: V) {
        self.viewType = V.self
    }
    
    public typealias Body = Never
}

extension AnyView {
    public var body: Never {
        fatalError()
    }
}

extension AnyView: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "AnyView"
    }
}
