import Foundation

public struct HStack<Content>: View where Content: View {
    public typealias Body = Never
    public var _tree: _VariadicView.Tree<_HStackLayout, Content>
    public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        _tree = .init(
            root: _HStackLayout(alignment: alignment, spacing: spacing), content: content())
    }
}

extension HStack {
    public var body: Never {
        fatalError()
    }
}

extension HStack {
    public static func _makeView(view: _GraphValue<HStack<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
}
