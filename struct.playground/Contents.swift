import Cocoa

struct Employee{
    let name: String
    var vacationAllocated = 14
    var vacationtaken = 0
    
    var vacationRemaining: Int{
        get{vacationAllocated-vacationtaken}
        set{
            vacationAllocated = vacationtaken + newValue
        }
    }
}

var archer = Employee(name: "Stering Archer",vacationAllocated: 14)
//archer.vacationtaken += 4
//archer.vacationRemaining = 5
//print(archer.vacationAllocated)
//archer.vacationtaken += 4
//print(archer.vacationRemaining)


struct City {
    var population: Int
    var description: String {
        if population < 100_000 {
            return "This is a small city."
        } else if population < 1_000_000 {
            return "This is a medium-sized city."
        } else {
            return "This is a large city."
        }
    }
}
let tokyo = City(population: 12_000_000)

//print(tokyo.description)


struct Game{
    var score = 0{
        didSet{
            print("Score is now \(score) compared to \(oldValue)!")
        }
    }
}

var game = Game()
//game.score += 10

struct App{
    var contacts = [String](){
        willSet{
            print("Current value is \(contacts)")
            print("New value will be \(newValue)")
        }
        didSet{
            print("There are now \(contacts.count) contacts")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
//app.contacts.append("1")
//app.contacts.append("2")
//app.contacts.append("3")


struct Player{
    let name: String
    let number: Int
    
    init(name:String){
        self.name = name
        self.number = Int.random(in:1...3)
    }
}

let player = Player(name:"Magan K")
//print(player.number)


struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
    }
}
let country = Country(countryName: "USA")
//country.name
//country.usesImperialMeasurements


struct BankAccount{
    private(set) var funds = 0
    mutating func deposit(amount: Int){
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool{
        if funds > amount{
            funds -= amount
            return true
        }
        else{
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)
//
//if success{
//    print("Yay")
//}
//else{
//    print("oops, too poor")
//}
struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: String...) { //"..." means there will be an array of that object
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: "Mrs Hughes")


struct School1{
    static var StudentCount = 0
    
    static func add(student: String){
        print("\(student) joined")
        StudentCount += 1
    }
}

//School1.add(student:"Mani Fok")
//print(School1.StudentCount)

struct AppData{
    static let version = "1.3 beta 2"
    static let saveFilename = "setting.json"
    static let homeURL = "https://alexiswuprojects.wordpress.com"
}

AppData.version


struct Employee1{
    let username: String
    let password: String
    
    static let example = Employee1(username:"cfederighti",password:"hdfk3nfds")
}

Employee1.example

"""
Check point
 create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down.
"""

struct carInfo{
    private let model: String
    let seatNumber : Int
    var currentGear : Int
    
    init(model: String = "model x", seatNumber:Int=5, currentGear:Int=0){
        self.model = model
        self.seatNumber = seatNumber
        self.currentGear = currentGear
    }
    
    mutating func gearChange(up: Bool){
        if up && currentGear < 5{
            currentGear += 1
        }
        else if !up && currentGear > 0{
            currentGear -= 1
        }else{
            print("You can't switch gear in this way!")
        }
    }
}

 var tesla = carInfo()
tesla.currentGear
