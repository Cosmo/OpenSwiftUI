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


public protocol ButtonStyle {
    associatedtype Body: View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = ButtonStyleConfiguration
}

public struct ButtonStyleConfiguration {
    public struct Label: View {
        public typealias Body = Never
        public var body: Never {
            fatalError()
        }
        public var _storage: Any
        
        init(_ storage: Any) {
            self._storage = storage
        }
    }
    public let label: Label
    public let isPressed: Bool
}

extension View {
    public func buttonStyle<S>(_ style: S) -> some View where S: ButtonStyle {
        let label = ButtonStyleConfiguration.Label(self)
        let configuration = ButtonStyleConfiguration(label: label, isPressed: false)
        return style.makeBody(configuration: configuration)
    }
}
