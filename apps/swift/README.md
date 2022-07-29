# Swift

**Variables and Types**

```swift
var x: Int;
x = 99 // semicolon optional with only one command
x = 88; x = 99

var a: UInt = 1; //unsigned Integer
var b: Double = 0.5; //64 bit floating point
var c: Float = 1.5; //32 bit floating point
var d: Character = "a"; //1 character
var e: String = "abc"; //a string
var f: Bool = true; // a boolean value

//conversion
var j: Double = Double(a)
var k: String = String(c)
```

**Constants**

```swift
let π: Double = 3.14159; //let = const declaration
var pi: Double = 3.2 // var = variable declaration

pi = π; //this works
π = pi; //this does not work (compile error)
```

**Optionals**

```swift
//Optionals can have a nil value
var y1 : Int?;
y1 = 9

print (y1!) //Forced Unpacking. This will crash if it is nil.
var y2 : Int = y1! //Only works if we force unpack

//Conversion from optional to non-optional is always tricky
var x_op : Int? = 10;
var x_noop : Int;

x_noop = x_op //this won't work as x_op is optional
x_noop = x_op! //this will work but crashes if x_op is nil

if x_op != nil {x_noop = x_op!} //you can check for nil
x_noop = x_op ?? 0 //use the coalescing operator (??), as you can define a default. x_noop will be x_op if x_op has a value or 0 if x_op is nil.

//Swift allows to define an optional with a "!". This
//indicates that the value is implicitly unwrapped. Be careful
//when using it as it is like a fallback to programming
//languages without explicit optionals!
var a_imp : String!
a_imp = "abc"
print(a_imp.uppercased()) //will print "ABC"
a_imp = nil
print(a_imp.uppercased()) //will crash...
```

**Strings**

```swift
let c : Character = "d" //Single character stored in "Character"
let eAcute: Character = "\u{E9}" // é unicode characters with \u{...}

var s = "Hello" //Concanating Strings (+, +=) works for strings
s += " Worl"
s += String(c)

let errorCode = 3 //String interpolation (templates) for complex strings
let message = "App crashed with error code: \(errorCode)"

print(s.count) //Number of characters in a string with count

//Strings cannot be indexed with Integers!
//Instead, use the attributes startIndex (for the first index),
//endIndex (for the index after! the last index)
//and the methods index(before:) and index(after:)
var index = s.startIndex
while index != s.endIndex {
    print("Character: \(s[index])")
    index = s.index(after:index)
}
//There is also a method index(_:offsetBy:)
```

**Arrays**

```swift
var integerArray = [Int](); //create an empty array
integerArray.append(12345); //adds an element with append
print(integerArray.count) //get the length of an array
integerArray[0] = 12345 //add or retrieve a value by index

var threeDoubles = Array(repeating: 99.0, count: 3) //auto initialization
var integerArray : [Int] = [99, 8, 12, 102] //array with explicit values
integerArray += [5, 232, 232] //append values
integerArray.append(contentsOf: [2,3])
integerArray.remove(at: 1) //remove value
//the integerArray is now:
//[99, 12, 102, 5, 232, 232, 2, 3]

//often, arrays are returned by methods within the swift universe:
let str = "A, B, C, D, E, F, G"
let array = str.components(separatedBy: ", ")
print(array) // ["A", "B", "C", "D", "E", "F", "G"]
```

**Range Operator**

```swift
//range operator to access/change multiple list elements with one command
var integerArray3 : [Int] = [100, 102, 104, 15]
print(integerArray3[0...2]) //will print [100, 102, 104]

integerArray3[0...2] = [1, 5] //note that the ranges have not the same size!
print(integerArray3) //will print [1, 5, 15]

//range also works with strings and returns a Substring
let greeting = "Hello world"
let index = greeting.firstIndex(of: " ") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning is "Hello"
// Note that beginning is a substring that might
// need to be converted to a String
let newString = String(beginning)
```

**Dictionary**

