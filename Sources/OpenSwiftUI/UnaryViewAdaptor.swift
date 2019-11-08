//
//  File.swift
//  
//
//  Created by Devran on 08.11.19.
//

import Foundation

public struct _UnaryViewAdaptor<Content> : View where Content : View {
    public var body: Never {
        fatalError()
    }
    
    public var content: Content
    public init(_ content: Content) { self.content = content }
    public static func _makeView(view: _GraphValue<_UnaryViewAdaptor<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
    public typealias Body = Never
}
