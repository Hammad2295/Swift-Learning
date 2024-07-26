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
func test(hello: ()->()) {
    
    for i in 1...100 {
        print("Test: I am at \(i)")
    }
    
    hello()
    
    
    print("Test: I am done")
}


test() {
    for i in 1...100 {
        print("Hello: I am at \(i)")
    }
}


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

func testing () async throws {
    for i in 1...5000 {
        print(i)
    }
    print("hello one")
}


do {
    try await testing()
    print("Hello two")
}
catch {
    print("I am error")
}
