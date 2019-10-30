import Foundation

extension Never {
    public typealias Body = Never
    public typealias Value = Never
    public var body: Never {
        fatalError()
    }
}

extension Never: View {
}
