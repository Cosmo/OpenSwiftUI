public protocol EnvironmentalModifier : ViewModifier where Self.Body == Never {
    associatedtype ResolvedModifier : ViewModifier
    func resolve(in environment: EnvironmentValues) -> Self.ResolvedModifier
}

extension EnvironmentalModifier {
    public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError()
    }
    public static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError()
    }
}
