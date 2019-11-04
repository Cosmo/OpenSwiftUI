public struct _BackgroundModifier<Background>: ViewModifier where Background: View {
    public typealias Body = Never
    public typealias Content = View
    
    let background: Background
    let alignment: Alignment
    
    init(background: Background, alignment: Alignment) {
        self.background = background
        self.alignment = alignment
    }
}

extension View {
    public func background<Background>(_ background: Background, alignment: Alignment = .center) -> some View where Background : View {
        return modifier(
            _BackgroundModifier(background: background, alignment: alignment))
    }
}