```swift
var simple = [Int : String]() //dictionary with keys (string) and values (int)
simple[1] = "a value"; //add a value
var ratingOfArtists : [String : Int] = //init with multiple values
    ["Elvis Presley" : 9, "Bob Marley" : 8, "Neil Diamond" : -1];

print(ratingOfArtists.isEmpty) //check if the dictionary is empty
ratingOfArtists.removeValue(forKey: "Elvis Presley"); //delete an item

//by default, the "[]" operator will return an Optional.
//use the "if let" statement for checking
if let rating = ratingOfArtists["Bob Marley"] {
    print("Bob Marley is rated with \(rating) ")
}
else {
    print("Bob Marley is not yet rated")
}
```

**Tuples**

```swift
var errorNoSession = (-22, "User has no session") //create tuple
let (errorCode, errorMessage) = errorNoSession //retrieve values of tuple

var errors = [(Int, String)]() //tuples always need their brackets
errors.append((-1, "User not registered")) //note the double brackets!
```

**Loops**

```swift
var counter = 0 //The for-in loop is straightforward and uses ranges
for index in 0...4 {
    counter += index;
}
print(counter) //= 10 (0+1+2+3+4)

let values = [1,2,3] //simply iterate over lists
for value in values {
    print("Val: \(value)")
}

//for-in loops can also be applied to arrays or dictionaries
let myDictionary: [String : Int] = ["Hello" : 1, "World" : 2]
//for iterating over the dictionary, a tuple is returned
for (key,value) in myDictionary {
    print (key + " " + String(value)); //prints "Hello 1" /newline/ "World 2"
}
//you can iterate only over the keys or values
for key in myDictionary.keys ...
for value in myDictionary.values ...

var counter2 = 0; //There is also a while loop
var i = 10;
while i > 0 {
  counter2 += i;
	i -= 1
}

i = 10 //and a repeat-while loop
repeat {
	counter2 += 1
  i -= 1
} while i > 0
```

**If-Then-Else**

```swift
let val_a = 10 //straightforward, the curly brackets are always required
if (val_a==0) {
    print ("a is 0")
}

//comparison operators ==, <, >, !=, <=, >=, the round brackets are optional
if val_a > 10 && val_a < 12 {
    print ("val_a is between 10 and 12");
}
//valid logical operators are
//NOT(!a) AND(a&&b) OR(a||b)
```

**Currying (Returning Functions)**

```swift
//"add" gets a parameter "a" and returns a function
//that retrieves an Int and returns an Int
func add(a: Int) -> ((Int) -> Int)  {
	//define the function logic and return it
	return {
		(b: Int) -> Int in
			return a + b
	}
}

//using map on a list is a popular example for currying.
//map takes a function as an argument and calls it for all elements.
let addTwo = add(a: 2)
let xs = 1...100
let x = xs.map(addTwo)
print(x) //will print 3,4,5,...101,102
```

**Enumerations**

```swift
enum Planet { //Definition
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune, Pluto
}
let p: Planet = Planet.Mercury //assign an enumeration value to p
if (p == Planet.Pluto) { //compare to an enumeration value
        print("Sorry, not a planet anymore");
}
```

**Classes**

```swift
class Animal {
    var canFly: Bool // property
    var sound : String //another property
    
    init(canFly : Bool, sound : String){ //constructor is called init
        self.canFly = canFly
        self.sound = sound
    }
    init(){ //another constructor with different parameters
        self.canFly = false
        self.sound = "";
    }
    func animalText() -> String {
        return String(self.canFly) + " (" + self.sound + ")";
    }
}
```

**Class Instantiation**

```swift
var sparrow = Animal(canFly: true, sound: "tweet tweet tweet");
let duck = Animal (canFly: true, sound: "quack")
let foo = Animal()
foo.sound = "foo fooo foooo"; //automatic setter

//class instances are passed by reference
sparrow = duck
sparrow.sound = "chirp chirp chirp"
print(duck.sound) //prints "chirp chirp chirp"
```

**Class Inheritance**

```swift
class ServiceAnimal: Animal { //classes can use inheritance
	var usedAs: String;
	init(usedAs: String, canFly : Bool, sound : String){
		self.usedAs = usedAs;
		super.init(canFly: canFly, sound: sound)
	}
	//the term "override" is mandatory
	override func animalText() -> String {
		return super.animalText() + " used as: " + self.usedAs;
	}
}
let dog = ServiceAnimal(usedAs: "guide", canFly: false, sound: "bark");
```

**Class Up- and Downcasting**

