public enum _VariadicView {
    public typealias Root = _VariadicView_Root
    public typealias ViewRoot = _VariadicView_ViewRoot
    public typealias Children = _VariadicView_Children
    public typealias UnaryViewRoot = _VariadicView_UnaryViewRoot
    public typealias MultiViewRoot = _VariadicView_MultiViewRoot
    public struct Tree<Root, Content> where Root: _VariadicView_Root {
        public var root: Root
        public var content: Content
        internal init(root: Root, content: Content) {
            self.root = root
            self.content = content
        }
        public init(_ root: Root, @ViewBuilder content: () -> Content) {
            self.root = root
            self.content = content()
        }
    }
}

extension _VariadicView.Tree: View where Root: _VariadicView_ViewRoot, Content: View {
    public var body: Never {
        fatalError()
    }
    
    public typealias Body = Never
    public static func _makeView(view: _GraphValue<_VariadicView.Tree<Root, Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
    public static func _makeViewList(view: _GraphValue<_VariadicView.Tree<Root, Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError()
    }
}

