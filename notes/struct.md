# Struct
##  Method vs Functions
- methods belong to a type
    - eg: structs, enums, classes
- Both can accpet parameters and return values

- **Method advantage** 
    - avoid namespace pollution

## Marking Methods as Mutating
A method not marked as mutating cannot make changes to struct properties (even it's `var`!)

---
## Computed property
- Stored property
- computed property: 
    - updated every time you use it
    - between methods and variables
- To use it or not?
    - depends on if this property depends on another data
- get/ set function
- `newValue` swift built in function (in `set`)
- constants cannot be computed properties

## Property Observers
- takes actions whenever property changes
- Use it with a `didSet` and `oldValue`; `willSet` and `newValue`
```
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
```

- Why use it?
    - executed every time you change a property
    - Don't use it if you are including slow work

- We use `didSet` more brcause we want to take actions after the changes like update interface, save changes, etc.

- We also use `willSet` to know the state of the program before change is made.

---

## Initializer
- special functions inside structs
- to prepare for a new struct
- `init` does not start with `func`

- If you want to have both the default and custom initializer:
```
struct Employee{
    var name: String
    var yearsActive = 0
}

extension Employee{
    init(){
        self.name = "Anonymous"
        print("Creating an anonymous employee")
    }
}

#So that both will work:
let roslin = Employee(name:"Laura Roslin")

let anon = Employee()
```

## Self Method
- refers to a current instance of a struct
- required for accessing self inside a closure that belongs to a class.

---
## Limit Access to Internal Data w/ **Access Control**
- types
    - `private`: Don't let anything outside the struct use this.
    - `fileprivate`: Don't let anything outside the current file use this.
    - `public`: let anyone, anywhere use this.
    - `private(set)`: public read, inside method write.
- put `types above` before `var`
- Swift cannot generate memberwise initializers for private properties **even with default value!**
- Use custom init when access control is present
- Why use it?
    1. help developers control what they can do
    2. good for other people to know which property should not be changed.

---
## Static properties and methods
- adding methods and properties to struct itself but not instances.


