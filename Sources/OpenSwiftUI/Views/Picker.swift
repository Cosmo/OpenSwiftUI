import Foundation

public protocol PickerStyle {
    static func _makeView<SelectionValue>(value: _GraphValue<_PickerValue<Self, SelectionValue>>, inputs: _ViewInputs) -> _ViewOutputs where SelectionValue: Hashable
    static func _makeViewList<SelectionValue>(value: _GraphValue<_PickerValue<Self, SelectionValue>>, inputs: _ViewListInputs) -> _ViewListOutputs where SelectionValue: Hashable
}

public struct _PickerValue<Style, SelectionValue> where Style: PickerStyle, SelectionValue: Hashable { }

extension View {
    public func pickerStyle<S>(_ style: S) -> some View where S: PickerStyle {
        return self.modifier(PickerStyleWriter(style))
    }
}

public struct SegmentedPickerStyle: PickerStyle {
    public init() { }
    
    public static func _makeView<SelectionValue>(value: _GraphValue<_PickerValue<SegmentedPickerStyle, SelectionValue>>, inputs: _ViewInputs) -> _ViewOutputs where SelectionValue: Hashable {
        fatalError()
    }
    
    public static func _makeViewList<SelectionValue>(value: _GraphValue<_PickerValue<SegmentedPickerStyle, SelectionValue>>, inputs: _ViewListInputs) -> _ViewListOutputs where SelectionValue: Hashable {
        fatalError()
    }
}

public struct DefaultPickerStyle: PickerStyle {
    public init() { }
    
    public static func _makeView<SelectionValue>(value: _GraphValue<_PickerValue<DefaultPickerStyle, SelectionValue>>, inputs: _ViewInputs) -> _ViewOutputs where SelectionValue: Hashable {
        fatalError()
    }
    
    public static func _makeViewList<SelectionValue>(value: _GraphValue<_PickerValue<DefaultPickerStyle, SelectionValue>>, inputs: _ViewListInputs) -> _ViewListOutputs where SelectionValue: Hashable {
        fatalError()
    }
}

public struct PopUpButtonPickerStyle: PickerStyle {
    public init() { }
    
    public static func _makeView<SelectionValue>(value: _GraphValue<_PickerValue<PopUpButtonPickerStyle, SelectionValue>>, inputs: _ViewInputs) -> _ViewOutputs where SelectionValue: Hashable {
        fatalError()
    }
    
    public static func _makeViewList<SelectionValue>(value: _GraphValue<_PickerValue<PopUpButtonPickerStyle, SelectionValue>>, inputs: _ViewListInputs) -> _ViewListOutputs where SelectionValue: Hashable {
        fatalError()
    }
}

public struct Picker<Label, SelectionValue, Content>: View where Label: View, SelectionValue: Hashable, Content: View {
    let selection: Binding<SelectionValue>
    let label: Label
    let content: Content
    
    public init(selection: Binding<SelectionValue>, label: Label, @ViewBuilder content: () -> Content) {
        self.selection = selection
        self.label = label
        self.content = content()
    }
    
    public var body: some View {
        HStack {
            label
            content
        }
    }
}

extension Picker where Label == Text {
    public init(_ titleKey: LocalizedStringKey, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self.selection = selection
        self.label = Text(titleKey)
        self.content = content()
    }
    
    public init<S>(_ title: S, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.selection = selection
        self.label = Text(title)
        self.content = content()
    }
}

public struct PickerStyleWriter<Style>: ViewModifier {
    public typealias Body = Never
    public typealias Content = View
    
    var style: Style
    
    init(_ style: Style) {
        self.style = style
    }
}
