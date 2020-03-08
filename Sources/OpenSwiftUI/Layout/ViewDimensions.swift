#if canImport(Foundation)
import Foundation
#else
import CoreGraphicsShim
#endif

public struct ViewDimensions {
    public var width: CGFloat {
        return 0
    }
    public var height: CGFloat {
        return 0
    }
    public subscript(guide: HorizontalAlignment) -> CGFloat {
        return 0
    }
    public subscript(guide: VerticalAlignment) -> CGFloat {
        return 0
    }
    public subscript(explicit guide: HorizontalAlignment) -> CGFloat? {
        return 0
    }
    public subscript(explicit guide: VerticalAlignment) -> CGFloat? {
        return 0
    }
}

extension ViewDimensions: Equatable {
    public static func == (lhs: ViewDimensions, rhs: ViewDimensions) -> Bool {
        return true
    }
}

