#if canImport(Foundation)
import Foundation
#else
import CoreGraphicsShim
#endif

public struct _ShapeView<Content, Style>: View where Content: Shape, Style: ShapeStyle {
    public var body: Never {
        fatalError()
    }
    
    public var shape: Content
    public var style: Style
    public var fillStyle: FillStyle
    
    public init(shape: Content, style: Style, fillStyle: FillStyle = FillStyle()) {
        self.shape = shape
        self.style = style
        self.fillStyle = fillStyle
    }
    
    public static func _makeView(view: _GraphValue<_ShapeView<Content, Style>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
    
    public typealias Body = Never
}
