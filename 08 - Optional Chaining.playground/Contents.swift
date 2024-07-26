import Cocoa

/*
    OPTIONAL CHAINING:
    (optional chaining is used, which allows us to use the wrapped
    instance without having to unwrap the optional.)
    
    Optional chaining is a process for querying and calling properties,
    methods, and subscripts on an optional that might currently be nil.
 
    Main difference between optional chaining & forced unwrapping is that forced unwrapping
    throws a runtime error where as optional chaining fails without any runtime error
 
*/

class Residence1 {
    var numberOfRoom = 1
}

class Person1 {
    var residence: Residence1?
}

let john = Person1()

// throws an error
// print(john.residence!.numberOfRoom)

// alternative way of optional binding
if let roomCount = john.residence?.numberOfRoom {
    print("Number of Rooms: \(roomCount)")
}
else {
    print("Unable to fetch number of rooms!")
}

// if
john.residence = Residence1()

if let roomCount = john.residence?.numberOfRoom {
    print("Number of Rooms: \(roomCount)")
}
else {
    print("Unable to fetch number of rooms!")
}


// MODEL CLASSES for OPTIONAL CHAINING
class Person {
    var residence: Residence?
}

class Residence {
    var rooms: [Room] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRoom() {
        print("Total Number of Rooms: \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingNumber: String?
    var buildingName: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber)   \(street)"
        }
        else if buildingName != nil {
            return buildingName
        }
        else {
            return nil
        }
    }
}



let alex = Person()

if let roomCount = alex.residence?.numberOfRooms {
    print("Alex's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}


// setting up address

func creatingAddress ()-> Address{
    
    print("Creating Address")
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Canal View"

    return someAddress
}

// function is not executed
// alex.residence?.address = creatingAddress()

if alex.residence?.printNumberOfRoom() != nil {
    print("Possible to Print Number of Rooms.")
} else {
    print("Not Possible to Print Number of Rooms.")
}

// accessing subscript throught optional chaining //
let alexsHouse = Residence()
alexsHouse.rooms.append(Room(name: "Living Room"))
alexsHouse.rooms.append(Room(name: "Kitchen"))
alex.residence = alexsHouse

if let firstRoomName = alex.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}


let alexAddress = Address()
alexAddress.buildingNumber = "29"
alexAddress.street = "Canal View"
alexAddress.buildingName = "The Larches"

alex.residence?.address = alexAddress

if let alexsStreet = alex.residence?.address?.street {
    print("Alex's Street: \(alexsStreet)")
} else {
    print("Unable to fetch street!")
}


if let alexsBuildingIdentifier = alex.residence?.address?.buildingIdentifier() {
    print("Alex's building identifier: \(alexsBuildingIdentifier)")
}
else {
    print("Unable to Fetch Identifier")
}



// Optional Chaining - More Detailed //
/*
 
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


 
 
 
 
 */

