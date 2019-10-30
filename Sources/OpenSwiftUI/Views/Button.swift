import Foundation

public struct Button<Label: View>: View {
    public typealias Body = Label
    
    let label: Label
    let action: () -> Void
    
    public var body: Self.Body {
        return label
    }
    
    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
        self.action = action
        self.label = label()
    }
}

extension Button where Label == Text {
    public init<S: StringProtocol>(_ title: S, action: @escaping () -> Void) {
        self.action = action
        self.label = Text(title)
    }
}
