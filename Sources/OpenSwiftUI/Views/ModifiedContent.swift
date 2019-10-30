import Foundation

public protocol ViewModifier {
    associatedtype Body: View
    associatedtype Content
    func body(content: Self.Content) -> Self.Body
}

extension ViewModifier where Self.Body == Never {
    public func body(content: Self.Content) -> Self.Body {
        fatalError("ViewModifier:body")
    }
}

extension ViewModifier {
    public func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        return ModifiedContent(content: self, modifier: modifier)
    }
}

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
        get {
            fatalError("##################")
        }
    }
}

extension ModifiedContent: ViewModifier where Content: ViewModifier, Modifier: ViewModifier {
}
