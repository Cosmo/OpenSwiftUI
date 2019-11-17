import Foundation

public struct _HStackLayout {
    public var alignment: VerticalAlignment
    public var spacing: CoreGraphics.CGFloat?
    @inlinable public init(alignment: VerticalAlignment = .center, spacing: CoreGraphics.CGFloat? = nil) {
        self.alignment = alignment
        self.spacing = spacing
    }
    public typealias Body = Never
}

extension _HStackLayout: _VariadicView_UnaryViewRoot {}