```swift
//upcast a ServiceAnimal to an animal
let animal: Animal = dog as Animal

//downcast an animal to a service animal
//downcasting either requires an exclamation point (forced downcast)
let serviceAnimalForced: ServiceAnimal = animal as! ServiceAnimal
//or an optional class that will be nil if the downcasting fails
let serviceAnimalOptional: ServiceAnimal? = animal as? ServiceAnimal

//sometimes, you want to know the class of an object
if dog is ServiceAnimal {} //true
if dog is Animal {} //true
if duck is ServiceAnimal {} //false
```

**Structs**

```swift
//In Swift, structs and classes are very similar.
//Classes are reference types and structs are value types.

// Class
class ClassAddress {
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    var firstName : String
    var lastName : String
}

//Struct
struct StructAddress { //constructors are created by default
    var firstName : String
    var lastName : String
}

var s1 = StructAddress(firstName: "Paul", lastName: "Muster")
var c1 = ClassAddress(firstName: "Peter", lastName: "Muster")
var c2 = c1 //reference copy (both use the same object in memory)
c1.firstName = "XXX"
print(c1.firstName, c2.firstName) //will print "XXX XXX"
var s2 = s1 //value copy (two different memory objects)
s1.firstName = "XXX"
print(s1.firstName, s2.firstName) //will print "XXX Paul"
```

**Exception Handling**

```swift
enum FileLineErrors: Error { //define errors
        case NoFileFound
        case LineTooLong(lineLength: Int)
}
//function that throws an exception
func readFirstLineOfFile() throws -> String {
	if (file == nil) {
		throw FileLineErrors.NoFileFound //and throw
	}
	else if (lineLength > 80) {
		throw FileLineErrors.LineTooLong(lineLength: lineLength);
	}
  //...
}

//Now you can catch the exceptions
do {
	try readFirstLineOfFile();
} catch (FileLineErrors.NoFileFound) {
	NSLog("No file found");
} catch (FileLineErrors.LineTooLong(let lineLength)) {
  NSLog("Your line has " + String(lineLength) +
        " characters, but should only have 80.");
}
```

**Protocols**

```swift
//similar to a Java interface but with some interesting extensions
protocol NameProtocol1 { //define a protocol
  func getName() -> String
}
class User : NameProtocol1 { //a class or struct can implement it
	func getName() -> String {...}
}
//a class/struct can implement multiple protocols

//protocols can define properties
protocol NameProtocol2 {
	//{get} or {get set} defines the operations that
	//the implementing class/struct needs to provide
	var name : String {get}
}
//now the class must have this property:
class User : NameProtocol2 {
	var name : String
	...
}

//protocols can have a default implementation
protocol NameProtocol3 {
    func getName() -> String
} //to be developed in an extension
extension NameProtocol3 {
    func getName() -> String {return "Anonymous"}
}

class User1 : NameProtocol3 {}
print(User1().getName()) //will print Anonymous
class User2 : NameProtocol3 {
    func getName() -> String {return "Admin"}
}
print(User2().getName()) //will print Admin
```

**Some Keyword**

```swift
//opaque result type ("reverse" generic placeholder)
//this function won't compile without "some" as
//swift only accepts returning a protocol if
//it does not use self
func aCollection() -> some Collection {
  return [1, 2, 3]
}
let collection = aCollection()
print(collection.count) // 3
//there are some other advantages with "some",
//one is that comparing "some Protocols" is allowed
//check the official Swift documentation for details
```

**Generics**

```swift
//used in a similar way than Java
func prettyPrint< T >(s : T) {
    print("***", s, "***")
}
prettyPrint(s: "Hallo Welt") //will print *** Hallo Welt ***
prettyPrint(s: 12345) //will print *** 12345 ***

//you can further restrict templates
func prettyPrint< T : StringProtocol >(s : T) {
    print("***", s, "***")
}
prettyPrint(s: "Hallo Welt") //still works:
prettyPrint(s: 12345) //won't compile as 12345 does not conform to StringProtocol
```

**Extensions**

```swift
//can be used to enhance any existing class/struct
extension Double {
  func prettyPrint() -> String {
    return String(format: "%0.2f", self)
  }
}
var d = 0.43454553
print(d.prettyPrint()) //prints 0.43
```

**Async and Await**

