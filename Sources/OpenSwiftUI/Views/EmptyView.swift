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

extension EmptyView {
    public static func _makeView(view: _GraphValue<EmptyView>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
    
    public static func _makeViewList(view: _GraphValue<EmptyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError()
    }
}
