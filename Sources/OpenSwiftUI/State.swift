import Foundation

internal class AnyLocationBase {
}

internal class AnyLocation<Value>: AnyLocationBase {
    internal let _value = UnsafeMutablePointer<Value>.allocate(capacity: 1)
    
    init(value: Value) {
        self._value.pointee = value
    }
}

public struct _DynamicPropertyBuffer {
}

@propertyWrapper public struct State<Value>: DynamicProperty {
    internal var _value: Value
    internal var _location: AnyLocation<Value>?
    
    public init(wrappedValue value: Value) {
        self._value = value
        self._location = AnyLocation(value: value)
    }
    
    public init(initialValue value: Value) {
        self._value = value
        self._location = AnyLocation(value: value)
    }
    
    public var wrappedValue: Value {
        get { return _location?._value.pointee ?? _value }
        nonmutating set { _location?._value.pointee = newValue }
    }
    
    public var projectedValue: Binding<Value> {
        return Binding(get: { return self.wrappedValue }, set: { newValue in self.wrappedValue = newValue })
    }
    
    public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        fatalError()
    }
}

extension State where Value: ExpressibleByNilLiteral {
    public init() {
        self.init(wrappedValue: nil)
    }
}
