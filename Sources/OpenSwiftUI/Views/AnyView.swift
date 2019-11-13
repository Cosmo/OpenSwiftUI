public class AnyViewStorageBase<V: View>: View {
    public var _view: V
    init(_ view: V) {
        _view = view
    }
    public var body: V {
        _view
    }
}

public struct AnyView: View {
    public var _storage: Any
    public var _type: Any
    
    public init<V>(_ view: V) where V: View {
        _storage = AnyViewStorageBase(view)
        _type = V.self
    }
    
    public init?(_fromValue value: Any) {
        fatalError()
    }
    
    public typealias Body = Never
    public var body: Never {
        fatalError()
    }
}
