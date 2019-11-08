public protocol _VariadicView_MultiViewRoot: _VariadicView_ViewRoot {
}

extension _VariadicView_MultiViewRoot {
    public static func _makeView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        fatalError()
    }
}
