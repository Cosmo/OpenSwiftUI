public struct AnyView: View {
    public let viewType: Any.Type
    public typealias Body = Never
    
    public init<V: View>(_ view: V) {
        self.viewType = V.self
    }
    
    public var body: Never {
        fatalError()
    }
}
