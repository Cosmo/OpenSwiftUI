public struct _BackgroundModifier<Background>: ViewModifier where Background: View {
    public typealias Body = Never
    public typealias Content = View
    
    public let background: Background
    public let alignment: Alignment
    
    init(background: Background, alignment: Alignment) {
        self.background = background
        self.alignment = alignment
    }
}

extension _BackgroundModifier {
    public static func _makeView(modifier: _GraphValue<_BackgroundModifier<Background>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError()
    }
}

extension View {
    public func background<Background>(_ background: Background, alignment: Alignment = .center) -> some View where Background: View {
        return modifier(
            _BackgroundModifier(background: background, alignment: alignment))
    }
}
