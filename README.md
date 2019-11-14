# OpenSwiftUI

OpenSwiftUI is an OpenSource implementation of Apple's [SwiftUI](https://developer.apple.com/documentation/swiftui) [DSL (Domain-specific language](https://en.wikipedia.org/wiki/Domain-specific_language).

The project's goal is to stay close to the original API as possible.

The actual rendering of UI elements can then be implemented by other projects for different platforms like Linux, Windows, Embedded, etc.

[SwiftUIEmbedded](https://github.com/Cosmo/SwiftUIEmbedded) is one of the first projects that make use of OpenSwiftUI ([Demo](https://github.com/Cosmo/SwiftUIEmbedded-Demo)).

[![Demo](https://img.youtube.com/vi/bE1bqOhXcY4/0.jpg)](https://www.youtube.com/watch?v=bE1bqOhXcY4)

This project is in early development.

## Background

SwiftUI was introduced by Apple at WWDC 19. Since then, developing applications with graphical user interfaces became easier to read, write and maintain. Unfortunately, the principle "Learn once, apply anywhere" works on Apple platforms, only.

Swift runs on Apple platforms, the web, Linux, Windows and even on embedded devices.
Wouldn't it be great if you could write GUI based applications with SwiftUI on platforms that run Swift?

## Contributing

Xcode 11.2 or higher is required.

It might not be the easiest thing to figure out how SwiftUI works internally but over time and collective guesswork, it can be done.
A good start is to get familar with the SwiftUI interface (see below). This will give you an idea of everything that is available to the user.

Another way is to use reflection (`Mirror(reflecting: …)`) to peek into SwiftUI types and instances.


### Good to know

Methods and properties of SwiftUI that are marked as private, should be prefixed by an `_` (underscore) and marked as public in OpenSwiftUI.
This is neccessary because another project of a GUI implementation might need access.


## Resources

### SwiftUI Interface

Compared to what you can see in Xcode, the file below shows you more than just the public interfaces.
Private properties and even the body of properties, functions and initializers that are marked as `@inlinable` is visible in plain text.  

```
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/SwiftUI.framework/Versions/A/Modules/SwiftUI.swiftmodule/x86_64.swiftinterface
```

### SwiftWebUI

[SwiftWebUI](https://github.com/SwiftWebUI/SwiftWebUI) is an implementation of SwiftUI for the web by [Helge Heß](https://github.com/helje5).
This project's goal is focused exclusivly on the web. 
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

I'd like to give special thanks to [Helge Heß](https://github.com/helje5). He created [SwiftWebUI](https://github.com/SwiftWebUI/SwiftWebUI), contibuted many suggestions to OpenSwiftUI and helped with insights of his findings.


---

## Contact

* Devran "Cosmo" Uenal
* Twitter: [@maccosmo](http://twitter.com/maccosmo)
* LinkedIn: [devranuenal](https://www.linkedin.com/in/devranuenal)

## License

OpenSwiftUI is released under the [MIT License](http://www.opensource.org/licenses/MIT).
