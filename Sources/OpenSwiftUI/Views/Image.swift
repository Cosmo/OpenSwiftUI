public struct Image: View, Equatable {
    public typealias Body = Never
    
    public var _imageData: ImageData
    
    public init(imageData: ImageData) {
        self._imageData = imageData
    }
}

extension Image {
    public var body: Never {
        fatalError()
    }
}

// This actually does not belong in OpenSwiftUI
// But for now will stay here, until there is
// a better way to pass image data to Image().
public struct ImageData: Equatable {
    public var bytes: [UInt8]
    public var size: Size
    
    public init(bytes: [UInt8], size: Size) {
        self.bytes = bytes
        self.size = size
    }
}
