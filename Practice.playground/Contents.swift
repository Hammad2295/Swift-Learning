import Cocoa

/*
func makeCounter() -> () -> Int {
    var count = 0
    
    let counter: ()-> Int =  {
        count += 1
        return count
    }
    return counter
}

let counter1 = makeCounter()
let counter2 = makeCounter()

print("Counter 1: \(counter1())")
print("Counter 1: \(counter1())")
print("Counter 1: \(counter1())")
print("Counter 2: \(counter2())")
print("Counter 2: \(counter2())")
*/

// escaping closures
/*
func retry(times: Int, task: @escaping ()->Bool) {
    for _ in 1...times {
        if task() {
            print("Task is completed Successfully!")
            return
        }
    }
    print("Task failed after \(times) attempts")
}

retry(times: 3) {
    let success = false
    print("Task attempted, success: \(success)")
    return success
}
*/

protocol Pet {
    var name: String? {get set}
    func makeSound()
}

class Cat: Pet {
    var name: String?
    
    init(name: String? = nil) {
        self.name = name
    }
    
    func makeSound() {
        print("meow")
    }
}

class Person {
    var name: String
    var pets: [Pet]?
    
    // failable constructor
    init?(name: String) {
        guard !name.isEmpty else {return nil}
        self.name = name
    }
}


// so person is instance of optional<Person> cos of failable, not instance of Person
let person = Person(name: "James")
let pet = Cat(name: "Bella")

person?.pets = [pet]

let newPet = Cat()

person?.pets?.append(newPet)

// now setting newPet name
person?.pets?[1].name = "Whisker"

let petName = person?.pets?[1].name

print("Pet Name: \(petName!)\tType: \(type(of: petName))")

// calling function through chaining
person?.pets?[0].makeSound()



let names = ["Alex", "John", "Lilly"]
let persons = names.map(Person.init)

let randomCat: Cat = Cat()
persons[0]?.pets = [randomCat]

print(type(of: persons[0]?.pets?[0].name))

/*
    - in an optional chain, a question mark must be placed
    immediately after the name of any optional in the chain
    (peron?.pets?[0].name)
 
    - question mark after the square brackets in an optional
    chain in cases where the instance on which we are using a
    subscript to retrieve a value is not an optional, but the
    value thus retrieved, which we want to use to set or retrieve
    the value of a property, or call a method, is an optional
    (persons[0]?.pets?[0])
 
*/

persons[0]?.pets?[0].name = "Fluffy"

let randomPersonaCat = persons[0]?.pets?[0].name
print(randomPersonaCat!)


