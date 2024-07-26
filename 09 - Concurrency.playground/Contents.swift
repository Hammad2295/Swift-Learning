import Cocoa


/*
    Concurrency:
    (asynchronous and parallel coding)
 
    - Asynchronous code can be suspended and resumed later,
    tho only one piece of the program executes at a time.
 
    - Parallel coding means multiple pieces of code at same time (multi threading)
*/


/*
    Task yield:
    - you can periodically call Task.yield() to explicitly add suspension points.
    await Task.yield()

    Task sleep:
    - this method can suspend task for at least given amount of time
    await Task.sleep(for: .seconds(2))
 
    Calling Asynchronous Functions in Parallel:
    To call an asynchronous function and let it run in parallel with code around it,
    write async in front of let when you define a constant, and then write await each
    time you use the constant.
 
     // Calling Asynchronous //
     async let photoOne = downloadPhoto(named: photoNames[0])
     async let photoTwo = downloadPhoto(named: photoNames[1])
     async let photoThree = downloadPhoto(named: photoNames[2])

     let photos = await [photoOne, photoTwo, photoThree]
*/




/*
    Tasks and Group Tasks:
    - Tasks are arranged in a hierarchy. Each task in a given task group
    has the same parent task, and each task can have child tasks.
    - Task in Swift is an asynchronous operation that provides an alternative
    to traditional methods like DispatchQueue.main.async {}
 
    - structured concurrency
    
 
    Actors:
    -  Actors let you safely share information between concurrent code. Mostly
    used in tasks as they are isloated from each other
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
    do {
        async let arr1: [Int] = try generateRandoArray(size: 5000, max: 10000, num: 1)
    } catch {
        print("Hello error!")
    }
    print("stat---1")
}


Task(priority: .background) {
    async let arr: [Int] = try generateRandoArray(size: 5000, max: 10000, num: 3)
    print("stat---2")
}







