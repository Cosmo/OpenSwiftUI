#if canImport(Foundation)
import Foundation
#else
import CoreGraphicsShim
#endif

public struct Angle {
    public var radians: Double
    public var degrees: Double {
        get { return radians * (180.0 / .pi) }
        set { radians = newValue * (.pi / 180.0) }
    }
    
    public init() {
        self.init(radians: 0.0)
    }
    
    public init(radians: Double) {
        self.radians = radians
    }
    
    public init(degrees: Double) {
        self.init(radians: degrees * (.pi / 180.0))
    }
    
    public static func radians(_ radians: Double) -> Angle {
        return Angle(radians: radians)
    }
    
    public static func degrees(_ degrees: Double) -> Angle {
        return Angle(degrees: degrees)
    }
}

extension Angle: Hashable, Comparable {
    public static func < (lhs: Angle, rhs: Angle) -> Bool {
        return lhs.radians < rhs.radians // Sure?
    }
}

public protocol _VectorMath: Animatable {
}

extension Angle: Animatable, _VectorMath {
    public var animatableData: Double {
        get {
            fatalError()
        }
        set {
            fatalError()
        }
    }
    
    public static var zero: Angle {
        get {
            return .init()
        }
    }
    
    public typealias AnimatableData = Double
}
