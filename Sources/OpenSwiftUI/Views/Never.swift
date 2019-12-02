extension Never {
    public typealias Body = Never
    public var body: Never {
        get {
            fatalError()
        }
    }
}

extension Never: View {
}
