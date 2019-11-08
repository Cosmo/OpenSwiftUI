public struct _ViewModifier_Content<Modifier> where Modifier: ViewModifier {
    public typealias Body = Never
}

public protocol ViewModifier {
    associatedtype Body: View
    // associatedtype Content
    typealias Content = _ViewModifier_Content<Self>
    func body(content: Self.Content) -> Self.Body
}

extension ViewModifier where Self.Body == Never {
    public func body(content: Self.Content) -> Self.Body {
        fatalError()
    }
}

extension ViewModifier {
    public func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        return .init(content: self, modifier: modifier)
    }
}
