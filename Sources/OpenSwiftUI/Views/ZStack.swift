import Foundation

public struct ZStack<Content>: View where Content: View {
    public typealias Body = Never
    public let _content: Content
    public let _alignment: Alignment
    
    public init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) {
        self._alignment = alignment
        self._content = content()
    }
}

extension ZStack {
    public var body: Never {
        fatalError()
    }
}
