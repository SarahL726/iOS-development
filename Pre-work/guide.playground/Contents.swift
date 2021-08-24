print("Hello, World")



var myVariable = 42 // variable, can be changed
myVariable = 50
let myConstant = 42 // constant, doesn't need to be known at compile time, but can only be assigned once
// constant or variable must have the same type as assigned

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

// EXPERIMENT
// Create a constant with an explicit type of Float and a value of 4
let explicitFloat: Float = 4

// values are never implicitly converted to another type
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// EXPERIMENT
// Removing the conversion to String from the last line
//let widthLabel = label + width // Error

// simpler way to include values in strings
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// Use """ for multiple line strings. Indentation at the start of each line is removed, as long as it matches indentation of the closing quotation marks.
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

// arrays and dictionaries
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic", // a comma is allowed after the last element
]
occupations["Jayne"] = "Publiic Relations"

// arrays automatically grow
shoppingList.append("blue paint")
print(shoppingList)

// initializer syntax for empty array or distionary
let emptyArray: [String] = []
let emptyDistionary: [String: Float] = [:]
// if type information can be inferred
shoppingList = []
occupations = [:]



// for-in
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// use if and let together to work with values that might be missing
var optionalString: String? = "Hello"
print(optionalString == nil)
var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, nobody."
}
//print(greeting)

// another way to handle optional values
// provide a default value using the ?? operator
let nickname: String? = nil
let fullname: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullname)"

// switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
// only choose one case to execute

// use for-in to iterate key-value dictionary
// dictionaries are an unordered collection
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// while & repeat-while
var n = 2
while n < 100 {
    n *= 2
}
print(n)
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// for-in
var total = 0
for i in 0..<4 {
    total += i
}
print(total)



// declare a function
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

// _ to use no argument label
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

// tuple
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

// nested func
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// func is a first-class type
// it can return another function as its value
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// a func can take another func as one of its arguments
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// closure
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

// EXPERIMENT
// Rewrite the closure to return zero for all odd numbers
numbers.map({ (number : Int) -> Int in
    if number % 2 == 1 {
        return 0
    }
    return number
})

// closure more precisely
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// can refer to parameters by number instead of by name
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)



// class
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// create an instance of class
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

// use init for initialization
// this = self in Swift
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// deinit: create a deinitializer if you need to perform some cleanup before the object is deallocated
// subclass include theiir superclass name after their class name
// override HAS TO BE noticed, or will create error; methods that actually doesn't override with OVERRIDE will also be detected by compiler
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// EXPERIMENT
// Circle that takes a radius and a name
class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "This is my circle with radius \(radius)."
    }
}

// getter and setter
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// willSet & didSet
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

// ?
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength



// enum
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

// EXPERIMENT
// write a func that compares two Rank values by comparing their raw values
func compRankValue(Rank1: Rank, Rank2: Rank) -> String {
    if Rank1.rawValue == Rank2.rawValue {
        return "\(Rank1) is the same as \(Rank2)."
    } else if Rank1.rawValue < Rank2.rawValue {
        return "\(Rank1) is smaller than \(Rank2)."
    } else {
        return "\(Rank1) is larger than \(Rank2)."
    }
}

// init?(rawValue:) to make an instance of an enum from a raw value
// it returns either the enumeration case matchiing the raw value or nil if there's no matching Rank
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

// the case values of an enumeration are actual values
enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

// EXPERIMENT
// add a color() method to Suit that returns "black" and "red"

// when assigning a value to hearts: Suit.hearts
// when known in self: .hearts

enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}

// EXPERIMENT
// add a third case to ServerResponse and to the switch
// well, it looks too easy...

// structure
// !!! structure is very likely to class
// structures: always copied when they;re passed around in your code
// classes: passed by reference
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// EXPERIMENT
// func that returns an array containing a full deck of cards, with one card of each combination of rank and suit

func Cards() -> [Card] {
    var cards: [Card] = []
    
    func addRank(suit: Suit){
        cards.append(Card.init(rank: Rank.ace, suit: suit))
        cards.append(Card.init(rank: Rank.two, suit: suit))
        cards.append(Card.init(rank: Rank.three, suit: suit))
        cards.append(Card.init(rank: Rank.four, suit: suit))
        cards.append(Card.init(rank: Rank.five, suit: suit))
        cards.append(Card.init(rank: Rank.six, suit: suit))
        cards.append(Card.init(rank: Rank.seven, suit: suit))
        cards.append(Card.init(rank: Rank.eight, suit: suit))
        cards.append(Card.init(rank: Rank.nine, suit: suit))
        cards.append(Card.init(rank: Rank.ten, suit: suit))
        cards.append(Card.init(rank: Rank.jack, suit: suit))
        cards.append(Card.init(rank: Rank.queen, suit: suit))
        cards.append(Card.init(rank: Rank.king, suit: suit))
    }
    
    addRank(suit: Suit.spades)
    addRank(suit: Suit.hearts)
    addRank(suit: Suit.clubs)
    addRank(suit: Suit.diamonds)
    
    return cards
}



// protocol
protocol ExampleProtocal {
    var simpleDescription: String { get }
    mutating func adjust()
}

// class, enum, struct can all adopt protocals
class SimpleClass: ExampleProtocal {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust(){
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocal {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// extension: add functinoality to an existing type, or add protocol conformance to a type that's declared elsewhere, or even to a type that you imported from a library or framework
extension Int: ExampleProtocal {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

// EXPERIMENT
// write an extension for the Double type that adds an absoluteValue property
extension Double{
    var absoluteValue: Double {
        if self < 0 {
            return -self
        }
        return self
    }
}

// methods outside the protocol definition aren't available
let protocolValue: ExampleProtocal = a
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty) // Error



// You represent errors using any type that adopts the Error protocol
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// throw: throw an error
// throws: mark a function that can throw an error
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// do-catch & try
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

// EXPERIMENT
// change the priiniter name to "Never Has Toner", it will throw an error
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

// multiple catch
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// EXPERIMENT
// try to throw the errors
// Looks easy, too lazy to do this

// try?: convert the result to an optional
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 2885, toPrinter: "Never Has Toner")

// defer: executed after all other code in the function, right before the function returns
// the code is executed regardless of whether the function throws an error
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)



// generic function or type
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

// or class, enum, struct
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// where: specify a list of requirements
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])

// EXPERIMENT
// Modify the anyCommonElements(_:_:) function to make a functiont that returns an arrya of the elements that any two sequences have in common
func commonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Element]
    where T.Element: Equatable, T.Element == U.Element{
        var common: [T.Element] = []
        
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    common.append(lhsItem)
                }
            }
        }
        
        return common
}
