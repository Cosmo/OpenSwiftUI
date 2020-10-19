import AssociatedTypeRequirementsVisitor

/**
  **For internal use only.** Use to be able to call a function on a view where you don't know the concrete type at Compile Time.
 Implement `callAsFunction` and a version that can take `Any` will be included as an extension.

 Useful for occassions where your intuition is to cast `Any` to `View`, but Swift will stop you due to the associated type requirement.

 ```swift
 guard let view = view as? View else { return }
 // Do something
 ```
 */
protocol ViewAssociatedTypeRequirementsVisitor: AssociatedTypeRequirementsVisitor {
    associatedtype Visitor = ViewAssociatedTypeRequirementsVisitor
    associatedtype Input = View
    associatedtype Output

    func callAsFunction<T : View>(_ value: T) -> Output
}
