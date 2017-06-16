/*
  Javascript tutorial from codecademy
*/

// Hello Javascript
console.log('hello javascript');

/*
  variables: use 'var' keyword 
    character / string
    numbers
    boolean
*/
var myString = 'bangda';
var myNumber = 23;
var myBool   = true;

console.log('My name is: ' + myString + ', I am ' + myNumber + ' year\'s old now.');
console.log(myBool);

// Control flow
if (myNumber >= 18) {
  console.log(myName + ' is an adult now.');
}
else {
  console.log(myName + ' is not an adult now.')
}

if (myString === 'bangda') { // use === here to denote equal of strings
  console.log('This is bangda.');
}
else if (myString === 'jiahui') {
  console.log('This is jiahui');
}
else {
  console.log('who are you?');
}

switch (myString) {
  case 'bangda':
    console.log('This is bangda.');
    break;
  case 'jiahui':
    console.log('This is jiahui.');
    break;
  default:
    console.log('Who are you?');
    break;
}

/*
  confirm() and prompt() function, as well as practice of prev content
  window object 
  confirm() will display a confirm box, ask users to confirm 
  prompt() will display a prompt box, ask users to do something
*/
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Check if the user is ready to play!
confirm("I am ready to play!"); // give a confirm message to click "OK" on "Cancel"

// Check the age
var age = prompt("What's you age"); // prompt you to input something, and could save as variable

if (age < 13) {
    console.log("you're allowed to play but you take no responsibility\n");    
}
else {
    console.log("let's play!!\n");    
}

// Introduction
console.log("You are at a Justin Bieber concert, and you hear this lyric 'Lace my shoes off, start racing.'\n");

// Interact with Bieber
console.log("Suddenly, Bieber stops and says, 'Who wants to race me?'\n");
var userAnswer = prompt("Do you want to race Bieber on stage?");

// Different scenarios
if (userAnswer === "yes") {
    console.log("You and Bieber start racing. It's neck and neck! You win by a shoelace!\n");
} 
else {
    console.log("Oh no! Bieber shakes his head and singes 'I set a pace, so I can race without pacing.'\n");
}

// Ask for feedback
var feedback = prompt("Message");
if (feedback > 8) {
    console.log("Thank you! We should race at the next concert!");    
} 
else {
    console.log("I'll keep practicing coding and racing.");    
}
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Loop
var sum = 0;
for (var i = 1; i <= 100; i++){
  sum = sum + i;
}

while (i <= 100) {
  sum = sum + i;
  i ++;
}

// Function
function printName(name) {
  console.log(name);
}

function squareofX(x) {
  return x * x;
}

// Array
var arr = ['one', 'two', 'three'];
console.log('first element of arr: ' + arr[0]);
console.log('last element of arr: ' + arr[2]);
console.log('length of arr (array): ' + arr.length);
console.log('length of arr[0] (string): ' + arr[1].length);

// some array method
arr.push('four', 'five');
arr.pop();

// Object-oriented
var people = {
  name : "people",
  age  : "1",
  sex  : "male",
};

people.name   = "Bangda";
prople["age"] = 23;

var bangda = new Object(); // constructor
