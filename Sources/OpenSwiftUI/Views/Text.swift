import Foundation

public struct Text: View, Equatable {
    public typealias Body = Never
    var content: String
    
    public init(verbatim content: String) {
        self.content = content
    }
    
    public init<S>(_ content: S) where S: StringProtocol {
        self.content = String(content)
    }
    
    public static func == (lhs: Text, rhs: Text) -> Bool {
        return lhs.content == rhs.content
    }
}
