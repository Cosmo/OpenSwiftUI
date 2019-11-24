import Foundation

public class AnyColorBox {
}

extension AnyColorBox: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
}

extension AnyColorBox: Equatable {
    public static func == (lhs: AnyColorBox, rhs: AnyColorBox) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

public class SystemColorType: AnyColorBox {
    public enum SystemColor: String {
        case clear
        case black
        case white
        case gray
        case red
        case green
        case blue
        case orange
        case yellow
        case pink
        case purple
        case primary
        case secondary
        case accentColor
    }
    
    public let value: SystemColor
    
    internal init(value: SystemColorType.SystemColor) {
        self.value = value
    }
    
    public var description: String {
        return value.rawValue
    }
}

public class DisplayP3: AnyColorBox {
    public let red: Double
    public let green: Double
    public let blue: Double
    public let opacity: Double
    
    internal init(red: Double, green: Double, blue: Double, opacity: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.opacity = opacity
    }
}

extension Double {
    fileprivate var hexString: String {
        return String(format: "%02X", Int((self * 255).rounded()))
    }
}

public class _Resolved: AnyColorBox {
    public let linearRed: Double
    public let linearGreen: Double
    public let linearBlue: Double
    public let opacity: Double
    
    internal init(linearRed: Double, linearGreen: Double, linearBlue: Double, opacity: Double) {
        self.linearRed = linearRed
        self.linearGreen = linearGreen
        self.linearBlue = linearBlue
        self.opacity = opacity
    }
    
    public var description: String {
        return "#\(linearRed.hexString)\(linearGreen.hexString)\(linearBlue.hexString)\(opacity.hexString)"
    }
}

public struct Color: View, Hashable, CustomStringConvertible {
    public typealias Body = Never
    
    public let provider: AnyColorBox
    
    public enum RGBColorSpace: Equatable {
        case sRGB
        case sRGBLinear
        case displayP3
    }
    
    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1) {
        switch colorSpace {
        case .sRGB:
            self.provider = _Resolved(linearRed: red, linearGreen: green, linearBlue: blue, opacity: opacity)
        case .sRGBLinear:
            self.provider = _Resolved(linearRed: red, linearGreen: green, linearBlue: blue, opacity: opacity)
        case .displayP3:
            self.provider = DisplayP3(red: red, green: green, blue: blue, opacity: opacity)
        }
    }
    
    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1) {
        switch colorSpace {
        case .sRGB:
            self.provider = _Resolved(linearRed: white, linearGreen: white, linearBlue: white, opacity: opacity)
        case .sRGBLinear:
            self.provider = _Resolved(linearRed: white, linearGreen: white, linearBlue: white, opacity: opacity)
        case .displayP3:
            self.provider = DisplayP3(red: white, green: white, blue: white, opacity: opacity)
        }
    }
    
    public init(hue: Double, saturation: Double, brightness: Double, opacity: Double = 1) {
        let rgb = Color.hsbToRGB(hue: hue, saturation: saturation, brightness: brightness)
        self.provider = _Resolved(linearRed: rgb.red, linearGreen: rgb.green, linearBlue: rgb.blue, opacity: opacity)
    }
    
    internal init(_ systemColor: SystemColorType.SystemColor) {
        self.provider = SystemColorType(value: systemColor)
    }
    
    public var body: Never {
        fatalError()
    }
    
    public var description: String {
        return "\(provider)"
    }
}

extension Color {
    public static let clear: Color = Color(.clear)
    public static let black: Color = Color(.black)
    public static let white: Color = Color(.white)
    public static let gray: Color = Color(.gray)
    public static let red: Color = Color(.red)
    public static let green: Color = Color(.green)
    public static let blue: Color = Color(.blue)
    public static let orange: Color = Color(.orange)
    public static let yellow: Color = Color(.yellow)
    public static let pink: Color = Color(.pink)
    public static let purple: Color = Color(.purple)
    public static let primary: Color = Color(.primary)
    public static let secondary: Color = Color(.secondary)
    public static let accentColor: Color = Color(.accentColor)
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


extension Color {
    internal static func hsbToRGB(hue: Double, saturation: Double, brightness: Double) -> (red: Double, green: Double, blue: Double) {
        // Based on:
        // http://mjijackson.com/2008/02/rgb-to-hsl-and-rgb-to-hsv-color-model-conversion-algorithms-in-javascript
        
        var red: Double = 0
        var green: Double = 0
        var blue: Double = 0
        
        let i = floor(hue * 6)
        let f = hue * 6 - i
        let p = brightness * (1 - saturation)
        let q = brightness * (1 - f * saturation)
        let t = brightness * (1 - (1 - f) * saturation)
        
        switch(i.truncatingRemainder(dividingBy: 6)) {
        case 0:
            red = brightness
            green = t
            blue = p
        case 1:
            red = q
            green = brightness
            blue = p
        case 2:
            red = p
            green = brightness
            blue = t
        case 3:
            red = p
            green = q
            blue = brightness
        case 4:
            red = t
            green = p
            blue = brightness
        case 5:
            red = brightness
            green = p
            blue = q
        default:
            break
        }
        
        return (red, green, blue)
    }
}

public enum ColorScheme: CaseIterable {
    case light
    case dark
}

extension View {
    public func colorScheme(_ colorScheme: ColorScheme) -> some View {
        return environment(\.colorScheme, colorScheme)
    }
}

enum ColorSchemeEnvironmentKey: EnvironmentKey {
    static var defaultValue: ColorScheme { return ColorScheme.dark }
}

extension EnvironmentValues {
    public var colorScheme: ColorScheme {
        set { self[ColorSchemeEnvironmentKey.self] = newValue }
        get { self[ColorSchemeEnvironmentKey.self] }
    }
}
