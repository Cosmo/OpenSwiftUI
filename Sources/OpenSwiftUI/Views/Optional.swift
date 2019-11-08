extension Optional: View where Wrapped: View {
    public var body: Never {
        fatalError()
    }
    
    public typealias Body = Never
    public static func _makeView(view: _GraphValue<Optional<Wrapped>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
    public static func _makeViewList(view: _GraphValue<Optional<Wrapped>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError()
    }
}
