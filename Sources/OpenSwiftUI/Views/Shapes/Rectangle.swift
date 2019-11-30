import Foundation

public struct Rectangle: Shape {
    public func path(in rect: CoreGraphics.CGRect) -> Path {
        fatalError()
    }
    public init() {}
    public typealias Body = _ShapeView<Rectangle, ForegroundStyle>
}
