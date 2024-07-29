import Cocoa


// JsonPlaceHolder API
struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat, lng: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}


func fetchUser(completionHandler: @escaping ([User])->Void) {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        
        if let error = error {
            print("Error Fetching Data! \(error)")
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("Error Unexpected Status Code!")
            return
        }
        
        if let data = data, let userData = try? JSONDecoder().decode([User].self, from: data) {
            completionHandler(userData)
        }
    })
    
    task.resume()
}

var users: [User]?

fetchUser() { (catchUserData) in
    users = catchUserData
    for user in users! {
        print("""
            ---- User # \(user.id) Details ----
            Name: \(user.name)
            Email: \(user.email)
            Username: \(user.username)
            Contact: \(user.phone)
            Address: \(user.address.suite), \(user.address.street), \(user.address.city), \(user.address.zipcode)
            Website: \(user.website)
            \n
        """)
    }
}

