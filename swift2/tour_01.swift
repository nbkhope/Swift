/**
 * Swift Tour 01
 * These statements should be used in a playground
 */

// The print function
print("Hello World")

// Constants and Variables
let PageTotal = 20
var count: Int

// You don't need semicolons to end a statement in Swift
print("There are \(PageTotal) pages you have to read.")

// Parenthesis are optional
for count = 0; count < PageTotal; count++ {
	print ("Reading page \(count+1)...")
}

// Braces are mandatory even for single-statement if's
if count == PageTotal {
	print("You have read everything. Good!")
}
else {
	print("Why didn't you read everything?")
}

print("")

// Explicit declaration & initialization
let myVar1: Float = 4

// Values are never implicitly converted to another type
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let yourName = "Jackson"

// String interpolation
print("Hello, mr. \(yourName). Here is a fp number: \(3.4 + 7.5)")

// Arrays
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
print("Your second item is \(shoppingList[1])")

// Dictionary
var occupations = [
	"Malcolm": "Captain",
	"Kaylee": "Mechanic",
]

let firstDude = "Malcolm"
let separator = " and "
let secondDude = "Kaylee"

print("Your dictionary contains the following values: \(occupations[firstDude]! + separator + occupations[secondDude]!)")
print("Your dictionary contains the following values: \(occupations[firstDude]) and \(occupations[secondDude])")

// Note the Optional("...") thingie
let dictValue = "Your dictionary contains the value \(occupations[firstDude])."

// This one works out fine. The above only appears if you try doing string interpolation
let anotherDictValue = occupations["Kaylee"]

print("")

// Create empty array and dictionary 
// (if you use let instead of var, 
// then you won't be able to assign any values after this)
var emptyArray = [Int]() // array of integers
var emptyDict = [String: Int]() // dict that maps from String to Int

emptyArray = [2, 4, 5, 6, 6]

emptyDict = ["James": 24000, "Holly": 36000, "Alicia": 76800]

for item in emptyArray {
	print("Number is \(item)")
}

print("")

// foreach loop
for (key, value) in emptyDict {
	print("Employee \(key) makes U$ \(value) per year.")
}
