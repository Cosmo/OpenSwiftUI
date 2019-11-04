public struct _ConditionalContent<TrueContent, FalseContent>: View where TrueContent: View, FalseContent: View {
    public enum Storage {
        case trueContent(TrueContent)
        case falseContent(FalseContent)
    }
    
    public typealias Body = Never
    public let _storage: Storage
    
    init(storage: Storage) {
        _storage = storage
    }
}

extension _ConditionalContent {
    public var body: Never {
        fatalError()
    }
}