```swift
//A typical asynchronous function before async/await:
//function will call the completion closure after the data has been loaded.
func loadData(completion: (Result<String, Error>) -> Void) {
    //...
}

//Rebuilt
func loadData() async {
    //...
}
//Call (with exception handling)
do {
  try await loadData()
} catch {
  // ...
}
```

# SwiftUI

SwiftUI is a **declarative Framework**. It implements a *soft* separation between Controller and View, as the view is generated in code in a special mode (ViewBuilder).

```swift
//Instead of storing references to the components
//that might change over time you connect a (state)
//variable with a component and change the value of
//this one.
struct ContentView : View {
	@State var text = "Hello World"
  //define the components as body
	var body: some View {
		Text(self.text) //if you want to change the text,
	}
}
```

No need of references to components anymore. Just declaring the components as well as their relative position (e.g. A left of B). The framework will take care of the correct positioning as well as a number of other things (e.g. Size of texts, color of components, ...).

**Basic Components:**

| Component   | Description                              |
| ----------- | ---------------------------------------- |
| Text        | Output of Strings                        |
| TextField   | Input of Text                            |
| SecureField | Input of private Text                    |
| Image       | Output of an Image                       |
| Button      | Button to trigger an action              |
| Toggle      | Boolean Switch (on/off)                  |
| Slider      | Selecting a value from a list of options |

**Basic Layout:**

**HStack** (Horizontal Stack) or **VStack** (Vertical Stack) to position the components. It is possible to embed stacks.

```swift
struct ContentView : View {
	@State var text = "Hello World"
	var body: some View {
		//define a VStack
		VStack {
 			Text("First Line") //note that this is a static text!
 			Text(self.text)
 		}
 	}
}
```

Use **Spacers** (`Spacer()`) to fill the rest of the space:

![image-20220622144201823](img/image-20220622144201823.png)

**Modifiers:**

Components can be configured using modifiers. A modifier changes an attribute of the component. A modifier can be changed at runtime using a state variable.

```swift
struct ContentView : View {
	@State var color = Color.black
	var body: some View {
		VStack {
			//set a modifier on the text (foregroundColor)
			Text("Hello World").foregroundColor(self.color)
			Button(action: {
				//change the foreground color to green
				self.color = Color.green
			}) {
  			Text("Click Me")
  		}
		}
	}
}
```

Some useful modifiers:

For Views: `position`, `offest`, `padding`, ...

For Text: `bold`, `italic`, `fontWeight`, `underline`, ...

For Images: `scaledToFit`, `scaledToFill`, `imageScale`, ...

SwiftUI also defines a number of **Constants** someone should use:

Fonts: `Font.largeTitle`, `Font.title`, `Font.body`, ...

Color: `Color.red`, `Color.blue`, `Color.primary`, ...

**Button Example:**

```swift
struct ContentView : View {
	@State var text = "Hello World"
	var body: some View {
		VStack {
			Text("First Line")
			Text(self.text)
			//by clicking this button, the text will
			//change from "Hello World" to "ABC"
			Button(action: {
        self.text = "ABC"
			}) {
				//The label of the button
    		Text("Click Me")
			}
    }
  }
}
```

Different Constructors available:

```swift
//The previous example called the constructor of the button:
Button(action: {
	self.text = "ABC"
}) {
	//The label of the button
	Text("Click Me")
}
//Corresponding Constructor:
public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label)

Button("hello", action: {})
//Corresponding Constructor:
public init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void)

//Short version
Button("hello") {}
//Corresponding Constructor:
public init<S>(_ title: S, action: @escaping () -> Void) where S : StringProtocol
```

**TextField Example:**

```swift
TextField("Name", text: $name, onEditingChanged: {t in}, onCommit: {})
.textFieldStyle(RoundedBorderTextFieldStyle())
.padding().accessibility(hint: Text("Peter Muster"))

TextField("E-Mail", text: $email,
onEditingChanged: {t in }, onCommit: {})
.textFieldStyle(RoundedBorderTextFieldStyle())
.keyboardType(UIKeyboardType.emailAddress).padding()
.accessibility(hint: Text("peter.muster@muster.ch"))

TextField("Phone Number", text: $phoneNumber,
onEditingChanged: {t in}, onCommit: {})
.textFieldStyle(RoundedBorderTextFieldStyle()).padding()
.keyboardType(UIKeyboardType.decimalPad)
.accessibility(hint: Text("+41 79 1234567"))
```

