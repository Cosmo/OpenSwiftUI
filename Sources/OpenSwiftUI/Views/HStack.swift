import Foundation

public struct HStack<Content>: View where Content: View {
    public typealias Body = Never
    public let _content: Content
    public let _alignment: VerticalAlignment
    public let _spacing: CGFloat?
    
    public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self._alignment = alignment
        self._spacing = spacing
        self._content = content()
    }
}
