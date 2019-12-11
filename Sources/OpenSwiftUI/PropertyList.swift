internal struct PropertyList: CustomStringConvertible {
    internal var elements: PropertyList.Element?
    init() { elements = nil }
    var description: String {
        return ""
    }
}
extension PropertyList {
    class Tracker {
    }
}
extension PropertyList {
    internal class Element: CustomStringConvertible {
        internal var description: String {
            return ""
        }
    }
}
