import Foundation

internal class AnyLocationBase {
}

internal class AnyLocation<Value>: AnyLocationBase {
}

public struct _DynamicPropertyBuffer {
}

@propertyWrapper public struct State<Value> : DynamicProperty {
    @usableFromInline
    internal var _value: Value
    internal var _location: AnyLocation<Value>?
    
    public init(wrappedValue value: Value) {
        self._value = value
    }
    
    public init(initialValue value: Value) {
        _value = value
    }
    public var wrappedValue: Value {
        get {
            fatalError()
        }
        nonmutating set {
            fatalError()
        }
    }
    public var projectedValue: Binding<Value> {
        fatalError()
    }
    public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        fatalError()
    }
}

extension State where Value : ExpressibleByNilLiteral {
    @inlinable public init() {
        self.init(wrappedValue: nil)
    }
}
