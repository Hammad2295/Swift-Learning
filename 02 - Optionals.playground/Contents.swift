import Cocoa


// Optionals //
/*
    - when we want variable or constant to have no value in it
    - optional may or may not contain a value
    - optional can be define either by ! or ?
*/

// optX is optional using ? it can be unwrapped to get value using !
var optX: Int?
print(optX)
//print(optX!)



// optional binding using ! - we use ! when we are sure that value is not null
var number: Int! = 10
print(number)

let myVar: Int = number
print(myVar)


// Optional Binding if-let //
/*
    - help out to find if an optional contains value or not
    - if it contains value then it's stored in temporary variable
    (in following case it's x)
*/
var numb: Int? = 5
if let x = numb {
    print("Value Found \(x)")
} else {
    print("No Value Found")
}


// Guard Statement //
/*
    - just like an if-else block
    - if-block does not execute if conditions become true and next statement is executed
 */

let someVal: Int? = 5

guard let temp = someVal else {
    fatalError("No Value Found!")
}
print("Value was Found")


// Explicit & Implicit Unwrapping
let varOne: Int? = 99
let varExplicit: Int = varOne!
print(varOne)
print(varExplicit)

let varTwo: Int! = 100
let varImplicit: Int = varTwo
print(varTwo)
print(varImplicit)
