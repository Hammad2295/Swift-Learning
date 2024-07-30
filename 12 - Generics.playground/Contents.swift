import Cocoa

/*
    GENERICS
    - Generic code enables you to write flexible, reusable
    functions and types that can work with any type, subject
    to requirements that you define.
 
    - The placeholder type name doesn’t say anything 
    about what T must be, but it does say that both a and
    b must be of the same type T, whatever T represents.
 
*/

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a1 = 55
var a2 = 33
swapTwoValues(&a1, &a2)
print("First Value is now: \(a1) & Second Value is now: \(a2)")

var s1 = "Hello"
var s2 = "World"
swapTwoValues(&s1, &s2)
print("After s1: \(s1) & s2: \(s2)")



/* 
    Generic Type
    - These are custom classes, structures, and enumerations
    that can work with any type
*/

struct GenericStack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop(_ item: Element) {
        items.removeLast()
    }
}

var stackOfString = GenericStack<String>()
stackOfString.push("hi")
stackOfString.push("hello")
stackOfString.push("hey")
stackOfString.push("hyyy")


print(stackOfString.items)


extension GenericStack {
    var topItem : Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfString.topItem {
    print("Top Item: \(topItem)")
}



// Type Constraints //
func findIndex(of valueToFind: String, in array: [String]) -> Int? {
    
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}

let randomArray = [
    "mustang", "ford", "audi", "pagani", "bmw", "lexus", "mazda"
]

if let foundIndex = findIndex(of: "pagani", in: randomArray) {
    print("Index of Pagani is: \(foundIndex)")
}


/*
    Equatable
    - equatable is a protocol that allows two objects to be
    compared using the == operator
 
    - which requires any conforming type to implement the
    equal to operator (==) and the not equal to operator (!=) to
    compare any two values of that type.
 */

func findIndexEq<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}



/*
    Associated Type
    - associated type gives a placeholder name to a type
    - actual type to use for that associated type isn’t
    specified until the protocol is adopted
 
    - The definition of typealias Item = Int turns the abstract
    type of Item into a concrete type of Int
 
 */

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int {get}
    subscript(i: Int) -> Item {get}
}


struct Stack<Element> : Container {
    var items: [Element] = []
    
    mutating func push (_ item: Element) {
        items.append(item)
    }
    
    mutating func pop () -> Element {
        return items.removeLast()
    }
    
    // conform to protocol
    // typealias Item = Int
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
    
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")


/*
    Generic Where Clause
    - A generic where clause enables you to require that an
    associated type must conform to a certain protocol, or that
    certain type parameters and associated types must be the same.

*/

func allItemsMatch<C1: Container, C2: Container>
        (_ someContainer: C1, _ anotherContainer: C2) -> Bool
        where C1.Item == C2.Item, C1.Item: Equatable {

    if someContainer.count != anotherContainer.count {
        return false
    }



    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }

    return true
}


var stackOfStrings1 = Stack<String>()
stackOfStrings1.push("uno")
stackOfStrings1.push("dos")
stackOfStrings1.push("tres")



if allItemsMatch(stackOfStrings1, stackOfStrings) {
    print("All Items Matched")
}
else {
    print("Not all items matched")
}


// Extensions with a Generic Where Clause
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        
        return topItem == item
    }
}


if stackOfStrings1.isTop("dos") {
    print("Dos is on Top")
}
else {
    print("Dos is not Top")
}
