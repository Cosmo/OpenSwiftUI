import Foundation

public struct HStack<Content>: View where Content: View {
    public typealias Body = Never
    let content: Content
    let alignment: VerticalAlignment
    let spacing: CGFloat?
    
    public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }
}
