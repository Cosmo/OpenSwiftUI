import Foundation

public struct VStack<Content>: View where Content: View {
    public typealias Body = Never
    public let _content: Content
    public let _alignment: HorizontalAlignment
    public let _spacing: CGFloat?
    
    public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self._alignment = alignment
        self._spacing = spacing
        self._content = content()
    }
}
