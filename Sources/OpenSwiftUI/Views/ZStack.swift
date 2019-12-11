public struct ZStack<Content>: View where Content: View {
    public typealias Body = Never
    public var _tree: _VariadicView.Tree<_ZStackLayout, Content>
    
    public init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) {
        _tree = .init(
            root: _ZStackLayout(alignment: alignment), content: content())
    }
}

extension ZStack {
    public var body: Never {
        fatalError()
    }
}

extension ZStack {
    public static func _makeView(view: _GraphValue<ZStack<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
}
