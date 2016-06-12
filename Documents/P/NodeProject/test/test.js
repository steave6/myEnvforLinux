// 'use strict';

var list = [10,20,30,];
console.log(list);


Object.defineProperty(Array.prototype, "printf", {
  value: function () {
    console.log("Check var of this = " + this);
    return this;
  }
})


Object.defineProperty(
  Array.prototype,
  'print',
  {
    value        : function () {
      console.log("getter test this = " + this);
      return this;
    },
    writeable    : false,
    enumerable   : false,
    configurable : true
  }
);

list.printf();


var man = {
  firstName: '',
  lastName: '',
  get fullName() {
    return this.firstName + ' ' + this.lastName;
  },
};
man.firstName = 'Bill';
man.lastName = 'Gates';
console.log(man.fullName);  // Bill Gates

