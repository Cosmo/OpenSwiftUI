public struct EmptyView: View {
    public typealias Body = Never
    
    public init() {
    }
}

extension EmptyView {
    public var body: Never {
        fatalError()
    }
}
