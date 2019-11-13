public struct _ZStackLayout {
    public var alignment: Alignment
    public init(alignment: Alignment = .center) {
        self.alignment = alignment
    }
    public typealias Body = Never
}

extension _ZStackLayout: _VariadicView_UnaryViewRoot {}
