public struct Color: View, Hashable, CustomStringConvertible {
    public typealias Body = Never
    
    // These values should be private,
    // but then they are not accessible
    // in implementations of OpenSwiftUI
    public let _red: Double
    public let _green: Double
    public let _blue: Double
    public let _opacity: Double
    
    public enum RGBColorSpace: Equatable {
        case sRGB
        case sRGBLinear
        case displayP3
    }
    
    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1) {
        self._red = red
        self._green = green
        self._blue = blue
        self._opacity = opacity
    }
    
    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1) {
        self._red = white
        self._green = white
        self._blue = white
        self._opacity = opacity
    }
    
    public init(hue: Double, saturation: Double, brightness: Double, opacity: Double = 1) {
        // TODO: Implement HSBA to RGBA conversion.
        fatalError("Not implemented")
    }
    
    public var body: Never {
        fatalError()
    }
    
    public var description: String {
        return "Red: \(_red), Green: \(_green), Blue: \(_blue)"
    }
}

extension Color {
    public static let clear: Color = Color(hue: 0, saturation: 0, brightness: 0, opacity: 0)
    public static let black: Color = Color(red: 0, green: 0, blue: 0)
    public static let white: Color = Color(red: 1, green: 1, blue: 1)
    public static let gray: Color = Color(red: 0.5, green: 0.5, blue: 0.5)
    public static let red: Color = Color(red: 1, green: 0, blue: 0)
    public static let green: Color = Color(red: 0, green: 1, blue: 0)
    public static let blue: Color = Color(red: 0, green: 0, blue: 1)
    public static let orange: Color = Color(red: 1, green: 0.5, blue: 0)
    public static let yellow: Color = Color(red: 1, green: 1, blue: 0)
    public static let pink: Color = Color(red: 1, green: 0, blue: 1)
    public static let purple: Color = Color(red: 0.5, green: 0, blue: 1)
    public static let primary: Color = Color(red: 1, green: 1, blue: 1)
    public static let secondary: Color = Color(red: 0.8, green: 0.8, blue: 0.8)
}

extension View {
    public func foregroundColor(_ color: Color?) -> some View {
        return environment(\.foregroundColor, color)
    }
}

enum ForegroundColorEnvironmentKey: EnvironmentKey {
    static var defaultValue: Color? { return nil }
}

extension EnvironmentValues {
    public var foregroundColor: Color? {
        set { self[ForegroundColorEnvironmentKey.self] = newValue }
        get { self[ForegroundColorEnvironmentKey.self] }
    }
}
