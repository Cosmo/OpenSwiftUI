import Foundation

public enum Edge: Int8, CaseIterable {
    public typealias RawValue = Int8
    
    case top
    case leading
    case bottom
    case trailing
    
    public struct Set: OptionSet {
        public typealias Element = Edge.Set
        public typealias ArrayLiteralElement = Edge.Set.Element
        public typealias RawValue = Int8
        public let rawValue: Int8
        
        public static let top: Edge.Set = Edge.Set(rawValue: Set(.top).rawValue)
        public static let leading: Edge.Set = Edge.Set(rawValue: Set(.leading).rawValue)
        public static let bottom: Edge.Set = Edge.Set(rawValue: Set(.bottom).rawValue)
        public static let trailing: Edge.Set = Edge.Set(rawValue: Set(.trailing).rawValue)
        public static let horizontal: Edge.Set = Edge.Set(rawValue: Edge.leading.rawValue + Edge.trailing.rawValue)
        public static let vertical: Edge.Set = Edge.Set(rawValue: Edge.top.rawValue + Edge.bottom.rawValue)
        
        public static let all: Edge.Set = Edge.Set(rawValue: 43)
        
        
        public init(rawValue: Int8) {
            self.rawValue = rawValue
        }
        
        public init(_ e: Edge) {
            self.rawValue = e.rawValue
        }
    }
}

