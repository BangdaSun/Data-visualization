/*
  Javascript tutorial from codecademy
  the syntax of javascript is similar to other popular languages like java, python etc
*/

// Hello Javascript
console.log('hello javascript');

/*
  variables: use 'var' keyword 
    character / string
    numbers
    boolean
*/
var myString = 'bangda'; // for string, we can access it's character using [] index directly
                         // toUpperCase(), toLowerCase()
var myNumber = 23;
var myBool   = true;

// Varible type check and conversion
String(myNumber);
myBool.toString();

Number('12345');

console.log('My name is: ' + myString + ', I am ' + myNumber + ' year\'s old now.');
console.log(myBool); 

// Logical operator
// keep in mind that 'equal' is === in js
//  && - and, || - or, ! - not

// Control flow
// if - else - else if
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

// switch
switch (myString) {  // myString need to be declared, e.g.: prompt() function
  case 'bangda':  // case 'option1'
    console.log('This is bangda.');
    break;  // will go to default too if there is no break statement
  case 'jiahui':
    console.log('This is jiahui.');
    break;
  default:
    console.log('Who are you?');
    break;
}

// isNaN() function
isNaN(NaN); // true
isNaN("1"); // true
isNaN(1);   // false

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

// Random numbers
// using Math. library
// uniform distribution unif(0, 1)
var rnd = Math.random();

// Loop
// for
var sum = 0;
for (var i = 1; i <= 100; i++){
  sum = sum + i;
}

// while
while (i <= 100) {
  sum = sum + i;
  i ++;
}

// do-while
do {
    // statement;
} while (true);


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// example: dragon slayer game
var slaying = true;
var youHit = Math.floor(Math.random() * 2);
var damageThisRound = Math.floor(Math.random() * 5 + 1);
var totalDamage = 0;

while (slaying) {
    if (youHit === 1) {
        console.log("congratulations!");
        if (totalDamage >= 4) {
            console.log("you slew the dragon!");
            slaying = false;
        }
        else {
            youHit = Math.floor(Math.random() * 2);    
        }
    } 
    else if (youHit === 0) {
        console.log("dragon defested you");
    }
    totalDamage = totalDamage + damageThisRound;
    
    slaying = false;
}
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Function (defintion not unique)
// python style definition
function printName(name) {
  console.log(name);
}

function squareofX(x) {
  return x * x;
}

// r style definition
var ageDifference = function(person1, person2) {
    return person1.age - person2.age;
};

// Global and local variable
/*
  variables that are defined outside the function is gloabl variable, the scope is global.
  while in the function are called local variable.
  the difference is whether a new variable is defined in some sense.
  for example:
*/
var my_variable = 4;  // now it's global
function myfunc(my_variable) {
  my_variable = 8; // still global
  var my_variable = 6; // it's local variable now
  return my_variable + 1;
}

// Example: game of paper/rock/scissors
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
var userChoice = prompt("Do you choose rock, paper or scissors?");
var computerChoice = Math.random();
if (computerChoice < 0.34) {
	computerChoice = "rock";
} else if(computerChoice <= 0.67) {
	computerChoice = "paper";
} else {
	computerChoice = "scissors";
} console.log("Computer: " + computerChoice);

var compare = function(choice1, choice2) {
    if (choice1 === choice2) {
        return "The result is a tie!";
    }
    else if (choice1 === "rock") {
        if (choice2 === "scissors") {
            return "rock wins";
        }
        else {
            return "paper wins";
        }
    }
    else if (choice1 === "paper") {
        if (choice2 === "rock") {
            return "paper wins";
        } 
        else {
            return "scissors wins";    
        }
    }
    else if (choice1 === "paper") {
        if (choice2 === "rock") {
            return "paper wins";
        }    
        else {
            return "scissors wins";    
        }
    }
}

compare(userChoice, computerChoice);
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Array
// unlike python built-in list, here different data type could be contained in same array
var arr = ['one', 'two', 'three'];
console.log('first element of arr: ' + arr[0]);
console.log('last element of arr: ' + arr[2]);
console.log('length of arr (array): ' + arr.length);
console.log('length of arr[0] (string): ' + arr[1].length);

// 2D array (same for higher dimension)
var newArr = [[1, 4, 2], 
	      [2, 3, 7],
	      [4, 2, 5]];

// some array method
arr.length;
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
