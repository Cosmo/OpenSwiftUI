public struct _ConditionalContent<TrueContent, FalseContent>: View where TrueContent: View, FalseContent: View {
    public enum Storage {
        case first(TrueContent)
        case second(FalseContent)
    }
    
    public typealias Body = Never
    public let _storage: Storage
    
    init(first: TrueContent) {
        _storage = .first(first)
    }
    
    init(second: FalseContent) {
        _storage = .second(second)
    }
}

extension _ConditionalContent {
    public var body: Never {
        fatalError()
    }
}
