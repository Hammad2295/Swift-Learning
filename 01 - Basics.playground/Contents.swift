import Cocoa

// variable - value can be changed
var myVar = 55
myVar = 100
print(myVar)


// constant
let myConst = 66
print(myConst)

var myMessage: String
myMessage = "Hello World"
print(myMessage)

// numeric literals
let numericInt = 17
let binaryInt = 0b10001 // ob then binary (same for octal & hexa)
print(binaryInt)
let octalInt = 0o21
let hexaInt = 0x11


/*
    Int Types
 - Int8: -128 to 127
 - UInt8: 0 to 255
 - Int16
 - UInt16
*/


// let x: UInt8 = -55 // this will throw error


// Conversion //
let three = 3
let pointValues = 0.14159
let pi = (Double(three) + pointValues)
print(pi)

let intPi = Int(pi)
print(intPi)


var isOk = true
if isOk {
    print("Is Ok")
}
else {
        print("Is Not Ok")
}


// Tuples //
let http404Error  = (404, "Not Found")
print(http404Error.1)

let (statusCode, errorMessage) = http404Error // decomposing tuple
print("Status Code: \(statusCode)")

let http200Status = (sCode: 200, sMsg: "Success")
print(http200Status.sCode)


// nil //
var checkState: Int?
// checkState = 1
if checkState == nil {
    print("State is nil")
}
else {
    print("State is not nil")
}

// optional binding //
let possibleNumber = "555"
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}


let x1 = Int(possibleNumber)
if let myNumber = x1 {
    print("My number is \(myNumber)")
}


if let firstNum = Int("5") {
    if let secondNum = Int("55") {
        if firstNum < secondNum {
            print("\(firstNum) < \(secondNum)")
        }
    }
}


// Fall back values //
var name: String? = nil
// name = "haxad"
let greeting = "Hello, " + (name ?? "friend!")
print(greeting)


// assertion pass, displays a message if assertion condition is falsed
let age = -3
// assert(age >= 0, "A person's age can't be less than zero.")



// --------- OPERATORS ----------- //
let (x, y) = (1, 2) // x = 1, y = 2


// unary minus & plus operator
let five = 5
let minusFive = -five
print(minusFive)
let minusMinusFive = -minusFive
print(minusMinusFive)

let minusSix = -6
print(minusSix)
print(+minusSix)


// true because only first value of tuple is used for checking condition
print((1, "zebra") < (2, "apple"))


// Nil Coalescing operator //
let defaultColor = "red"
var userGivenColor: String?
// userGivenColor = "blue"

let colorToUse = userGivenColor ?? defaultColor
print(colorToUse)



// Ranger Operator //
for i in 1...5 {
    print(i)
}

let names = ["Anna", "Alex", "Jack"]
let count = names.count

for x in 0..<count{
    print(names[x])
}



// ---------------------- STRING & CHARACTERS ---------------------- //
let quote = """
    Hello, I am Haxad!
        I am learning Swift!
"""
print(quote)

let sparklingHeart = "\u{1F496}"
print(sparklingHeart)

var emptyString = ""
emptyString = "Horse"
emptyString += " & Carriage"
print(emptyString)


for char in emptyString {
    print(char)
}

let oneChar: Character = "x"
print(oneChar)
let charArray: [Character] = ["c", "a", "t", "s"]
print(String(charArray))
print(charArray[1])


var z = 6
print("6 multiply by 0.5 is: \(Double(z) * 0.5)")



// delimiter //
print(#"6 times 7 is \(6 * 7)."#)
print(#"6 times 7 is \#(6 * 7)."#)


var randomString = "This a random string!"
print(randomString[randomString.startIndex])    // T
print(randomString[randomString.index(before: randomString.endIndex)]) // !
print(randomString[randomString.index(after: randomString.startIndex)]) // h
print(randomString[randomString.index(randomString.startIndex, offsetBy: 5)]) // a


for i in randomString.indices {
    print("\(randomString[i])", terminator: ".")
}

// Inersting & Removing //
var myStr = "welcome"
myStr.insert("!", at: myStr.endIndex)
print("\n\(myStr)")

myStr.remove(at: myStr.index(before: myStr.endIndex)) // removing last char of string //
print(myStr)

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var sceneCount = 0
for scene in romeoAndJuliet {
    if(scene.hasPrefix("Act 1")) {
        sceneCount += 1;
    }
}

print(sceneCount)



// ---------------------- Collection Types ---------------------- //

// ------ ARRAY ------ //
var intArr: [Int] = []
intArr.append(5)
intArr.append(7)
intArr.append(9)
print(intArr.count)


let firstArr = Array(repeating: 5.5, count: 3)
let secondArr = Array(repeating: 0.4, count: 3)
let sumArr = firstArr + secondArr
print(sumArr)


var shoppingList = ["milk", "butter"]
shoppingList.append("eggs")
shoppingList.insert("rice", at: 1)
shoppingList += ["jam", "cake"]
print(shoppingList)

for (index, value) in shoppingList.enumerated() {
    print("Item \(index+1): \(value)")
}


// ------ SETS ------ //
/*
    - Set is used to store only value onces - so no one value can repeat itself
    - set is used where order of values stored is not important
*/
// initalizing empty set //
var letters = Set<Character>()

var favCars: Set<String> = ["Mustang", "Audi", "Chevrolet"]
favCars.insert("Ford")
print(favCars)


if favCars.contains("Audi") {
    print("Audi is best")
}
else {
    print("Audi Not Found!")
}


// Operations on Sets //
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print(oddDigits.union(evenDigits).sorted())
print(oddDigits.intersection(evenDigits))
print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())



// Dictionaries //
/*
    - is used to store values against they unique key
    - not stored in any order
    - is used to lookup values based on their unique key
*/

var nameOfInt: [Int: String] = [:]

nameOfInt[100] = "John"
print(nameOfInt)
nameOfInt.updateValue("Alex", forKey: 100)
print(nameOfInt)

print(nameOfInt.keys)
print(nameOfInt.values)

var animalsAndLegs: [String: Int] = ["cat": 4, "dog": 4, "monkey": 2]
print(animalsAndLegs)



//  ---------------------- Control Flow ---------------------- //

let interval = 5
let endPoint = 30
for tickMark in stride(from: 0, to: endPoint, by: interval) {
    print(tickMark)
}

