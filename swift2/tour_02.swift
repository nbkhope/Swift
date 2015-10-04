/**
 * Swift Tour 02
 * These statements should be used in a playground
 */

// Optionals
var optionalInt: Int?

print(optionalInt) // printing the var gives nil
print(optionalInt == nil)

if optionalInt == nil {
	print("The variable is nil")
}
else {
	print("The variable (optional) has a value and it is not nil")
}

optionalInt = 43

if optionalInt == nil {
	print("The variable is nil")
}
else {
	print("The variable (optional) has a value and it is not nil")
}

optionalInt = nil

if optionalInt == nil {
	print("The variable is nil")
}
else {
	print("The variable (optional) has a value and it is not nil")
}

// Compare with non-optional
var myInt: Int

//print(myInt)
// The above gives an error:
// error: variable 'myInt' used before being initialized

//print(myInt == nil)
// we get an error because myInt is not an optional

// Using let and nil
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

// if optionalName is nil, the condition is false:
//		-> skip to the else clause
// if optionalName is not nil, the condition is true:
// 		-> assign value of optionalName to constant "name"
//		-> execute statements within the if clause
if let name = optionalName {
	greeting = "Hello, \(name)"
}
else {
	print("Oops, optionalName is nil")
	//print(name) -- doesn't exist
}


// Switches
// -> support any kind of data and a wide variety of comparison ops
// -> aren't limited to Ints and tests for equality
let veggie = "red pepper"

// note: no break required, you must have a default clause
switch veggie {
	case "celery":
		print("We've got some celery here")
	case "cucumber":
		print("How about that Japanese cucumber salad?")
	case "broccoli", "cauliflower":
		print("Broccoli or cauliflower is okay")
	case let x where x.hasSuffix("pepper"):
		print("Some kind of pepper, uh? Is it a spicy \(x)?")
	default:
		print("We got some veggies here")
}

// While loops
var n = 2
while n < 100 {
	n = n * 2;
}
print(n)

// repeat while loop (aka do-while)
var m = 2
repeat {
	m = m * 2
} while m < 100
print(m)


// traditional for-loop
var sum = 0
for var i = 1; i <= 10; i++ {
	sum += i
}
print(sum)

// using for-in loop and ..< operator (exclusive)
sum = 0

// 0, 1, 2, 3
for i in 0 ..< 4 {
	sum += i
}
print(sum)

// you can use ... to include the upper bound (there is no < here)
sum = 0

// 0, 1, 2, 3, 4
for i in 0 ... 4 {
	sum += i
}
print(sum)