**Image Example:**

Add image to the *asset* folder.

```swift
struct ContentView : View {
	var body: some View {
		//If you want to change the size,
		//always remember to call
		//"resizable" before.
		Image("landscape").resizable()
		.scaledToFit() //.scaledToFill()
	}
}

//SwiftUI provides numerous icons out of the box
//that you can use (and adapt)
HStack {
	Image(systemName: "message.circle")
	Image(systemName: "pencil.tip")
	Image(systemName: "message.circle")
	Image(systemName: "faceid")
  Image(systemName: "airplayvideo")
}
```

For the **Component Types**, SwiftUI only uses **structs** and **protocols**, Classes are never used.

```swift
protocol View { // View is a protocol
	...
	@ViewBuilder var body: Self.Body { get }
}

public struct Text : Equatable { //Text is a struct
	/// - Parameter content: A string to display without localization.
	public init<S>(_ content: S) where S : StringProtocol
	//Note that there are many more initializers
	//Also note the underline (_), no param name is needed for calling
	...
}
```

**Basic View Protocol:**

The **Basic View Protocol** is implemented by all SwiftUI components. The View uses an associated type member variable `body`. It provides a number of methods like background or padding. It defines a body element that needs to be implemented.

```swift
public protocol View {
  associatedtype Body : View
  /// Declares the content and behavior of this view.
  var body: Self.Body { get }
}
```

A body element needs to be defined when creating own Views. Everything works as expected when only one View is returned. For multiple Views, HStack or VStack should be used. Both create a ViewBuilder to arrange multiple Views.

```swift
public struct HStack<Content> : View where Content : View {
	@inlinable public init(alignment: VerticalAlignment = .center,
 	spacing: CGFloat? = nil, @ViewBuilder content: () -> Content)
	...
}
```

**Toggle Component:**

```swift
@State var onOff : Bool = false
var body: some View {
	VStack {
		Toggle(isOn: $onOff) {Text("Default Label 1")}
		Toggle(isOn: $onOff) {Text("Default Label 1")}
    .padding()
		Text("Customized Label 1")
  	Toggle(isOn: $onOff) {Text("")}.labelsHidden()
	}
}
```

**Stepper Component:**

```swift
//choose a variable with inital value
@State var value : Int = 1
Stepper(value: $value, in: 0...10, step: 1) {
  Text("Number of Cycles:")
}
Text("Your number of cycles is: \(value)")
```

**Navigation:**

```swift
var body: some View {
	NavigationView {
		VStack {
			NavigationLink(destination: DetailView()){
        Text("To Detail View")
      }
  	}
  	.navigationTitle("Main") }
 		.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct DetailView : View {
	var body: some View {
		Text("DetailView")
		//note the navigation modifier here!
  	.navigationTitle("Detail")
 	}
}
```

**Lists:**

Lists can be used to present an arbitrary amount of structured data entries. All list cells are usually similar, but list cells can be formatted.

List data can be added by **providing data directly to the list** or by **using a data structure like an array or list**.

```swift
//add the content directly
var body: some View {
	List {
		//this is a general ViewBuilder
   	Text("Robert Redford")
    Text("John Wayne")
    Text("Peter Lorre")
  }.listStyle(PlainListStyle())
}

//use an array
struct Person : Identifiable { //Note the Identifiable protocol
	var firstName : String
	var lastName : String
	var id : String { //this needs to be defined
		get {
			return firstName + "/" + lastName
		}
  }
}
var data : [Person] = [ //an array of static data
  Person(firstName: "Robert", lastName: "Redford"),
  ...
]
var body: some View { //data is accepted because it is Identifiable
	List(data) { person in
		Text(person.firstName + " " + person.lastName)
	}.listStyle(PlainListStyle())
  
  List(data, id: \.firstName) { person in //id is overwritten
  	Text(person.firstName + " " + person.lastName)
	}
  
	List(data) { //Use "refreshable" modifier to let the user refresh it
    ...
	}.refreshable {
  	data = readJSON()
	}
}
```

**Changing the List Data:**

