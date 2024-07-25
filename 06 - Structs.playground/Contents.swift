import Cocoa

/*
    - Structs are used to store variables of different type
 
    Properties of Structs:
    - structs are pass by value
    - structs can not use inheritence
    - structs do not have deinitializers
    - structs have an automatic initializer, we dont have to define it separatly
    - structs are immutable
    - struct properties are stored on stack
*/


struct Person {
    var name: String = ""
    var age: UInt = 0
}

var person1 = Person()
person1.name = "Haxad"
person1.age = 22
print(person1)


// memberwise initializer
var person2 = Person(name: "Willz", age: 22)
print(person2)



// struct as property //
struct Employee {
    var details = Person()
    var designation: String = ""
}

var employee1 = Employee()
employee1.details.name = "Alex"
employee1.details.age = 35
employee1.designation = "Developer"

print(employee1)


// functions in structs //
struct addAndMultiply {
    var x: Int = 0
    var y: Int = 0
    
    func adding() {
        print("The Sum of \(x) & \(y): \(self.x + self.y)")
    }
    
    func multiplying() {
        print("The Multiplication of \(x) & \(y): \(self.x * self.y)")
    }
}

var calculating = addAndMultiply(x: 5, y: 2)
calculating.adding()
calculating.multiplying()


// Property Wrapers //
/*
        property wrapper adds a layer of separation between code that
        manages how a property is stored and the code that defines a property.
 */
@propertyWrapper
struct MaxThirty {
    private var number: Int = 0
    
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = min(newValue, 30)
        }
    }
}

struct VerifyAge {
    @MaxThirty var age: Int
}

var checkAge = VerifyAge()
checkAge.age = 29
print(checkAge.age)
checkAge.age = 35
print(checkAge.age)


// Mutating - used to modify the properties of a value type from the inside of a method
struct SalaryBonus {
    var salary: Int = 0
    
    mutating func salaryBonus(bonus: Int) {
        salary = salary + bonus
    }
    
    func currentSalary() {
        print("Current Salary: \(salary)")
    }
}

var mySalary = SalaryBonus()
mySalary.salaryBonus(bonus: 1000)
mySalary.currentSalary()



// testing //
struct Size {
    var height: Int = 0
    var width: Int = 0
}

// if change var to let for s1 it will throw an error
var s1 = Size(height: 1080, width: 1920)
var s2 = s1

print("Size One: \(s1.width) x \(s1.height)")
s1.height = 2048
print("Size One: \(s1.width) x \(s1.height)")

// s2 have a pass by value copy of s1 so change in s1 wont show in s2
print("Size Two: \(s2.width) x \(s2.height)")

