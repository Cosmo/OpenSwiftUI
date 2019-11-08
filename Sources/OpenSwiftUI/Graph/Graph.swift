import Foundation

public struct _Graph {
    public init() {
        
    }
}

public struct _ViewInputs {
    public init() {
        
    }
}

public struct _ViewListInputs {
    public init() {
        
    }
}

public struct _ViewOutputs {
    public init() {
        
    }
}

public struct _ViewListOutputs {
    public init() {
        
    }
}

public struct _GraphValue<Value>: Equatable {
    public init() {
        
    }
    
    public subscript<U>(keyPath: KeyPath<Value, U>) -> _GraphValue<U> {
        get {
            fatalError()
        }
    }
    public static func == (a: _GraphValue<Value>, b: _GraphValue<Value>) -> Bool {
        return true
    }
}
