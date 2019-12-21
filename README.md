# OpenSwiftUI

OpenSwiftUI is an OpenSource implementation of Apple's [SwiftUI](https://developer.apple.com/documentation/swiftui) [DSL (Domain-specific language)](https://en.wikipedia.org/wiki/Domain-specific_language).

The project's goal is to stay close to the original API as possible.

Currently, this project is in early development.

## Background

Apple introduced SwiftUI at WWDC 19. Since then, developing applications with graphical user interfaces became more comfortable to read, write, and maintain. Unfortunately, the principle "Learn once, apply anywhere" works on Apple platforms, only.

Swift runs on Apple platforms, the web, Linux, Windows, and even on embedded devices.
Wouldn't it be great if you could write GUI based applications with SwiftUI on platforms that run Swift?

## SwiftUI on your platform

OpenSwiftUI provides the API — other projects can implement the actual rendering of UI elements for different platforms like Linux, Windows, Embedded, and many more.

[SwiftUIEmbedded](https://github.com/Cosmo/SwiftUIEmbedded) is one of the first projects that make use of OpenSwiftUI ([Demo](https://github.com/Cosmo/SwiftUIEmbedded-Demo)).

[![Demo](https://img.youtube.com/vi/bE1bqOhXcY4/0.jpg)](https://www.youtube.com/watch?v=bE1bqOhXcY4)

## Contributing

Over time and collective guesswork, it should be possible to re-create the complete SwiftUI API from Apple.
Check the [Status](#status) overview to see what's missing or needs to be completed.

A good starting point is to get familiar with the [SwiftUI interface](#swiftui-interface), focus on certain functionality, and try to re-implement it.
A helpful tool is to use reflection (`Mirror(reflecting: …)`) to peek into SwiftUI types and instances. This reveals the internal structure of instances (properties, types, names and inheritance).

Once you implemented a missing piece, please feel free to contribute a pull request.

*Please note:*

Private methods and properties of SwiftUI should be prefixed by an `_` (underscore) and marked as public in OpenSwiftUI.
Doing this is necessary because the frontend might need access.


Xcode 11.2 or higher is required.


## Status



### Views and Controls

#### Essentials

| Status | Name | Notes |
| --- | --- | --- |
| ✅ | `protocol View` |

#### Text

| Status | Name | Notes |
| --- | --- | --- |
| ✅ | `struct Text` | |
| ❌ | `struct TextField` | |
| ❌ | `struct SecureField` | |
| ✅ | `struct Font` | |

#### Images

| Status | Name | Notes |
| --- | --- | --- |
| ⚠️ | `struct Image` | CGImage not supported |

#### Buttons

| Status | Name | Notes |
| --- | --- | --- |
| ✅ | `struct Button` | |
| ❌ | `struct NavigationLink` | |
| ❌ | `struct MenuButton` | |
| ❌ | `struct EditButton` | |
| ❌ | `struct PasteButton` | |

#### Value Selectors

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct Toggle` | |
| ⚠️ | `struct Picker` | |
| ❌ | `struct DatePicker` | |
| ❌ | `struct Slider` | |
| ⚠️ | `struct Stepper` | |

#### Supporting Types

| Status | Name | Notes |
| --- | --- | --- |
| ✅ | `struct ViewBuilder` | |
| ✅ | `protocol ViewModifier` | |


### View Layout and Presentation

#### Stacks

| Status | Name | Notes |
| --- | --- | --- |
| ✅ | `struct HStack` | |
| ✅ | `struct VStack` | |
| ✅ | `struct ZStack` | |

#### Lists and Scroll Views

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct List` | |
| ❌ | `protocol DynamicViewContent` | |
| ✅ | `protocol Identifiable` | Provided by Swift. |
| ✅ | `struct ForEach` | |
| ❌ | `struct ScrollView` | |
| ⚠️ | `enum Axis` | |

#### Container Views

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct Form` | |
| ⚠️ | `struct Group` | |
| ❌ | `struct GroupBox` | |
| ❌ | `struct Section` | |

#### Spacer and Dividers

| Status | Name | Notes |
| --- | --- | --- |
| ✅ | `struct Spacer` | |
| ✅ | `struct Divider` | |

#### Architectural Views

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct NavigationView` | |
| ❌ | `struct TabView` | |
| ❌ | `struct HSplitView` | |
| ❌ | `struct VSplitView` | |

#### Presentations

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct Alert` | |
| ❌ | `struct ActionSheet` | |

#### Conditionally Visible Items

| Status | Name | Notes |
| --- | --- | --- |
| ✅ | `struct EmptyView` | |
| ❌ | `struct EquatableView` | |

#### Infrequently Used Views

| Status | Name | Notes |
| --- | --- | --- |
| ⚠️ | `struct AnyView` | `init?(_fromValue value: Any)` missing. |
| ✅ | `struct TupleView` | |

### Drawing and Animation

##### Essentials

| Status | Name | Notes |
| --- | --- | --- |
| ⚠️ | `protocol Shape` | |

#### Animation

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct Animation` | |
| ❌ | `protocol Animatable` | |
| ❌ | `protocol AnimatableModifier` | |
| ❌ | `func withAnimation<Result>(Animation?, () -> Result) -> Result` | |
| ❌ | `struct AnimationPair` | |
| ❌ | `struct EmptyAnimationData` | |
| ❌ | `struct AnyTransition` | |

#### Shapes

| Status | Name | Notes |
| --- | --- | --- |
| ⚠️ | `struct Rectangle` | |
| ✅ | `enum Edge` | |
| ❌ | `struct RoundedRectangle` | |
| ⚠️ | `struct Circle` | |
| ❌ | `struct Ellipse` | |
| ❌ | `struct Capsule` | |
| ❌ | `struct Path` | |

#### Transformed Shapes

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `protocol InsettableShape` | |
| ❌ | `struct ScaledShape` | |
| ❌ | `struct RotatedShape` | |
| ❌ | `struct OffsetShape` | |
| ❌ | `struct TransformedShape` | |

#### Paints, Styles, and Gradients

| Status | Name | Notes |
| --- | --- | --- |
| ✅ | `struct Color` | |
| ❌ | `struct ImagePaint` | |
| ❌ | `struct Gradient` | |
| ❌ | `struct LinearGradient` | |
| ❌ | `struct AngularGradient` | |
| ❌ | `struct RadialGradient` | |
| ❌ | `struct ForegroundStyle` | |
| ❌ | `struct FillStyle` | |
| ❌ | `protocol ShapeStyle` | |
| ❌ | `enum RoundedCornerStyle` | |
| ❌ | `struct SelectionShapeStyle` | |
| ❌ | `struct SeparatorShapeStyle` | |
| ❌ | `struct StrokeStyle` | |

#### Geometry

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct GeometryProxy` | |
| ❌ | `struct GeometryReader` | |
| ❌ | `protocol GeometryEffect` | |
| ❌ | `struct Angle` | |
| ❌ | `struct Anchor` | |
| ❌ | `struct UnitPoint` | |
| ❌ | `enum CoordinateSpace` | |
| ❌ | `struct ProjectionTransform` | |
| ❌ | `protocol VectorArithmetic` | |

### State and Data Flow

#### Bindings

| Status | Name | Notes |
| --- | --- | --- |
| ⚠️ | `struct Binding` | |

#### Data-Dependent Views

| Status | Name | Notes |
| --- | --- | --- |
| ✅ | `struct State` | |
| ❌ | `struct ObservedObject` | |
| ❌ | `struct EnvironmentObject` | |
| ❌ | `struct FetchRequest` | |
| ❌ | `struct FetchedResults` | |
| ⚠️ | `protocol DynamicProperty` | `func update()` missing. |

#### Environment Values

| Status | Name | Notes |
| --- | --- | --- |
| ✅ | `struct Environment` | |
| ✅ | `struct EnvironmentValues` | |

#### Preferences

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `protocol PreferenceKey` | |
| ❌ | `struct LocalizedStringKey` | |

#### Transactions

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct Transaction` | |

### Gestures

#### Basic Gestures

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct TapGesture` | |
| ❌ | `struct LongPressGesture` | |
| ❌ | `struct DragGesture` | |
| ❌ | `struct MagnificationGesture` | |
| ❌ | `struct RotationGesture` | |

#### Combined Gestures

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct SequenceGesture` | |
| ❌ | `struct SimultaneousGesture` | |
| ❌ | `struct ExclusiveGesture` | |

#### Custom Gesture

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `protocol Gesture` | |
| ❌ | `struct AnyGesture` | |

#### Dynamic View Properties

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct GestureState` | |
| ❌ | `struct GestureStateGesture` | |

#### Gesture Support

| Status | Name | Notes |
| --- | --- | --- |
| ❌ | `struct GestureMask` | |
| ❌ | `struct EventModifiers` | |


### Legend

| Symbol | Description |
| --- | --- |
| ✅ | Done |
| ❌ | Open |
| ⚠️ | Incomplete |





## Resources

### SwiftUI Interface

Compared to what you can see in Xcode, this [gist]((https://gist.github.com/Cosmo/b4cd7d4c81bf09c5801459b591a322f9)) shows you more than just the public interfaces.
It shows private properties, and the body of `@inlinable` marked properties, functions, and initializers.

```
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/SwiftUI.framework/Versions/A/Modules/SwiftUI.swiftmodule/x86_64.swiftinterface
```

### SwiftWebUI

[SwiftWebUI](https://github.com/SwiftWebUI/SwiftWebUI) is an implementation of SwiftUI for the web by [Helge Heß](https://github.com/helje5).
This project's goal is focused exclusively on the web. 
It deviates a little bit from SwiftUI by taking some shortcuts here and there -- but looks quite complete in functionality and is great for inspiration.  

### SwiftUI symbols

This command prints the symbol table of SwiftUI via the `llvm-mn` utility.

```bash
nm -gUj /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/Frameworks/SwiftUI.framework/SwiftUI | swift-demangle | sed 's/SwiftUI.//g' | sed 's/Swift.//g'
```

You can also have a look at this [gist](https://gist.github.com/Cosmo/deeece2ac8b804f4977b388bb7185b98) instead.


### Links

* [SwiftUI @ViewBuilder Result is a TupleView, How is Apple Using It And Able to Avoid Turning Things Into AnyVIew?](https://forums.swift.org/t/swiftui-viewbuilder-result-is-a-tupleview-how-is-apple-using-it-and-able-to-avoid-turning-things-into-anyview/28181/2)
* [https://stackoverflow.com/questions/56434549/what-enables-swiftuis-dsl](https://stackoverflow.com/questions/56434549/what-enables-swiftuis-dsl)
* [Building Custom Views with SwiftUI](https://developer.apple.com/wwdc19/237)
* [SwiftUI Essentials](https://developer.apple.com/wwdc19/216)
* [Data Flow Through SwiftUI](https://developer.apple.com/wwdc19/226)
* [Introducing SwiftUI: Building Your First App](https://developer.apple.com/wwdc19/231)
* [SwiftUI On All Devices](https://developer.apple.com/wwdc19/240)



## Special thanks

I want to give special thanks to [Helge Heß](https://github.com/helje5). He created [SwiftWebUI](https://github.com/SwiftWebUI/SwiftWebUI), contributed many suggestions to OpenSwiftUI, and helped with insights of his findings.


---

## Contact

* Devran "Cosmo" Uenal
* Twitter: [@maccosmo](http://twitter.com/maccosmo)
* LinkedIn: [devranuenal](https://www.linkedin.com/in/devranuenal)

## License

OpenSwiftUI is released under the [MIT License](http://www.opensource.org/licenses/MIT).
