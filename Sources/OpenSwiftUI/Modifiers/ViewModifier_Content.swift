public struct _ViewModifier_Content<Modifier> where Modifier: ViewModifier {
    public typealias Body = Never
    public static func _makeView(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
    public static func _makeViewList(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError()
    }
}

extension _ViewModifier_Content: View {
    public var body: Never {
        fatalError()
    }
}
