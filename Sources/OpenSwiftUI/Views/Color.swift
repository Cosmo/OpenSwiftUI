import Foundation

public struct Color {
    // TODO: Could make sense to use CIELAB Color Space instead of RGB
    // private let lightness: Double
    // private let aColor: Double
    // private let bColor: Double
    
    public let _red: Double
    public let _green: Double
    public let _blue: Double
    public let _opacity: Double
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
        self._red = 0
        self._green = 0
        self._blue = 0
        self._opacity = opacity
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

extension Color {
    public var body: Never {
        fatalError()
    }
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
