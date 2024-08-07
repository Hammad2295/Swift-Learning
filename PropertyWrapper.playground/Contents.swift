import Cocoa

@propertyWrapper
struct AllCaps {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.uppercased()
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}


@AllCaps var name: String = "haxad"
print(name)

