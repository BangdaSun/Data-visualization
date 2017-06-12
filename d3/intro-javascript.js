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
