#if canImport(Foundation)
import Foundation
#endif

#if canImport(CoreGraphics)
import CoreGraphics
#else
import CoreGraphicsShim
#endif

public struct VStack<Content>: View where Content: View {
    public typealias Body = Never
    public var _tree: _VariadicView.Tree<_VStackLayout, Content>
    
    public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        _tree = .init(
            root: _VStackLayout(alignment: alignment, spacing: spacing), content: content())
    }
}

extension VStack {
    public var body: Never {
        fatalError()
    }
}

extension VStack {
    public static func _makeView(view: _GraphValue<VStack<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
}
