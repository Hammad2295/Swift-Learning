import Cocoa

// ---------------------- Functions ---------------------- //

// with parameters & return type as string
func hello(person: String) -> String {
    return "Hello, " + "\(person)!"
}

print(hello(person: "John"))



// simple void function
func voidFunction() {
    print("Hello, I am Void Function!")
}

voidFunction()


// multiple parameters //
func helloAgain(person: String, isGreet: Bool) -> String {
    if isGreet {
        return "Hello Again \(person)!"
    } else {
        return "Hello, \(person)!"
    }
}

print(helloAgain(person: "Alex", isGreet: true))

// multiple parameter with return type int
func sumOfThree(a: Int, b: Int, c: Int) -> Int {
    return a+b+c;
}

print("Sum of 4, 5, 11 is \(sumOfThree(a: 4, b: 5, c: 11))")



// with multiple return values //
func minAndMax(arr: [Int]) -> (min: Int, max: Int)? {

    if arr.isEmpty { return nil }
    
    var currentMin = arr[0]
    var currentMax = arr[0]
    
    for value in arr[1..<arr.count] {
        if value < currentMin {
            currentMin = value
        }
        else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

let arrInt = [5,2,6,3,8,9]
print(minAndMax(arr: arrInt))


// multiple return values //
func maxAndMax(arr: [Int]) -> (max: Int, secondMax: Int) {
    var max = 0, secondMax = 0;
    
    let newArr = arr.sorted(by: >)
    max = newArr[0]
    secondMax = newArr[1]
    
    return (max, secondMax)
}
let arrayInt = [5,2,16,3,8,9]
print(maxAndMax(arr: arrayInt))



// argument label in function - from before location is label
func intro (person: String, from location: String) -> String {
    return "Hello \(person) from \(location)!"
}

print(intro(person: "Doe", from: "France"))


// default parameter values //
func sumOfTwo(numbOne: Int = 10, numbTwo: Int = 5) -> Int {
    return numbOne + numbTwo;
}
print(sumOfTwo())



// Variadic parameters - accept zero or more values of a specific type //
func sumOfAll(_ numbers: Double...) -> Double {
    var totalSum: Double? = 0.0
    
    for num in numbers {
        totalSum! += num
    }
    
    return totalSum!
}

print(sumOfAll(1.1, 2.2, 3.3, 4.4, 5.5))


var var1 = 10
var var2 = 20

print(var1, var2)

func swapValues(a: inout Int, b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

swapValues(a: &var1, b: &var2)

print(var1, var2)


// omitting parameters names //
func multiplyTwo(_ a: Int, _ b: Int)-> Int {
    return a * b
}

print(multiplyTwo(5, 5))


// using function as type
let calMulitply: (Int, Int) -> Int = multiplyTwo
print("8 times 8 is: \(calMulitply(8, 8))")


// Nested Functions //
func operation(symbol: String) -> (Int, Int) -> Int {
    
    func add(num1: Int, num2: Int) ->Int {
        return num1 + num2
    }
    
    func multiple(num1: Int, num2: Int) -> Int {
        return num1 * num2
    }
    
    let operate = symbol == "+" ? add : multiple
    return operate
}

let operate = operation(symbol: "*")
print(operate(9, 99))


// ----- extra ----- //
// early exit //
/*
    the body of guard is not executed if expression or condition become true
    best can be used with functions
*/

func greetFunction(person: [String: String]) {
    
    guard let name = person["name"] else {
        print("Hello Friend!")
        return
    }
    
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("Weather at your location is good!")
        return
    }
    
    print("Weather at \(location) is really good!")
}

greetFunction(person: ["name":"john", "location":"paris"])

