// Assignment 20
function Vehicle() {};

Vehicle.prototype.doors = 4;
Vehicle.prototype.wheels = 4;

var sedan = new Vehicle();
var coupe = new Vehicle();

coupe.doors = 2;

console.log(sedan.hasOwnProperty("doors"));
console.log(coupe.hasOwnProperty("doors"));


function Coupe() {
  this.prototype = new Vehicle();
};

function Motorcycle() {};
Motorcycle.prototype = new Vehicle();

Coupe.constructor = Coupe;
Motorcycle.constructor = Motorcycle;

coupe2 = new Coupe();
motorcycle = new Motorcycle();

console.log(coupe2 instanceOf Coupe);
console.log(motorcycle instanceOf Motorcycle);

console.log(coupe2 instanceOf Vehicle);
console.log(coupe2 instanceOf Motorcycle);

function Sedan() {};

Sedan.prototype = Object.create(Vehicle.prototype);

sedan = new Sedan();

console.log(sedan instanceOf Vehicle);

// Exercise 19
var invoices = new Object();
invoices.foo = 130;
invoices.bar = 250;

var payments = {
  foo: 80,
  bar: 55
};

var payments_received = 0;
invoices.foo -= payments.foo;
invoices.bar -= payments.bar;
payments_received = payments.foo + payments.bar

var remaining_due = 0;

for (var invoice in invoices) {
  remaining_due += invoices[invoice];
}

console.log(remaining_due);

var second_invoices = Object.create(invoices);
console.log(second_invoices.foo);

function newInvoices(obj) {
  return {
    foo: !obj || isNAN(obj.foo) ? 130 : obj.foo,
    bar: 250
  };
};