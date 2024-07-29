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

//




/*



// creating model
struct Post: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}

func fetchPost(completionHandler: @escaping ([Post])-> Void) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        if let error = error {
            print("Error fetching posts: \(error)")
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("Error Unexpected Status Code")
            return
            }
        
        if let data = data, let postSummary = try? JSONDecoder().decode([Post].self, from: data) {
            completionHandler(postSummary)
        }
        
        
    })
    
    task.resume()
}

var posts: [Post]?

fetchPost { (post) in
    posts = post
    
    for post in posts! {
        print("ID: \(post.id!)\nTitle: \(post.title!)")
    }
}

*/



func generateRandoArray(size: Int, max: Int, num: Int) async throws -> [Int] {
    var arrIntOne: [Int] = []
    for i in 0...max {
        let randomNum = Int.random(in: 1...max)
        arrIntOne.insert(randomNum, at: i)
        print("Print of \(num)\t\(i)")
    }
    print("Done \(num)")
    return arrIntOne
}

Task  {
    async let arr1: [Int] = try generateRandoArray(size: 5000, max: 100, num: 1)
    print("stat --- 1")
}
Task {
    async let arr: [Int] = try generateRandoArray(size: 5000, max: 100, num: 2)
    print("stat --- 2")
}




func testOne(helloOne: ()->()) {
    
    for i in 1...100 {
        print("TestOne: I am at \(i)")
    }
    
    
    helloOne()
    
    print("----------- TestOne: I am done ------------")
}


testOne() {
    for i in 1...100 {
        print("HelloOne: I am at \(i)")
    }
}





func testTwo(helloTwo: @escaping ()->()) {
    
    for i in 1...100 {
        print("Test Two: I am at \(i)")
    }
    
    DispatchQueue.main.async {
        helloTwo()
    }
    
    print("------ Test Two: I am done --------- ")
}


testTwo() {
    for i in 1...100 {
        print("Hello Two: I am at \(i)")
    }
}







func testing () async throws {
    for i in 1...5000 {
        print(i)
    }
    print("hello one")
}

Task {
    do {
        try await testing()
        print("Hello two")
    }
    catch {
        print("I am error")
    }
}



