import Foundation

public struct ZStack<Content>: View where Content: View {
    public typealias Body = Never
    let content: Content
    let alignment: Alignment
    
    public init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.content = content()
    }
}
