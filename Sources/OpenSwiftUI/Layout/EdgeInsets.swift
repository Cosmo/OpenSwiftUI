import Foundation

public struct EdgeInsets: Equatable {
    public var top: CGFloat
    public var leading: CGFloat
    public var bottom: CGFloat
    public var trailing: CGFloat
    
    public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
    
    public init() {
        self.top = 0
        self.leading = 0
        self.bottom = 0
        self.trailing = 0
    }
    
    public static func == (a: EdgeInsets, b: EdgeInsets) -> Bool {
        return false
    }
}
