public protocol _ViewTraitKey {
    associatedtype Value
    static var defaultValue: Self.Value { get }
}