```swift
//a change of the model
//will automatically change the view
Button(action: {
	self.personList.append(Person(firstName: "Humphrey", lastName:"Bogart"))
}) {
	Text("Add")
}
```

**List Navigation:**

```swift
var body: some View {
	NavigationView {
		VStack {
			List(data) { p in
				NavigationLink(p.firstName +" " + p.lastName,
                       destination: DetailView(person: entry))
    	}
    }
  }
}

struct DetailView : View {
	var person : Person
	var body: some View {
		Text(person.firstName + " " + person.lastName)
	}
}
```

**JSON Decoding:**

```json
//JSON File:
[
	{"firstName": "John", "lastName": "Wayne"},
 	{"firstName": "Humphrey", "lastName": "Bogart"},
  ...
]
```

```swift
do {
	//read the file. Note that you can also use a url later
 	let file = Bundle.main.url(forResource: "persons", withExtension: "json")
 	//create a data instance
 	let data = try Data(contentsOf: file!)
 	let decoder = JSONDecoder()
  //and decode it to Person
  return try decoder.decode([Person].self, from: data)
} catch {
 	fatalError("Couldn't load file from main bundle:\n\(error)")
}
```

**File Downloading:**

```swift
//downloading files should be done asynchronously
func download() async throws -> Data { //use async/await
	let url = URL(string: "...")
  let urlRequest = URLRequest(url: url!)
  let (data, response) = try await URLSession.shared.data(for: urlRequest)
  //optional: check response
  return data
}

//use the previous method to download json from a server
func loadJSON() async -> [Person]  {
	do {
  	let data = try await download()
  	let decoder = JSONDecoder()
  	let r = try decoder.decode([Person].self, from: data)
} catch {
  fatalError("Couldn't load file from server")
}
  
//when the data is loaded via onAppear, a Task is needed:
List(
  ...
).onAppear(perform: {
  Task {
     await  data = loadJSON()
	}
})
```

**AsyncImage:**

AsyncImage can be used to load an image from a url:

```swift
AsyncImage(url: URL(string: "https://upload.wikimedia.org/....jpg"))

//During load, a progress bar is presented.
AsyncImage(url: URL(string:"https://www.apple.com/....png")){ image in
		image.resizable() //content closure
  }
  placeholder: { //the placeholder closure
		ProgressView()
  }
  .frame(width: 70, height: 70)
}
```

**Tab View:**

TabView shows a number of tabs. Tabs can be defined using Views within the TabView component.

```swift
struct TabContentView: View {
	var body: some View {
		NavigationView {
			TabView {
        Text("1. Page")
        .tabItem {
     			Image(systemName: "list.dash")
     			Text("Menu")
   			}
  			Text("2. Page")
   			.tabItem {
     			Image(systemName: "gear")
     			Text("Settings")
  			}
      }
		}
  }
}
```

**Base Component:**

```swift
//This component contains common components for
//each page (title, menu, background image, ...)
struct BaseContentView<Content>: View where Content: View {
	let content: Content
  var body : some View {
 		VStack {
			Text("Title")
			content
    }
	}
}
```

**Self-developed Components:**

All structs that implement View can be reused.

```swift
struct ClockView: View {
	@State var formattedTime : String = ""
  //every 0.9 secs, published on main queue (common
  //run Loop), autoconnect when a subscriber attaches
  let timer = Timer.publish(every: 0.9, on: .main, in: .common)
  .autoconnect()
  var body: some View {
		Text(formattedTime).onReceive(timer) {input in
			self.getTime()
		}
  }

	func getTime() {
  	let date = Date()
  	let calendar = Calendar.current
  	let hour = calendar.component(.hour, from: date)
  	let minute = calendar.component(.minute, from: date)
  	let second = calendar.component(.second, from: date)
  	formattedTime = String(format: "%02d:%02d:%02d", hour, minute, second)
	}
}
```

**Component Binding:**

It is often necessary to add a behaviour based on a variable from outside the component. Swift UI provides the `@Binding` property wrapper for this.

```swift
struct ClockView2 : View {
	@Binding var isLarge: Bool //has to be set by the user of ClockView2
	...
  Text(formattedTime).fontWeight(heavySmall())
  ...
  func heavySmall() -> Font.Weight {
		if isLarge { //use the value of isLarge
			return .heavy
		}
		return .light
	}
}

@State var isLarge = true //ClockView2 call example (extraction)
...
ClockView2(isLarge: $isLarge)
```

