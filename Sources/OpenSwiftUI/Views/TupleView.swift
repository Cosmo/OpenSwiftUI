import Foundation

public struct TupleView<T>: View {
    public var value: T
    public typealias Body = Never
    
    public init(_ value: T) {
        self.value = value
    }
}
