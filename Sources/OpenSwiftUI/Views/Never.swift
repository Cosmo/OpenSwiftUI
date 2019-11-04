extension Never {
    public typealias Body = Never
    
    public var body: Never {
        fatalError()
    }
}

extension Never: View {
}
