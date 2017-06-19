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
};
