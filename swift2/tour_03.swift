/**
 * Swift Tour 03
 * These statements should be used in a playground
 */

// Functions

// Returns the integer sum of two integer args
func getSum(x: Int, y: Int) -> Int {
	return x + y
}

// Returns the sum of three Double args
func getSumOfDoubles(x: Double, y: Double, z: Double) -> Double {
	return x + y + z
}

// Returns a String with the given two String args
func getGreeting(name: String, day: String) -> String {
	return "Hello \(name), today is \(day)"
}

let a = 4, b = 7

// When calling functions in Swift, the first arg label can be omitted
// BUT the subsequent argument labels CANNOT be omitted.
print(getSum(a, y: b))

let m = 4.3, n = 7, o = 1.2

// m and o are Double, but n is Int.
// Swift will not implictly cast things for you
// You have to explicitly cast n to Double
print(getSumOfDoubles(m, y: Double(n), z: o))

let myName = "Joseph", day = "Monday"

// Again, you need argument labels when calling functions
print(getGreeting(myName, day: day))

// Returning more than one value: tuples
func findClassroomById(id: Int) -> (String, Int) {
	let name: String, room: Int
	
	switch id {
	case 0:
		name = "Basketball"
		room = 403
	case 1:
		name = "Soccer"
		room = 302
	case 2:
		name = "Paiting"
		room = 308
	case 3:
		name = "Japanese"
		room = 407
	case 4:
		name = "Chinese"
		room = 304
	case 5:
		name = "English"
		room = 523
	case 6:
		name = "Math"
		room = 608
	default:
		name = "?"
		room = -1
	}
	
	// returns a tuple (a String and an Int)
	return (name, room)
}

let myChineseClass = findClassroomById(4)


// You can access unnamed tuples by using their indices (.0, .1, etc)
print("I have \(myChineseClass.0) in room \(myChineseClass.1)")

print("")

// This function takes an array of Ints as arg
// And returns a tuple of three elements
// Note the returning values are NAMED
func calcStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
	var min = scores[0]
	var max = scores[0]
	var sum = 0
	
	// loop through the array of Ints
	for score in scores {
		if score > max {
			max = score
		} else if score < min {
			min = score
		}
		
		sum += score
	}
	
	// returns three values
	return (min, max, sum)
}


let stats = calcStatistics([4, 8, 12, 48, 19, 100, 43, 87])

// Since the function calcStatistics returned a *named* tuple, you can
// access their values by referring to their names min, max, sum,
// instead of .0, .1, .2
print("The lowest score is \(stats.min)")
print("The highest score is \(stats.max)")
print("The sum of the scores is \(stats.2)")

print("")

// Functions with a Variable Number of Arguments
// Use ... to enable a variable number of args
// The args may be accessed like an array
func sumOf(numbers: Int...) -> Int {
	var sum = 0
	
	// loop through the array of args
	for n in numbers {
		sum += n
	}
	
	return sum
}

print(sumOf())
print(sumOf(3))
print(sumOf(3, 5))
print(sumOf(3, 4, 5, 10, 21))

func average(numbers: Int...) -> Double {
	var sum = 0
	var count = 0
	
	for n in numbers {
		sum += n
		count++
	}
	
	return Double(sum) / Double(count)
}

// Observe the following integer divisions
123 / 4
Double(123 / 4)
Double(123) / Double(4)

average(4, 6, 8, 3, 1) // expect 4.4

// Nested functions
func returnFifteen() -> Int {
	var y = 10
	
	// nested fns. have access to vars that were declared in the outer fn
	func add() {
		y += 5
	}
	
	add()
	
	return y
}

returnFifteen()

print("")

// A function can return another function
// For the return value, 
// 	 put the function-to-be-returned params followed, after ->, by the return vals
func makeIncrementer() -> (Int -> Int) {
	
	func addOne(number: Int) -> Int {
		return 1 + number
	}
	
	// return the function addOne()
	return addOne
}

// get the function
var increment = makeIncrementer()
print(increment(48))
