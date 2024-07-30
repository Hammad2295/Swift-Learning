import Cocoa


class PersonOne {
    var name: String
    
    init(name: String) {
        self.name = name
        print("Person is being Initialized!")
    }
    
    deinit {
        print("Person is being deinitialized!")
    }
}


var ref1: PersonOne?
var ref2: PersonOne?
var ref3: PersonOne?


ref1 = PersonOne(name: "John")
ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil


ref3 = nil


/*
    Strong Reference Cycles:
    - if two class instances hold a strong reference to each other,
    such that each instance keeps the other alive.
*/


class PersonTwo {
    var name: String
    init(name: String) {
        self.name = name
    }
    var apartment: ApartmentOne?
    deinit {
        print("\(name) is being deinitialized!")
    }
}

class ApartmentOne {
    var unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: PersonTwo?
    deinit {
        print("\(unit) is being deinitialized!")
    }
}


var p1: PersonTwo?
var apt1: ApartmentOne?

p1 = PersonTwo(name: "Alex")
apt1 = ApartmentOne(unit: "UnitA4")

p1!.apartment = apt1
apt1!.tenant = p1

p1 = nil
apt1 = nil


/*
    Weak Reference:
    - A weak reference is a reference that doesn’t keep a strong hold
    on the instance it refers to, and so doesn’t stop ARC from disposing
    of the referenced instance.
    
    - ARC automatically sets a weak reference to nil when the instance
    that it refers to is deallocated.
 */

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized!")
    }
}

class Apartment {
    var unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person?
    deinit {
        print("\(unit) is being deinitialized!")
    }
}


var p2: Person?
var apt2: Apartment?

p2 = Person(name: "Alex")
apt2 = Apartment(unit: "UnitA4")

p2!.apartment = apt2
apt2!.tenant = p2

p2 = nil
apt2 = nil


/*
    Unowned Reference:
    - unowned reference is used when the other instance has the
    same lifetime or a longer lifetime.
 
    -  unowned doesn’t make it optional, and ARC never sets an unowned
    reference’s value to nil.
    
    - Use an unowned reference only when you are sure that the reference
    always refers to an instance that hasn’t been deallocated.
*/


/*
    Customer & Credit relationship, customer may or may not have a card, but
    credit card must always have a customer. So customer has credit as optional
    but credit has customer as unowned.
*/

class Customer {
    let name: String
    var creditCard: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being uninitialized!")
    }
}

class CreditCard {
    let number: Int64
    unowned let customer: Customer
    
    init(number: Int64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being uninitialized!")
    }
}


var john: Customer?
john = Customer(name: "John")
john!.creditCard = CreditCard(number: 1234_5678_9012_3456, customer: john!)


john = nil



/*
    Unowned Optional References:
    - when you use an unowned optional reference, you’re responsible for making
    sure it always refers to a valid object or is set to nil.
*/


class Department {
    var name: String
    var course: [Course]
    
    init(name: String) {
        self.name = name
        self.course = []
    }
    
    deinit {
        print("\(name) is being uninitialized!")
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}

var department = Department(name: "Horticulture")


let intro = Course(name: "Survey of Plants", in: department)
let intermediate = Course(name: "Growing Common Herbs", in: department)
let advanced = Course(name: "Caring for Tropical Plants", in: department)


intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department.course = [intro, intermediate, advanced]



/*
    
*/
