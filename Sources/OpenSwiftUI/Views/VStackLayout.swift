#if canImport(Foundation)
import Foundation
#endif

#if canImport(CoreGraphics)
import CoreGraphics
#else
import CoreGraphicsShim
#endif

public struct _VStackLayout {
    public var alignment: HorizontalAlignment
    public var spacing: CGFloat?
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil) {
        self.alignment = alignment
        self.spacing = spacing
    }
    public typealias Body = Never
}

extension _VStackLayout: _VariadicView_UnaryViewRoot {}
extension _VStackLayout: _VariadicView_ViewRoot {}
