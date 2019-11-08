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

public class AnyTextStorage<Storage: StringProtocol> {
    public var storage: Storage
    
    internal init(storage: Storage) {
        self.storage = storage
    }
}

public struct Text: View, Equatable {
    public typealias Body = Never
    public var _storage: Storage
    public var _font = Font(size: 12)
    public var _color = Color.black
    
    public enum Storage: Equatable {
        public static func == (lhs: Text.Storage, rhs: Text.Storage) -> Bool {
            switch (lhs, rhs) {
            case (.verbatim(let contentA), .verbatim(let contentB)):
                return contentA == contentB
            case (.anyTextStorage(let contentA), .anyTextStorage(let contentB)):
                return contentA.storage == contentB.storage
            default:
                return false
            }
        }
        
        case verbatim(String)
        case anyTextStorage(AnyTextStorage<String>)
    }
    
    public init(verbatim content: String) {
        self._storage = .verbatim(content)
    }
    
    public init<S>(_ content: S) where S: StringProtocol {
        self._storage = .anyTextStorage(AnyTextStorage<String>(storage: content as? String ?? "AnyStorage, FIXME"))
    }
    
    private init(verbatim content: String, font: Font? = nil, foregroundColor: Color? = nil) {
        self._storage = .verbatim(content)
        if let font = font {
            self._font = font
        }
        if let foregroundColor = foregroundColor {
            self._color = foregroundColor
        }
    }
    
    public static func == (lhs: Text, rhs: Text) -> Bool {
        return lhs._storage == rhs._storage && lhs._font == rhs._font
    }
}

extension Text {
    public func foregroundColor(_ color: Color?) -> Text {
        switch _storage {
        case .verbatim(let content):
            return Text(verbatim: content, font: _font, foregroundColor: color)
        case .anyTextStorage(let content):
            return Text(verbatim: content.storage, font: _font, foregroundColor: color)
        }
    }
    
    public func font(_ font: Font?) -> Text {
        switch _storage {
        case .verbatim(let content):
            return Text(verbatim: content, font: font, foregroundColor: _color)
        case .anyTextStorage(let content):
            return Text(verbatim: content.storage, font: font, foregroundColor: _color)
        }
    }
}

extension Text {
    public var body: Never {
        fatalError()
    }
}

extension Text {
    public static func _makeView(view: _GraphValue<Text>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
}
