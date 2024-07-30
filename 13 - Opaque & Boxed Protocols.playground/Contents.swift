import Cocoa

/*
    OPAQUE & BOXED TYPE PROTOCOLS
    - these defines how you use and handle the type that conform to protocols
    
 
    - Opaque type hide the specific type of value that is returned. Use "some" keyword.
    - Boxed Type, where you use protocol directly as a type
 
 */


protocol Shape {
    func area ()-> Double
}

struct Circle : Shape {
    var radius: Double
    
    func area() -> Double {
        return 3.14 * radius * radius
    }
}

struct Square : Shape {
    var width: Double
    
    func area() -> Double {
        return width * width
    }
}


// only conforming to protocol but caller does not know the type
func makeShape()-> some Shape {
    return Circle(radius: 5.5)
}



// calculate area of any object that conforms the Shape
let shapes: [any Shape] = [ Circle(radius: 5.5), Square(width: 3.5)]

func printArea(of shape: any Shape) {
    print("Area is: \(shape.area())")
}

for shape in shapes {
    printArea(of: shape)
}

