import Foundation

@propertyWrapper @dynamicMemberLookup public struct Binding<Value> {
    public var transaction: Transaction
    internal var location: AnyLocation<Value>
    fileprivate var _value: Value
    
    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void) {
        fatalError()
    }
    
    public init(get: @escaping () -> Value, set: @escaping (Value, Transaction) -> Void) {
        fatalError()
    }
    
    public static func constant(_ value: Value) -> Binding<Value> {
        fatalError()
    }
    
    public var wrappedValue: Value {
        get { return location._value.pointee }
        nonmutating set { location._value.pointee = newValue }
    }
    
    public var projectedValue: Binding<Value> {
        fatalError()
    }
    
    public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Binding<Subject> {
        fatalError()
    }
}

extension Binding {
    public func transaction(_ transaction: Transaction) -> Binding<Value> {
        fatalError()
    }
    
//    public func animation(_ animation: Animation? = .default) -> Binding<Value> {
//
//    }
}

extension Binding: DynamicProperty {
    public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        
    }
}

extension Binding {
    public init<V>(_ base: Binding<V>) where Value == V? {
        fatalError()
    }
    public init?(_ base: Binding<Value?>) {
        fatalError()
    }
    public init<V>(_ base: Binding<V>) where Value == AnyHashable, V : Hashable {
        fatalError()
    }
}
