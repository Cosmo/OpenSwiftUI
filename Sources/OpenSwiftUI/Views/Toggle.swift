public struct Toggle<Label>: View where Label: View {
    public var __isOn: Binding<Bool>
    public var _label: Label
    
    public init(isOn: Binding<Bool>, @ViewBuilder label: () -> Label) {
        self.__isOn = isOn
        self._label = label()
    }
    
    public var body: some View {
        return _label
    }
}

extension Toggle where Label == ToggleStyleConfiguration.Label {
    public init(_ configuration: ToggleStyleConfiguration) {
        self.__isOn = configuration.__isOn
        self._label = configuration.label
    }
}

extension Toggle where Label == Text {
    #if canImport(Foundation)
    public init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>) {
        fatalError()
    }
    #endif
    
    public init<S>(_ title: S, isOn: Binding<Bool>) where S: StringProtocol {
        fatalError()
    }
}

public protocol ToggleStyle {
    associatedtype Body: View
    func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = ToggleStyleConfiguration
}

public struct ToggleStyleConfiguration {
    public struct Label: View {
        public var body: Never
        public typealias Body = Never
    }
    
    public let label: ToggleStyleConfiguration.Label
    
    @_projectedValueProperty($isOn) public var isOn: Bool {
        get {
            // self.__isOn
            fatalError()
        }
        
        nonmutating set {
            fatalError()
        }
    }
    
    public var __isOn: Binding<Bool> {
        return Binding(get: { return self.isOn }, set: { newValue in self.isOn = newValue })
    }
}

extension View {
    public func toggleStyle<S>(_ style: S) -> some View where S: ToggleStyle {
        return self.modifier(ToggleStyleModifier(style))
    }
}

public struct CheckboxToggleStyle: ToggleStyle {
    public init() { }
    
    public func makeBody(configuration: CheckboxToggleStyle.Configuration) -> some View {
        return configuration.label
    }
}

public struct ToggleStyleModifier<Style>: ViewModifier {
    public typealias Body = Never
    public typealias Content = View
    
    var style: Style
    
    init(_ style: Style) {
        self.style = style
    }
}
