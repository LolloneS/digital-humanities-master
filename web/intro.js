#!/usr/bin/node

// This is a one-line comment

/*
    This 
    is
    a
    multiline
    comment.
    This text doesn't get interpreted when we run the code!
*/


/*
Basic notions:
- interpreted language
- weak typing
- some "features" (more like problems)
- you have a JS console in your browser!
- Node.js REPL
[- DOM elements manipulation]
*/



// Let's create my first variable
var myFirstVariable = "Good morning everybody!";
console.log(myFirstVariable);


// Variables, new standard 
let anotherVariable = "The `let` keyword is used instead of `var` for non-constant variables. Anyway, you can use `var` with no problems :)";
console.log(anotherVariable);
const constantVariable = 'Constant variables have fixed values: for example, pi=3.14';
console.log(constantVariable);
console.log("Constant variables are usually defined using capital letters")
const PI = 3.14;
const AUTHOR = "Lorenzo Soligo"
const MASTER = "Digital Humanities"
AUTHOR = "Errore!"

// Strings and escaping
console.log('Strings can also be defined using \' instead of "');
console.log('Beware of escaping symbols!')


// Numbers
console.log("JavaScript can be used as a calculator!");
console.log("The plus (+) operator doesn't only sum numbers, it also concatenates strings!")
console.log("Sum: " + (2+2));
console.log("Division:" + 3/6);
console.log("Power: " + 2**6);
var x = 0.1 + 0.2;
console.log('\nCuriosity');
console.log("Javascript and floating point don't love each other...\n" + "Thus 0.1 + 0.2 is " + x);
console.log("Rest of the division (modulus) %: " + 5%2);

// Functions. Quick overview
console.log('Making floating point numbers shorter: use toFixed() ' + x.toFixed(2));
console.log('toFixed() is a *function*: notice the round brackets!');
console.log('(yes, whenever we use console.log we are using a function :) )');


// Valori logici ecc
console.log('true e false tell us whether an expression evaluates to true or false');
console.log('We can compare numbers with ==, ===, !=, !==, <, >, >=, <=');
console.log(2 == 2);
console.log(3 < 1.3);
console.log("The exclamation mark ! \"reverses\" the current boolean value: true becomes false and vice-versa");
console.log(!(2<3));
console.log("JavaScript has some strange behaviors when type coercion is required...")
console.log(13 + !0); 
console.log("13" + !0);
console.log(10 % 2 == 0 && 10 < 40);
console.log(10 % 3 == 0 || 10 < 40);
console.log(10 % 3 == 0 || !(10 < 40));




// == and ===
console.log('== and != do type coercion; === and !== don\'t')
console.log(2 == '2');
console.log(2 === '2');
console.log('Strings can be compared (lexicographical order)');
console.log('ab' < 'bc');


// Access portions of strings
let myString = "A string";
console.log(myString.charAt(0)); // remember that the first character is the one in position 0!
console.log("A string's indices go from 0 to the length of the string, minus 1")
myString[0] = "B"; // doesn't work!
console.log(myString);
console.log("To modify a string, use the `substr` function to get the parts you need");
console.log("Every string has a `length` property")
let myOtherString = 'B' + myString.substr(1, myString.length);
console.log(myOtherString);
let myOtherString2 = 'B' + myString.substring(1)
console.log(myOtherString2);


// Other operators on numbers
var k = 10;
k++; // k = k+1
console.log(k) // 11
k -= 4; // k = k-4 = 7
k--; // k = k-1 = 6
console.log(k);


// Arrays
let emptyArray = []
emptyArray[0] = "An element";
console.log(emptyArray); // not so empty anymore
let myArray = ["The meaning of life", 42, true];
console.log(myArray[0]);
console.log(myArray[1]);
myArray.unshift("Here's a secret");
myArray.push("Last element of the array");
console.log(myArray)
console.log(myArray.length); // increased by 1
console.log(myArray.slice(1, 3)); // the element in pos. 3 is excluded
console.log("How to print without seeing square brackets?")
for (let i of myArray) {
    console.log(i);
}
console.log("The `for` loop is very simple and powerful!")
let s = 0;
for (let i = 0; i < 10; i++) {
    console.log(i);
    s += i;
}
console.log("Sum: " + s)
console.log("What happens if we use `in` instead of `of`?")
for (let i in myArray) {
    console.log(i);
}


// Objects

/*
Very useful
JSON notation (something like XML but cleaner in syntax)
key-value couples
*/

let lorenzo = {
    'name' : 'lorenzo',
    'surname' : 'soligo',
    'age' : 22,
    'music' : ['lady gaga', 'erik satie', 'ludovico einaudi', 'pink floyd']
}
for (let i in lorenzo) {
    // i is the key
    // lorenzo[i] is the value
    console.log(i + ': ' + lorenzo[i])
}
for (let i of lorenzo['music']) {
    console.log(i)
}
lorenzo['dogs'] = ['miele']
console.log(lorenzo)
// console.log(i) ---> error because of scoping!


// Conditionals
var number = 10;
if (number % 2 == 0) {
    console.log("The number " + number + " is even");
    if (number % 5 == 0) {
        console.log("The number " + number + " is also divisible by 5, therefore it is a multiple of 10")
    }
} else {
    console.log("The number " + number + " is odd")
}

let newArray = [1, 6, 5];
for (let i in newArray) {
    if (newArray[i] % 2 == 1) {
        newArray[i] = 2 * newArray[i]; // newArray[i] *= 2
    }
}
console.log(newArray)


// The while loop
var n = 0;
var l = [];
while (n < 15) {
    l.push(n);
    n++;
}
console.log(l)


// Functions
function double(x) {
    return x * 2;
}

console.log(double(19));

function say_hi(name) {
    console.log("Hi, " + name + "!");
}
say_hi("Danilo");

function is_prime(x) {
    if (x == 1)
        return false;
    if (x == 2 || x == 3) {
        return true;
    }
    if (x % 2 == 0) 
        return false;
    for (let i = 5; i < x; i = i+2) {
        if (x % i == 0) 
            return false;
    }
    return true; // survived the for loop!
}

console.log(is_prime(10))
console.log(is_prime(25))
console.log(is_prime(29))





/*
=== EXERCISE #1 ===
Write a function that tells us whether a number is even or odd
Example: is_even(4) --> true
         is_even(5) --> false

*/



function is_even(x) {
    // return x % 2 == 0;
    if (x % 2 == 0) {
        return true;
    } else {
        return false;
    }
}


/*
=== EXERCISE #2 ===
Function that returns (or prints) the divisors of a number `x`
*/







function get_divisors(x) {
    let divisors = []
    for (let i = 1; i <= x; i++) {
        if (x % i == 0) {
            divisors.push(i)
        }
    }
    return divisors;
}

console.log(get_divisors(100)) 






