public struct Stepper<Label>: View where Label: View {
    internal var label: Label
    
    public var onIncrement: (() -> Void)?
    public var onDecrement: (() -> Void)?
    public var onEditingChanged: (Bool) -> Void
    
    public init(onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) {
        self.label = label()
        self.onIncrement = onIncrement
        self.onDecrement = onDecrement
        self.onEditingChanged = onEditingChanged
    }
    
    public var body: some View {
        return label
    }
}

extension Stepper {
    public init<V>(value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V: Strideable {
        self.label = label()
        self.onEditingChanged = onEditingChanged
    }
    
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V: Strideable {
        self.label = label()
        self.onEditingChanged = onEditingChanged
    }
}

extension Stepper where Label == Text {
    #if canImport(Foundation)
    public init(_ titleKey: LocalizedStringKey, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }) {
        self.label = Text(titleKey)
        self.onIncrement = onIncrement
        self.onDecrement = onDecrement
        self.onEditingChanged = onEditingChanged
    }
    #endif
    
    @_disfavoredOverload public init<S>(_ title: S, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S: StringProtocol {
        self.label = Text(title)
        self.onIncrement = onIncrement
        self.onDecrement = onDecrement
        self.onEditingChanged = onEditingChanged
    }
    
    #if canImport(Foundation)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V: Strideable {
        self.label = Text(titleKey)
        self.onEditingChanged = onEditingChanged
    }
    #endif
    
    @_disfavoredOverload public init<S, V>(_ title: S, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S: StringProtocol, V: Strideable {
        self.label = Text(title)
        self.onEditingChanged = onEditingChanged
    }
    
    #if canImport(Foundation)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V: Strideable {
        self.label = Text(titleKey)
        self.onEditingChanged = onEditingChanged
    }
    #endif
    
    @_disfavoredOverload public init<S, V>(_ title: S, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S: StringProtocol, V: Strideable {
        self.label = Text(title)
        self.onEditingChanged = onEditingChanged
    }
}

