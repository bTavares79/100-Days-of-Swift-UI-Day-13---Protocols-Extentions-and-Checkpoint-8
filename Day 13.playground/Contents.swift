import UIKit

// ========================================== How to create and use protocols =======================================

// This is considered a new type of data so the first letter should be capital
// This almost seems like an interface in a way
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol CanBeElectric {
    
}

// This struct uses the above protocol but finishes out the logic for each function
// the functions can be whatever logic you want but they must return the same type and accept the same type of data
struct Car: Vehicle, CanBeElectric {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
              
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicylce: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)")
    }
}

// This function accepts a type that uses the Vehicle protocol
// The calculation on the estimated time is derived from the type instance that is called when created
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's to slow. I'll try a differnt vehicle")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int){
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
// Becuase the above instance was a Car struct, the function uses that struct types function to calculate the commute distance
commute(distance: 100, using: car)


var bike = Bicylce()
print(bike.currentPassengers)
bike.currentPassengers = 3
print(bike.currentPassengers)
commute(distance: 50, using: bike)


getTravelEstimates(using: [car, bike], distance: 150)

// ================================================ How to use opaque return types =============================================
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())



// =============================================== How to create and use extentions ============================================
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = "      The truth is rarely pure and never simple     "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed)
quote.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)



struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

// Using an extention allows you to have both the memberwise initializer and the custom initializer
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let myBook = Book(title: "Some Book", pageCount: 100)



// ================================================= How to create and use protocol extenstions =================================
// A collection is anything that is multple items. So Arrays, dictionaties, et. This adds this functionality to all of these types
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}


let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}


protocol Person {
    var name: String { get }
    func sayHello()
}

// This extends the above protocol with a default implementation of the sayHello function
extension Person {
    func sayHello(){
        print("Hi, I'm \(name)")
    }
}


struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


