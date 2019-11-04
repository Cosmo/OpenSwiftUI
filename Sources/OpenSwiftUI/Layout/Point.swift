// Should we use CGPoint instead?
public struct Point {
    public var x: Int
    public var y: Int
    
    public static let zero = Point(x: 0, y: 0)
}

extension Point: Equatable {
}
