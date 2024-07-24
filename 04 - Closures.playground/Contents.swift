import Cocoa

// ----------------------------------- Closures  ----------------------------------- //

/*
    Closure Declaration:
    1. parameters - any value passed to closure
    2. returnType - specifies the type of value returned by the closure
    3. in (optional) - used to separate parameters/returnType from closure body
    
*/


// with parameter //
var greet = { (person: String) in
        print("Hello, \(person)!")
}
greet("Alex")


// with parameter & return value //
var square = { (a: Int) in
    return a * a
}
print(square(5))


// closure as a function
func iAmFunction(iAmClosure: ()->()) {
    print("I am Function")
    iAmClosure()
}
iAmFunction(iAmClosure: {
    print("I am Closure")
})


// Trailing Closure //
var incrementMe: Int = 5
print("Before Function & Closure Increment: \(incrementMe)")

func incByFunc(x: inout Int,  incByClo: (_ z: inout Int)->()) {
    x += 1
    print("Function Incremented!")
    
    incByClo(&x)
}

incByFunc(x: &incrementMe) {z in 
    print("Closure Incremented!")
    z += 1
}
print("After Function & Closure Increment: \(incrementMe)")


/*
    - just like an anonymous function
    - contains two paramters of same type and returns bool
 */

let names = ["willz", "faz", "hax", "john", "alex"]

let namesInOrder = names.sorted(by: {
    (s1: String, s2: String) -> Bool in return s1 < s2
})

print(namesInOrder)

// implicit type from context //
// names.sort(by: {s1, s2 in return s1 < s2})

// single-expression //
// names.sort(by: {s1, s2 in s1 < s2})


// trailing closures (with map)
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]


let nums = [15, 78, 99]

let stringNums = nums.map { (number) -> String in
    var number = number
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
            
    return output
} // trailing closure

print(stringNums)

// capturing values //
func makeIncrement(forInc amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementMe2 = makeIncrement(forInc: 5)
print(incrementMe2())
print(incrementMe2())

