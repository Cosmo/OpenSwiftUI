public class AnyViewStorageBase {
    
}

public class AnyViewStorage<V: View>: AnyViewStorageBase {
    public var _view: V
    
    init(_ view: V) {
        self._view = view
    }
}

public struct AnyView: View {
    public var _storage: AnyViewStorageBase
    
    public init<V>(_ view: V) where V: View {
        _storage = AnyViewStorage<V>(view)
    }
    
    public typealias Body = Never
    public var body: Never {
        fatalError()
    }
}
