#if canImport(Foundation)
import Foundation
#endif

#if canImport(CoreGraphics)
import CoreGraphics
#else
import CoreGraphicsShim
#endif

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
        self.init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}

extension EdgeInsets {
    internal init(_all: CGFloat) {
        self.init(top: _all, leading: _all, bottom: _all, trailing: _all)
    }
}
