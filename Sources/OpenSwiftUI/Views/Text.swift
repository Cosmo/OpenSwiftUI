import Foundation

public struct Text: View, Equatable {
    public typealias Body = Never
    public var _content: String
    
    public init(verbatim content: String) {
        self._content = content
    }
    
    public init<S>(_ content: S) where S: StringProtocol {
        self._content = String(content)
    }
    
    public static func == (lhs: Text, rhs: Text) -> Bool {
        return lhs._content == rhs._content
    }
}
