import Foundation

public struct Color {
    // TODO: Could make sense to use CIELAB Color Space instead of RGB
    // private let lightness: Double
    // private let aColor: Double
    // private let bColor: Double
    
    private let red: Double
    private let green: Double
    private let blue: Double
    private let opacity: Double
}

extension Color: Hashable {
}

extension Color {
    public typealias Body = Never
}

extension Color {
    public enum RGBColorSpace {
        case sRGB
        case sRGBLinear
        case displayP3
    }
    
    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.opacity = opacity
    }
    
    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1) {
        self.red = white
        self.green = white
        self.blue = white
        self.opacity = opacity
    }
    
    public init(hue: Double, saturation: Double, brightness: Double, opacity: Double = 1) {
        self.red = 0
        self.green = 0
        self.blue = 0
        self.opacity = opacity
    }
}

extension Color: View {
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
        return self
    }
}

extension View {
    public func background<Background>(_ background: Background, alignment: Alignment = .center) -> some View where Background: View {
        return ZStack {
            background
            self
        }
    }
}
