pry = require('pryjs');

var Item = function( name, price){
  this.name = name;
  this.price = price;
}

var ShoppingCart = function(){
  this.itemslist = [];
}

ShoppingCart.prototype.addItem = function(item){
  this.itemslist.push(item);
  console.log("Adding " + item.name + " to the cart at a price of " + item.price + " €");
}

ShoppingCart.prototype.total = function(){
  var result = this.itemslist.reduce(function(sum, actualItem){
    return (sum + actualItem.price) }, 0);

  if (this.itemslist.length > 5){
    result = result*0.9;
  }

  var apples = this.itemslist.filter(function(item){
    return item.name == "apple";
  })
  result = result - (parseInt(apples.length / 2) * apples[0].price);

  var oranges = this.itemslist.filter(function(item){
    return item.name == "orange";
  })

  if (parseInt(oranges.length / 5) > 1){
    result = result - ((((parseInt(oranges.length / 5)) -1) * (2.5*oranges[0].price)))
  }
  return result;
}

ShoppingCart.prototype.remove = function(itemName,amount){

  if (typeof amount == "undefined"){
    amount = this.itemslist.length;
  }
  var j = 0;
  for(var i = 0; i < this.itemslist.length ;i++){
    if (j < amount){
      if (this.itemslist[i].name == itemName){
        this.itemslist.splice(i,1);
        i--;
        j++;
      }
    } else {
      return;
    }
  }
}
var items = [
  new Item( "apple", 10),
  new Item( "orange", 5),
  new Item( "grapes", 15),
  new Item( "banana", 20),
  new Item( "watermelon", 50)
];

var cart = new ShoppingCart();

cart.addItem(items[1]);
cart.addItem(items[0]);
cart.addItem(items[0]);
cart.addItem(items[1]);
cart.addItem(items[0]);
cart.addItem(items[0]);
cart.addItem(items[1]);
cart.addItem(items[1]);
cart.addItem(items[1]);
cart.addItem(items[1]);
cart.addItem(items[1]);
cart.addItem(items[1]);
cart.addItem(items[1]);
cart.addItem(items[1]);
cart.addItem(items[1]);

console.log(cart.itemslist);
cart.remove("orange",4);
console.log(cart.itemslist);
console.log(cart.total());
