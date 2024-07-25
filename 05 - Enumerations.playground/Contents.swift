import Cocoa


/*
    - a common type for a group of related values
*/

enum CompassPoint {
    case north
    case south
    case east
    case west
}

var directionToGo = CompassPoint.east
print(directionToGo)

// short form notation
directionToGo = .north

directionToGo = .south
switch directionToGo {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}



enum Planet {
    case earth
    case mars
    case jupiter
    case neptune
    case venus
}

let somePlanet = Planet.venus
switch somePlanet {
    case .earth:
        print("I am on Earth")
    default:
        print("I guess i am not on earth")
}



// Iterating over Enums
enum Car : CaseIterable {
    case mustang, ford, audi, toyota, honda, bmw, mercedes
}

print("Total cases in Car enum: \(Car.allCases.count)")


for car in Car.allCases {
    print(car)
}


// Raw Values //
enum Size : Int  {
    case small = 12
    case medium = 24
    case large = 48
}

print("Size for Small is: \(Size.small.rawValue)")


// Associated Values //
// can attach additional value to enum case

enum Laptop {
    case name (String)
    case price (Int)
}

var laptop1 = Laptop.name("Razor")
print(laptop1)
var laptop2 = Laptop.price(191991)
print(laptop2)


// Multiple associated values //
enum CalFunction {
    case addition(Double, Double)
    case minus(Int, Int)
    case multiple(Double, Double)
}

var operation = CalFunction.addition(55.5, 31.7)

switch operation {
case .addition(let a, let b):
    print("Sum of \(a) & \(b): \(a+b)")
case .minus(let x, let y):
    print("Subtraction of \(x) from \(y): \(y-x)")
case .multiple(let m, let n):
    print("Multiplication of \(m) with \(n): \(m * n)")
}

