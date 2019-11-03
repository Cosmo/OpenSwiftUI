import Foundation

public struct Font: Hashable {
    public var size: CGFloat
    
    internal init(size: CGFloat) {
        self.size = size
    }
    
    public static func system(size: CGFloat) -> Font {
        return Font(size: size)
    }
    
    public static func == (lhs: Font, rhs: Font) -> Bool {
        return lhs.size == rhs.size
    }
}

public struct Text: View, Equatable {
    public typealias Body = Never
    public var _content: String
    public var _font = Font(size: 8)
    public var _color = Color.black
    
    public init(verbatim content: String) {
        self._content = content
    }
    
    public init<S>(_ content: S) where S: StringProtocol {
        self._content = String(content)
    }
    
    private init(verbatim content: String, font: Font? = nil, foregroundColor: Color? = nil) {
        self._content = content
        if let font = font {
            self._font = font
        }
        if let foregroundColor = foregroundColor {
            self._color = foregroundColor
        }
    }
    
    public static func == (lhs: Text, rhs: Text) -> Bool {
        return lhs._content == rhs._content && lhs._font == rhs._font
    }
}

extension Text {
    public func foregroundColor(_ color: Color?) -> Text {
        Text(verbatim: _content, font: _font, foregroundColor: color)
    }
    
    public func font(_ font: Font?) -> Text {
        Text(verbatim: _content, font: font, foregroundColor: _color)
    }
}

extension Text {
    public var body: Never {
        fatalError()
    }
}
