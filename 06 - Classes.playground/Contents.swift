import Cocoa

/*
    Classes are just blueprint of different objects containing methods & properties
    related to that object
 
    Unique Properties of Classes:
    - Classes are reference type (pass by reference)
    - Classes support inheritence
    - Classes have deinitializers
    - Classes are mutable
    - For classes have to create initializer separatly
    - Class instance is on heap
*/

class Area {
    // defining properties (stored properties)
    var length: Double = 0.0
    var width: Double = 0.0
    
    // computed property
    var sum: Double {
        length + width
    }
    
    init() {}
    
    // initializer
    init(length: Double, width: Double) {
        self.length = length
        self.width = width
    }
    
    func calculateArea() {
        print("Area is: \(self.length * self.width)")
    }
    
    deinit {
        print("Memory Deallocated!")
    }
}

var square: Area? = Area()
square?.length = 10.5
square?.width = 5.2
square?.calculateArea()
print("Sum: \(square!.sum)")
square = nil




// GETTERS & SETTERS - computed values //
class Distance {
    var kilometer: Double = 0.0
    
    // getter & setter for computed property
    var meter: Double {
        get {
            kilometer * 1000
        }
        
        set(newMeter) {
            kilometer = newMeter / 1000
        }
    }
}


let objDistance = Distance()
objDistance.kilometer = 2

// using get method to print value which is km (2) * 1000 // output: 20000
print(objDistance.meter)

// using setter to set value of meter to 4000 which sets vale of km after eneteredValue/1000
objDistance.meter = 4000
print(objDistance.kilometer)


// getter & setter for stored properities'=
class Person {
    private var _name: String = ""
    private var _age : Int = 0
    
    // getter & setter
    var name: String {
        get {
            return _name
        }
        set(newVal) {
            _name = newVal
        }
    }
        
    var age: Int {
        get {
            return _age
        }
        set {
            _age = newValue
        }
    }
}
    
    
let personOne = Person()
personOne.name = "willz"
personOne.age = 22

print("Name: \(personOne.name) \nAge: \(personOne.age)")




// Property Observers - willSet & didSet
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newSteps) {
            print("About to set New Steps: \(newSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) New Steps")
            }
        }
    }
}


let stepsCount = StepCounter()
stepsCount.totalSteps = 200
stepsCount.totalSteps = 280
stepsCount.totalSteps = 350

