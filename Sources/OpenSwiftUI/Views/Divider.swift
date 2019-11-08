public struct Divider: View {
    public init() {
        
    }
    
    public typealias Body = Never
}

extension Divider {
    public var body: Never {
        fatalError()
    }
}

extension Divider {
    public static func _makeView(view: _GraphValue<Divider>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
}
