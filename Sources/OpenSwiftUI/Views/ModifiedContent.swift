public struct ModifiedContent<Content, Modifier> {
    public var content: Content
    public var modifier: Modifier
    public init(content: Content, modifier: Modifier) {
        self.content = content
        self.modifier = modifier
    }
}

extension ModifiedContent: View where Content: View, Modifier: ViewModifier {
    public typealias Body = Never
    public var body: ModifiedContent<Content, Modifier>.Body {
        fatalError()
    }
}

extension ModifiedContent: ViewModifier where Content: ViewModifier, Modifier: ViewModifier {
}
