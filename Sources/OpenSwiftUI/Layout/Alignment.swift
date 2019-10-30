import Foundation

public struct Alignment {
    public var horizontal: HorizontalAlignment
    public var vertical: VerticalAlignment
    
    public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
    public static var center: Alignment {
        return Alignment(horizontal: HorizontalAlignment.center, vertical: VerticalAlignment.center)
    }
    public static var leading: Alignment {
        return Alignment(horizontal: HorizontalAlignment.leading, vertical: VerticalAlignment.center)
    }
    public static var trailing: Alignment {
        return Alignment(horizontal: HorizontalAlignment.trailing, vertical: VerticalAlignment.center)
    }
    public static var top: Alignment {
        return Alignment(horizontal: HorizontalAlignment.center, vertical: VerticalAlignment.top)
    }
    public static var bottom: Alignment {
        return Alignment(horizontal: HorizontalAlignment.center, vertical: VerticalAlignment.bottom)
    }
    public static var topLeading: Alignment {
        return Alignment(horizontal: HorizontalAlignment.leading, vertical: VerticalAlignment.top)
    }
    public static var topTrailing: Alignment {
        return Alignment(horizontal: HorizontalAlignment.trailing, vertical: VerticalAlignment.top)
    }
    public static var bottomLeading: Alignment {
        return Alignment(horizontal: HorizontalAlignment.leading, vertical: VerticalAlignment.bottom)
    }
    public static var bottomTrailing: Alignment {
        return Alignment(horizontal: HorizontalAlignment.trailing, vertical: VerticalAlignment.bottom)
    }
}

// FIXME: This is not the actual implementation. SwiftUI does not use enums. See below
public enum HorizontalAlignment {
    case leading
    case center
    case trailing
}

// FIXME: This is not the actual implementation. SwiftUI does not use enums. See below.
public enum VerticalAlignment {
    case top
    case center
    case bottom
    case firstTextBaseline
    case lastTextBaseline
}


/*
public protocol AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat
}

public struct VerticalAlignment {
    public init(_ id: AlignmentID.Type) {
        
    }
    public static func == (a: VerticalAlignment, b: VerticalAlignment) -> Bool {
        return true
    }
}

extension VerticalAlignment {
    public static var top: VerticalAlignment {
        fatalError()
    }
    public static var center: VerticalAlignment {
        fatalError()
    }
    public static var bottom: VerticalAlignment {
        fatalError()
    }
    public static var firstTextBaseline: VerticalAlignment {
        fatalError()
    }
    public static var lastTextBaseline: VerticalAlignment {
        fatalError()
    }
}

extension VerticalAlignment: Equatable {
}

public struct HorizontalAlignment {
    public init(_ id: AlignmentID.Type) {
        
    }
    public static func == (a: HorizontalAlignment, b: HorizontalAlignment) -> Bool {
        return true
    }
}

extension HorizontalAlignment {
    public static var leading: HorizontalAlignment {
        fatalError()
    }
    public static var center: HorizontalAlignment {
        fatalError()
    }
    public static var trailing: HorizontalAlignment {
        fatalError()
    }
}

extension HorizontalAlignment: Equatable {
}

public struct Alignment: Equatable {
    public var horizontal: HorizontalAlignment
    public var vertical: VerticalAlignment
    public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment) {
        fatalError()
    }
    public static var center: Alignment {
        fatalError()
    }
    public static var leading: Alignment {
        fatalError()
    }
    public static var trailing: Alignment {
        fatalError()
    }
    public static var top: Alignment {
        fatalError()
    }
    public static var bottom: Alignment {
        fatalError()
    }
    public static var topLeading: Alignment {
        fatalError()
    }
    public static var topTrailing: Alignment {
        fatalError()
    }
    public static var bottomLeading: Alignment {
        fatalError()
    }
    public static var bottomTrailing: Alignment {
        fatalError()
    }
    public static func == (a: Alignment, b: Alignment) -> Bool {
        fatalError()
    }
}
*/
