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

extension _ConditionalContent {
    public static func _makeView(view: _GraphValue<_ConditionalContent<TrueContent, FalseContent>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
    public static func _makeViewList(view: _GraphValue<_ConditionalContent<TrueContent, FalseContent>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError()
    }
}
