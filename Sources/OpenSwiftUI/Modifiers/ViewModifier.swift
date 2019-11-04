public protocol ViewModifier {
    associatedtype Body: View
    associatedtype Content
    func body(content: Self.Content) -> Self.Body
}

extension ViewModifier where Self.Body == Never {
    public func body(content: Self.Content) -> Self.Body {
        fatalError()
    }
}

extension ViewModifier {
    public func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        return ModifiedContent(content: self, modifier: modifier)
    }
}
