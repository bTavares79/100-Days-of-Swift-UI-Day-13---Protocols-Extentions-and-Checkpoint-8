import UIKit

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var agent: String { get set }
    
    func printSummary()
}


struct House: Building {
    var rooms = 0
    var cost = 0
    var agent = "Steve"
    
    func printSummary(){
        print("This house has \(rooms) rooms and costs $\(cost).  The agent who sold it was \(agent)")
    }
}

struct Office: Building {
    var rooms = 0
    var cost = 0
    var agent = "Bob"
    
    func printSummary(){
        print("This office has \(rooms) rooms and costs $\(cost).  The agent who sold it was \(agent)")
    }
}

let myHouse = House(rooms: 10, cost: 500_000, agent: "Mike")
myHouse.printSummary()

let myOffice = Office(rooms: 40, cost: 600_000, agent:"Bob")
myOffice.printSummary()
