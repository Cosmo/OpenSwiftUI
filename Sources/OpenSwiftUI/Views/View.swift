public protocol View {
    associatedtype Body: View
    var body: Self.Body { get }
}

extension View where Body == Never {
    public var body: Never {
        fatalError()
    }
}
