import Foundation

extension AnyView {
    public init?(_fromValue value: Any) {
        guard let view = ViewTypeEraser.shared(value) else { return nil }
        self = view
    }
}

private struct ViewTypeEraser: ViewAssociatedTypeRequirementsVisitor {
    func callAsFunction<T: View>(_ value: T) -> AnyView {
        return AnyView(value)
    }
}

extension ViewTypeEraser {
    static let shared = ViewTypeEraser()
}
