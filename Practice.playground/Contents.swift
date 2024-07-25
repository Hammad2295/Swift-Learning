import Cocoa

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


// escaping closures
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


