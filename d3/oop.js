// Object 
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*
  First example: from codecademy
*/
// define an object
var phonebookEntry = {};

// define attributes and methods of object. Well, the way of definition is like python dictionary
phonebookEntry.name = 'Oxnard Montalvo';
phonebookEntry.number = '(555) 555-5555';
phonebookEntry.phone = function() {
  console.log('Calling ' + this.name + ' at ' + this.number + '...');
};

phonebookEntry.phone();

/*
  1.
  var obj = {
    key: value,
    key: value
    ...
  };
  
  2.
  var obj = new Object();
 
  then followed with attribute (key - value)

  3. 
  function Object(attr1, attr2, ...) {
    this.attr1 = attr1;
    this.attr2 = attr2; // very similar to java
  }
*/

var myObj = new Object();
myObj.name = 'bangda';
myObj.age  = 23;

var myObject = {
  name: 'Bangda Sun',
  age: 23,
  male: true,
  type: 'Most excellent',
  interests: ['Programming', 'Basketball', 'Cooking']
}; // keep in mind use colon : rather than assignement sign =

// Anothe example, use Object() to create object. Additionally, there are two ways to set/access the attributes
var friends = new Object();
friends.bangda = {}; // we can add properties into bangda, equivalent to friends.bangda = new Object()
friends[jiahui] = {}; // we can add properties into jiahui

// New loop for object
/*
  for (var key in object) {
    ...
  }
  
  one example:
*/
var friends = new Object();
friends.bill = {};
friends.steve = {};

friends.bill = {
    firstName : 'Bill',
    lastName : 'James',
    number : '23',
    address : ['169 Manhattan Ave', '3A']
}
    
friends.steve = {
    firstName : 'Steve',
    lastName : 'Harden',
    number : '13',
    address : ['169 Manhattan Ave', '4A']
}

// list(): list info of object - example of for loop with objects
var list = function(object) {
    for (var key in object) {
        console.log(key);
    }
}

list(friends.bill)

// search() function: take a name, find the mathced first name in friends
var search = function(name) {
    for (var key in friends) {
        if (friends[key].firstName === name) {
            console.log(friends[key]);
            return friends[key];
        }
    }
}

// Methods
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*
  Similar to function, while use obj.method = function(args) {};
  sometimes we can use 'this' key word before we define object, then assgin the function to methods
*/

// Method 1: set age
myObject.setAge = function() {
  myObject.age = myObject.age + 1;
}
// Method 2: get birth year
myObject.getBirthYear = function(thisYear) {
  return thisYear - myObject.age;
}

// Example: rectangular class and its methods
var rectangle = new Object();  // or we can define the rectangle first, then use 'var rectangle = new rectangle(3, 4);' 
rectangle.height = 3;
rectangle.width = 4;
// here is our method to set the height
rectangle.setHeight = function (newHeight) {
  this.height = newHeight;  // notice the 'this' key word here
};
// help by finishing this method
rectangle.setWidth = function (newWidth) {
  this.width = newWidth;
}
// here change the width to 8 and height to 6 using our new methods
rectangle.setHeight(6);
rectangle.setWidth(8);

// Alternative way: (also we specify the methods in the constructor)
function Rectangle(height, width) {
  this.height = height;
  this.width = width;
  this.calcArea = function() {
      return this.height * this.width;
  };
  // put our perimeter function here!
  this.calcPerimeter = function() {
      return 2 * (this.height + this.width);  
  }
}

var rex = new Rectangle(7,3);
var area = rex.calcArea();
var perimeter = rex.calcPerimeter();

// Example: person class
function Person(name,age) {
  this.name = name;
  this.age = age;
  this.species = "Homo Sapiens";
}
// Definition
var sally = new Person("Sally Bowles", 39);  // Notice: the constructor
var holden = new Person("Holden Caulfield", 16);
console.log("sally's species is " + sally.species + " and she is " + sally.age);
console.log("holden's species is " + holden.species + " and he is " + holden.age);

// Arrays
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
var arr = new Array(); // like array list in java.
/* arr[0] = ;
   arr[1] = ;
   arr[2] = ;
   ...
*/
