#if canImport(Foundation)
public struct LocalizedStringKey {
    internal var key: String
    private var hasFormatting: Bool = false
    
    public init(_ value: String) {
        self.key = value
    }
    
    public init(stringLiteral value: String) {
        self.key = value
    }
}
#endif
