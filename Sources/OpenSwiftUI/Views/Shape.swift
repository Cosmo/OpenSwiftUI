#if canImport(Foundation)
import Foundation
#endif

#if canImport(CoreGraphics)
import CoreGraphics
#else
import CoreGraphicsShim
#endif

public protocol Shape: Animatable, View {
    func path(in rect: CGRect) -> Path
}

extension Shape {
    public var body: _ShapeView<Self, ForegroundStyle> {
        fatalError()
    }
}



public protocol ShapeStyle {
    static func _makeView<S>(view: _GraphValue<_ShapeView<S, Self>>, inputs: _ViewInputs) -> _ViewOutputs where S: Shape
}

extension ShapeStyle where Self: View, Self.Body == _ShapeView<Rectangle, Self> {
    public var body: _ShapeView<Rectangle, Self> {
        get {
            fatalError()
        }
    }
}


public struct FillStyle: Equatable {
    public var isEOFilled: Bool
    public var isAntialiased: Bool
    public init(eoFill: Bool = false, antialiased: Bool = true) {
        self.isEOFilled = eoFill
        self.isAntialiased = antialiased
    }
}



public struct ForegroundStyle {
    public init() {}
}

extension ForegroundStyle: ShapeStyle {
    public static func _makeView<S>(view: _GraphValue<_ShapeView<S, ForegroundStyle>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        fatalError()
    }
}
