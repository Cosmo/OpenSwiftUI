import Foundation

public enum Edge: Int8, CaseIterable {
    public typealias RawValue = Int8
    
    case top = 1
    case leading = 2
    case bottom = 4
    case trailing = 8
    
    public struct Set: OptionSet {
        public typealias Element = Edge.Set
        public typealias ArrayLiteralElement = Edge.Set.Element
        public typealias RawValue = Int8
        public let rawValue: Int8
        
        public static let top = Element(.top)
        public static let leading = Element(.leading)
        public static let bottom = Element(.bottom)
        public static let trailing = Element(.trailing)
        public static let horizontal = Element(rawValue: leading.rawValue + trailing.rawValue)
        public static let vertical = Element(rawValue: top.rawValue + bottom.rawValue)
        
        public static let all = Element(rawValue: top.rawValue + bottom.rawValue + leading.rawValue + trailing.rawValue)
        
        public init(rawValue: Int8) {
            self.rawValue = rawValue
        }
        
        public init(_ e: Edge) {
            self.rawValue = e.rawValue
        }
    }
}

extension Edge: Hashable {
}

extension Edge: RawRepresentable {
}
