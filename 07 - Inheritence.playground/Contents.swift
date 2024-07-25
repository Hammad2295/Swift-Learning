import Cocoa


class Vehicle {
    var model: String
    
    init() {
        self.model = ""
    }
    init(model: String) {
        self.model = model
    }
    
    func carType() {
        print("Four Wheel or Two Wheel")
    }
    
    func information() {
        print("Vehicle Model is: \(model)")
    }
}

class Car : Vehicle {
    var year: Int
    
    
    override init(){
        self.year = 0
        super.init()
    }
    
    override func carType() {
        super.carType()
        print("Four Wheel")
    }
    
    func displayInformation() {
        information()
        print("Car Year is: \(year)")
    }
}


var carOne = Car()
carOne.model = "Toyota"
carOne.year = 2019

carOne.displayInformation()
carOne.carType()
