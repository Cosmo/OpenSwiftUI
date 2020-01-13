#if canImport(Foundation)
import Foundation
#else
import CoreGraphicsShim
#endif

public struct Rectangle: Shape {
    public func path(in rect: CGRect) -> Path {
        fatalError()
    }
    public init() {}
    public typealias Body = _ShapeView<Rectangle, ForegroundStyle>
}
