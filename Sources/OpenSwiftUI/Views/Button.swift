public struct Button<Label>: View where Label: View {
    public typealias Body = Label
    
    public let _label: Label
    public let _action: () -> Void
    
    public var body: Label {
        return _label
    }
    
    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
        self._action = action
        self._label = label()
    }
}

extension Button where Label == Text {
    public init<S: StringProtocol>(_ title: S, action: @escaping () -> Void) {
        self._action = action
        self._label = Text(title)
    }
}
