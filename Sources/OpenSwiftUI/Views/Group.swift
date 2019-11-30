public struct Group<Content> {
    public var _content: Content
}

extension Group: View where Content: View {
    public typealias Body = Never
    
    public init(@ViewBuilder content: () -> Content) {
        self._content = content()
    }
    
    public static func _makeViewList(view: _GraphValue<Group<Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError()
    }
    
    public var body: Never {
        fatalError()
    }
}
