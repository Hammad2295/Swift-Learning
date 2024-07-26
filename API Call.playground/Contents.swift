import Cocoa

// creating a model based on data we are fetching /
struct Response: Codable {
    let count: Int?
    let results: [Film]
}

struct Film: Codable {
    let title: String?
    let episode_id: Int?
    let opening_crawl: String?
    let director: String?
    let release_date: String?
    
    init(title: String, episode_id: Int, opening_crawl: String, director: String, release_date: String) {
        self.title = title
        self.episode_id = episode_id
        self.opening_crawl = opening_crawl
        self.director = director
        self.release_date = release_date
    }
}


func fetchFilms(completionHandler: @escaping([Film]) -> Void) {
    let url = URL(string: "https://swapi.dev/api/films/")!
    
    print("url")
    let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
        print("inside")
        if let error = error {
            print("Error: Fetching Films: \(error)")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("Error: With response, unexpected status code: \(String(describing: response))")
            return
        }
        
        if let data = data, let filmSummary = try? JSONDecoder().decode(Response.self, from: data) {
            completionHandler(filmSummary.results)
        }
         
        
    })
    print("outside")
    task.resume()
}

var films: [Film]?

fetchFilms{ (film) in
    films = film
    
    for f in films! {
        print(f.title!)
    }
}