**State Management:**

Different ways to use state:

- `@State` can be used for local properties.
- `@ObservedObject` is for model objects that are updated outside of a view.
- `@EnvironmentObject` can be used for properties that are indirectly shared by many views.

State variables must be changed after an update, it is not possible to change directly during an update:

```swift
// This will fail
@State var aText : String = ""
var body: some View {
	if aText == "" {
		aText = "Hello World"
	}
  Text(self.aText)
}

//This will work
Text(self.aText).onAppear(perform: {
	if self.aText == "" {
		self.aText = "Hello World"
	}
})
```

**Observed Object:**

```swift
//define a class with protocol ObservableObject
class TelephoneBook : ObservableObject {
	//all properties where a change needs to be tracked
  //in a view are tagged with published
	@Published var numbers = [String:String]()
}

struct ContentView: View {
  //in your view, tag an instance of TelephoneBook with ObservedObject
  @ObservedObject var telephoneBook = TelephoneBook()
  ...
}
```

**For Each:**

`ForEach` constructs views from collections. Offers some additional modifiers within a list, namely `onDelete`, `onInsert` and `onMove`.

```swift
@State var selections = Set<String>()
...
List(selection: $selections) {
	ForEach(persons) { person in
		Text("\(person.lastName)")
  }
  .onDelete(perform: { indices in
  	persons.remove(atOffsets: indices)
  })
  .onMove(perform: { indices, newOffset in
		persons.move(fromOffsets: indices, toOffset: newOffset)
 })
}
```

**Localization:**

Create a `.strings`-file Localizable: Add new key-value pair to the file:

`"Hello World!" = "Hallo Welt!"`

Use key in the code:

`Button("Hello World!", action: {})`

Button Text will be automatically translated.

**Toolbar:**

The Toolbar shows all kind of elements (Buttons, Images, Searchbars, Text) at the top or bottom of a page. Use `ToolbarItem` to add an element to the toolbar and `ToolbarItemGroup` for adding multiple elements. A NavigationView is mandatory!

```swift
NavigationView {
	Text("Hello, World!").padding()
 	.navigationTitle("Toolbar Example")
 	.toolbar {
 		ToolbarItem() {
   		Button("New") {}
    }
    ToolbarItemGroup(placement: .bottomBar) {
   		Button("Remove") {}
     	Button("Edit") {}
     	Spacer()
     	Button("Delete") {}
		}
  }
}
```

**Grids:**

Use `LazyVGrid` or ` LazyHGrid` to create vertically or horizontally scrolling grids. The grid layout is very flexible and column and row sizing can be done automatically based on predefined rules. Cells within the grid can be merged (done by a different cell layout).

```swift
@State var data = ["abc", "def", "ghi", "jkl", "mno", "pqr", "stu", "vwx"]
let columns = [GridItem(.adaptive(minimum: 80), spacing: 0)]
...
ScrollView {
	LazyVGrid(columns: columns, spacing: 0) {
    ForEach(data, id: \.self) { item in
    	Text(item)
			.frame(maxWidth: .infinity, maxHeight: .infinity)
      .border(Color.green)
      .padding()
  	}
	}
}
```

**Geometry Reader:**

Can be used to arrange and size components on a screen. Within GeometryReader, use the closure argument to retrieve width and height of the available space.

```swift
var body: some View {
	GeometryReader {reader in
		//both elements take half the space
		HStack {
			Image(uiImage: self.person.image ?? UIImage())
			.resizable()
    	.scaledToFit()
			.frame(width: reader.size.width / 2)
    
			Text(self.person.fullname)
			.frame(width: reader.size.width / 2)
		}
	}
}
```

**Key Value Storage:**

The most simple storage, can be used with two lines of code. Can be synchronized between apps using iCloud. Is sufficient for many apps

```swift
//create the key value entry
UserDefaults.standard.set(50, forKey: "MaximumNumberOfConnections");
//and save the entry
UserDefaults.standard.synchronize();
//reading a saved entry is also straightforward
print(UserDefaults.standard.integer(forKey: "MaximumNumberOfConnections"));
```

