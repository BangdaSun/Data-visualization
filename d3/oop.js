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

// Anothe example
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

// list(): list info of object
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
