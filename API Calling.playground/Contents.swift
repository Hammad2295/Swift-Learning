import Cocoa

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





