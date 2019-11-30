import Foundation

public struct Path: Equatable {
}

extension Path: Shape {
    public func path(in _: CGRect) -> Path {
        fatalError()
    }
    public typealias Body = _ShapeView<Path, ForegroundStyle>
}
