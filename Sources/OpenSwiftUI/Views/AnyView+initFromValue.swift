import CSymbols

// MARK: AnyView init(_ fromValue: Any) implementation

extension AnyView {

    public init?(_fromValue value: Any) {
        // Synthesize a fake protocol conformance record to AnyViewConvertible
        let conformance = ProtocolConformanceRecord(type: type(of: value), witnessTable: 0)
        let type = unsafeBitCast(conformance, to: AnyViewConvertible.Type.self)

        // Call static function on that type, pretending it conforms to AnyViewConvertible
        guard let view = type.anyView(from: value) else { return nil }
        self = view
    }

}

// MARK: - AnyViewConvertible

// Extract metadata for the `View` Protocol via the mangled name.
//
// It needs to be done this way because the associated type
// prevents us from using `View.Type`.
private let viewMetadata: ProtocolMetadata = {
    let module = "OpenSwiftUI"
    let name = "View"
    let postfix = "_p"
    let mangled = "\(module.count)\(module)\(name.count)\(name)\(postfix)"
    return ProtocolMetadata(type: _typeByName(mangled)!)
}()

private protocol AnyViewConvertible { }
extension AnyViewConvertible {
    static func anyView(from view: Any) -> AnyView? {
        // Find witness table to View.
        // This should be equivalent to saying `view as? View`, if it was allowed.
        guard let witnessTable = _conformsToProtocol(Self.self, viewMetadata.protocolDescriptorVector) else { return nil }
        let conformanceRecord = ProtocolConformanceRecord(type: Self.self,
                                                          witnessTable: Int(bitPattern: witnessTable))

        return withUnsafePointer(to: view as! Self) { pointer in
            return anyViewFactory(pointer, conformanceRecord)
        }
    }
}

// MARK: - Protocol Runtime Information

private struct ProtocolConformanceRecord {
    let type: Any.Type
    let witnessTable: Int
}

private struct ProtocolDescriptor { }

private struct ProtocolMetadata {
    let kind: Int
    let layoutFlags: UInt32
    let numberOfProtocols: UInt32
    let protocolDescriptorVector: UnsafeMutablePointer<ProtocolDescriptor>

    init(type: Any.Type) {
        self = unsafeBitCast(type, to: UnsafeMutablePointer<Self>.self).pointee
    }
}

@_silgen_name("swift_conformsToProtocol")
private func _conformsToProtocol(
    _ type: Any.Type,
    _ protocolDescriptor: UnsafeMutablePointer<ProtocolDescriptor>
) -> UnsafeRawPointer?

// MARK: - Factory method for AnyView

// This has to be public in order to be exported.
@_silgen_name("_open_swift_ui_anyViewFactory")
public func _anyViewFactory<C : View>(from view: C) -> AnyView {
    return AnyView(view)
}

private typealias AnyViewFactory = @convention(thin) (UnsafeRawPointer, ProtocolConformanceRecord) ->(AnyView)

// In order to call `_anyViewFactory` without knowing the Type at compile time
// We can find the address of the function and call it ourselves
private let anyViewFactory: AnyViewFactory = {
    return unsafeBitCast(anyViewFactorySymbol(), to: AnyViewFactory.self)
}()
