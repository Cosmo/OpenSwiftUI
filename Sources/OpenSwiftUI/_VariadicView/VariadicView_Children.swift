public struct _VariadicView_Children {
}

extension _VariadicView_Children : View {
    public var body: Never {
        fatalError()
    }
    
    public static func _makeViewList(view: _GraphValue<_VariadicView.Children>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError()
    }
    public typealias Body = Never
}

extension _VariadicView_Children: RandomAccessCollection {
    public struct Element : View, Identifiable {
        public var body: Never
        
        public var id: AnyHashable {
            get {
                fatalError()
            }
        }
        public func id<ID>(as _: ID.Type = ID.self) -> ID? where ID : Hashable {
            fatalError()
        }
        public subscript<Trait>(key: Trait.Type) -> Trait.Value where Trait : _ViewTraitKey {
            get {
                fatalError()
            }
            set {
                fatalError()
            }
        }
        public static func _makeView(view: _GraphValue<_VariadicView_Children.Element>, inputs: _ViewInputs) -> _ViewOutputs {
            fatalError()
        }
        public typealias ID = AnyHashable
        public typealias Body = Never
    }
    public var startIndex: Int {
        get {
            fatalError()
        }
    }
    public var endIndex: Int {
        get {
            fatalError()
        }
    }
    public subscript(index: Int) -> _VariadicView_Children.Element {
        get {
            fatalError()
        }
    }
    public typealias Index = Int
    public typealias Iterator = IndexingIterator<_VariadicView_Children>
    public typealias SubSequence = Slice<_VariadicView_Children>
    public typealias Indices = Range<Int>
}
