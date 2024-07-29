import Cocoa

/*
    EXTENSIONS
    - to enhance functionality of an existing type
    - mostly used to add more features or functions to existing classes
*/

class Temperature {
    var celsius: Double = 0
    
    func setTemperature(celsius: Double) {
        self.celsius = celsius
        print("Temperature in Celsius: \(self.celsius)")
    }
}

extension Temperature {
    func convert() {
        var far = (celsius * 1.8) + 32
        print("Temperature in Fahrenheit: \(far)")
    }
}


let temp = Temperature()
temp.setTemperature(celsius: 45.0)
temp.convert()



// Computed Property
class Circle {
    var radius: Double = 0.0
}

extension Circle {
    var area: Double {
        return 3.14 * radius * radius
    }
}


let circleOne = Circle()
circleOne.radius = 5.5
print("Area of Circle: \(circleOne.area)")
