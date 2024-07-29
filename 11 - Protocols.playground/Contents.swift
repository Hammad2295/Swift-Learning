import Cocoa

/*
    Protocols
    - acts like blue prints of methods or properties that can be adopted
    by class or another type
    
*/


// blue-print of class property & method
protocol Greet {
    var name: String {get}
    
    func greeting()
}

class Person: Greet {
    var name = "Haxad"
    
    func greeting() {
        print("Hello, \(name)")
    }
}


let personOne = Person()
personOne.greeting()


// Multiple / Composition  protocols
protocol Variables {
    var numOne: Int {get set}
    var numTwo: Int {get set}
}

protocol Addition {
    func sum(_ one: Int, _ two: Int)
}

protocol Product {
    func mulitply(_ one: Int, _ two: Int)
}

class Calculate: Variables, Addition, Product {
    var numOne: Int = 0
    var numTwo: Int = 0
    
    init(n1: Int, n2: Int) {
        self.numOne = n1
        self.numTwo = n2
    }
    
    func sum(_ n1: Int, _ n2: Int) {
        print("Sum of \(n1) & \(n2): \(n1 + n2)")
    }
    
    func mulitply(_ n1: Int, _ n2: Int) {
        print("Product of \(n1) & \(n2): \(n1 * n2)")
    }
}

let myCal = Calculate(n1: 10, n2: 15)
myCal.sum(myCal.numOne, myCal.numTwo)
myCal.mulitply(myCal.numOne, myCal.numTwo)



// Protocol Inhertience
protocol Car2 {
    var color: String {get}
    var engineSize: Int {get}
}

protocol Brand : Car2 {
    var model: Int {get}
    var brand: String {get}
}

protocol Detail : Brand {
    func printDetails()
}

class Vehcile: Detail {
    var model: Int = 0
    var brand: String = ""
    var color: String = ""
    var engineSize: Int = 0
    
    init(model: Int, brand: String, color: String, engineSize: Int) {
        self.model = model
        self.brand = brand
        self.color = color
        self.engineSize = engineSize
    }
    
    func printDetails() {
        print(
        """
            ----- Car Details -----
            Car Brand: \(self.brand)
            Car Model: \(self.model)
            Car Color: \(self.color)
            Car Engine Size: \(self.engineSize)
        """
        )
    }
}


let carOne = Vehcile(model: 2019, brand: "Toyota", color: "White", engineSize: 1300)
carOne.printDetails()



/*
    DELEGATES
    - A delegate is a design pattern that allows one object to send
    messages to another object when a specific event happens.
*/

protocol Vehicle1 {
    var speed: Double { get }
    func accelerate()
}


class Car1 {
    var delegate: DeletgateX?
    
    func startEngine() {
        print("Engine started")
        delegate?.didStartEngine()
    }
    
    // class only protocol - can only be used by class only not by structs or enums
    protocol DeletgateX : AnyObject {
        func didStartEngine()
    }

}

class Driver: Car1.DeletgateX {
    func didStartEngine() {
        print("Driver is ready to drive")
    }
}




let myCar1 = Car1()

let driver = Driver()

myCar1.delegate = driver
myCar1.startEngine()



// Declaring Protocol Adoption with an Extension
protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A Hamster named \(name)"
    }
}

extension Hamster : TextRepresentable {}


let simonTheHamster = Hamster(name: "Simon")
let representation: TextRepresentable = simonTheHamster
print(representation.textualDescription)


