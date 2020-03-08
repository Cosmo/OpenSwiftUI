#if canImport(Foundation)
import Foundation
#endif

#if canImport(CoreGraphics)
import CoreGraphics
#else
import CoreGraphicsShim
#endif

internal struct FixedRoundedRect: Equatable {
    var rect: CGRect
    var cornerSize: CGSize
    var style: RoundedCornerStyle
}

@frozen public struct StrokeStyle: Equatable {
    public var lineWidth: CGFloat
    public var lineCap: CGLineCap
    public var lineJoin: CGLineJoin
    public var miterLimit: CGFloat
    public var dash: [CGFloat]
    public var dashPhase: CGFloat
    
    public init(lineWidth: CGFloat = 1, lineCap: CGLineCap = .butt, lineJoin: CGLineJoin = .miter, miterLimit: CGFloat = 10, dash: [CGFloat] = [CGFloat](), dashPhase: CGFloat = 0) {
        self.lineWidth = lineWidth
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.miterLimit = miterLimit
        self.dash = dash
        self.dashPhase = dashPhase
    }
}

public enum RoundedCornerStyle {
    case circular
    case continuous
}

extension RoundedCornerStyle: Hashable {}

internal struct TrimmedPath: Equatable {
}

internal struct StrokedPath: Equatable {
    let path: Path
    let style: StrokeStyle
    
    public init(path: Path, style: StrokeStyle) {
        self.path = path
        self.style = style
    }
}

public struct Path: Equatable {
    final internal class PathBox: Equatable {
        var cgPath: CGPath
        
        init(cgPath: CGPath) {
            self.cgPath = cgPath
        }
        
        internal static func == (lhs: Path.PathBox, rhs: Path.PathBox) -> Bool {
            return lhs.cgPath == rhs.cgPath
        }
    }
    
    internal enum Storage: Equatable {
        case empty
        case rect(CGRect)
        case ellipse(CGRect)
        indirect case roundedRect(FixedRoundedRect)
        indirect case stroked(StrokedPath)
        indirect case trimmed(TrimmedPath)
        case path(Path.PathBox)
    }
    
    internal var storage: Path.Storage
    
    public init() {
        fatalError()
    }
    
    public init(_ path: CGPath) {
        fatalError()
    }
    
    public init(_ path: CGMutablePath) {
        fatalError()
    }
    
    public init(_ rect: CGRect) {
        self.storage = Storage.rect(rect)
    }
    
    public init(roundedRect rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .circular) {
        self.storage = Storage.roundedRect(FixedRoundedRect(rect: rect, cornerSize: cornerSize, style: style))
    }
    
    public init(roundedRect rect: CGRect, cornerRadius: CGFloat, style: RoundedCornerStyle = .circular) {
        let cornerSize = CGSize(width: cornerRadius, height: cornerRadius)
        self.storage = Storage.roundedRect(FixedRoundedRect(rect: rect, cornerSize: cornerSize, style: style))
    }
    
    public init(ellipseIn rect: CGRect) {
        self.storage = Storage.ellipse(rect)
    }
    
    public init(_ callback: (inout Path) -> ()) {
        fatalError()
    }
    
    public init?(_ string: String) {
        fatalError()
        // let pathBox = PathBox(cgPath: cgPath)
        // self.storage = Storage.path(pathBox)
    }
    
    public var description: String {
        get {
            fatalError()
        }
    }
    
    public var cgPath: CGPath {
        get {
            fatalError()
        }
    }
    
    public var isEmpty: Bool {
        get {
            fatalError()
        }
    }
    
    public var boundingRect: CGRect {
        get {
            fatalError()
        }
    }
    
    public func contains(_ p: CGPoint, eoFill: Bool = false) -> Bool {
        fatalError()
    }
    
    public enum Element: Equatable {
        case move(to: CGPoint)
        case line(to: CGPoint)
        case quadCurve(to: CGPoint, control: CGPoint)
        case curve(to: CGPoint, control1: CGPoint, control2: CGPoint)
        case closeSubpath
    }
    
    public func forEach(_ body: (Path.Element) -> Void) {
        fatalError()
    }
    
    public func strokedPath(_ style: StrokeStyle) -> Path {
        fatalError()
    }
    
    public func trimmedPath(from: CGFloat, to: CGFloat) -> Path {
        fatalError()
    }
}

extension Path {
    mutating public func move(to p: CGPoint) {
        
    }
    
    mutating public func addLine(to p: CGPoint) {
        
    }
    
    mutating public func addQuadCurve(to p: CGPoint, control cp: CGPoint) {
        
    }
    
    mutating public func addCurve(to p: CGPoint, control1 cp1: CGPoint, control2 cp2: CGPoint) {
        
    }
    
    mutating public func closeSubpath() {
        
    }
    
    mutating public func addRect(_ rect: CGRect, transform: CGAffineTransform = .identity) {
        
    }
    
    mutating public func addRoundedRect(in rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .circular, transform: CGAffineTransform = .identity) {
        
    }
    
    mutating public func addEllipse(in rect: CGRect, transform: CGAffineTransform = .identity) {
        
    }
    
    mutating public func addRects(_ rects: [CGRect], transform: CGAffineTransform = .identity) {
        
    }
    
    mutating public func addLines(_ lines: [CGPoint]) {
        
    }
    
    mutating public func addRelativeArc(center: CGPoint, radius: CGFloat, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity) {
        
    }
    
    mutating public func addArc(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool, transform: CGAffineTransform = .identity) {
        
    }
    
    mutating public func addArc(tangent1End p1: CGPoint, tangent2End p2: CGPoint, radius: CGFloat, transform: CGAffineTransform = .identity) {
        
    }
    
    mutating public func addPath(_ path: Path, transform: CGAffineTransform = .identity) {
        
    }
    
    public var currentPoint: CGPoint? {
        get {
            fatalError()
        }
    }
    
    public func applying(_ transform: CGAffineTransform) -> Path {
        fatalError()
    }
    
    public func offsetBy(dx: CGFloat, dy: CGFloat) -> Path {
        fatalError()
    }
    
}

extension Path: Shape {
    public func path(in _: CGRect) -> Path {
        fatalError()
    }
    public typealias Body = _ShapeView<Path, ForegroundStyle>
}
