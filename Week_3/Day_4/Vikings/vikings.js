var fs = require('fs');
var text = fs.readFileSync("names.txt", "utf8");
var names = (text.replace(/\s\s/g,'')).split("\n");
//50 names
function getRandom(min, max) {
  return Math.floor(Math.random() * (max - min) + min);
}

var Viking = function(name) {
  this.name = name;
}

Viking.prototype.health = 100;
Viking.prototype.strength = 20;

var Saxon = function() {
  this.health = getRandom(30,100);
  this.strength = getRandom(10,20);
}

function showViking(viking){
  return (viking.name + " health: " + viking.health);
}

// function vikingBattle(viking1,viking2,min){
//   viking2.health -= viking1.strength;
//   return vikingPit(viking2,viking1,min);
// }
//
// var vikingPit = function(viking1,viking2,min){
//
//   if (viking1.health <= min) {
//     return console.log("Wins: " + showViking(viking2) + "\n" + "Lose: " + showViking(viking1));
//   }else if (viking2.health <= min){
//     return console.log("Wins: " + showViking(viking1) + "\n" + "Lose: " + showViking(viking2));
//   }else{
//     return vikingBattle(viking1,viking2,min);
//   }
// }

// vikingPit(vik1,vik2,20);

function createPeople(numvik,numsax){
  var i=0;
  var vikings=[];
  var saxons=[];
  while (i < numvik){
    vikings.push(new Viking(names[i]));
    i++;
  }
  i=0;
  while (i < numsax){
    saxons.push(new Saxon);
    i++;
  }
  return [vikings,saxons];
}

var vikings = createPeople(20,80)[0];
var saxons = createPeople(20,80)[1];



function showFight(viking,saxon){
  console.log("****************************************************************");
  console.log(viking.name + " attack saxon with " + viking.strength + " of strength");
  console.log("Saxon attack " + viking.name + " with " + saxon.strength);
  if ((viking.health <= 0) && (saxon.health <= 0)){
    console.log(viking.name + " is dead!! and saxon is dead!!");
  } else if (saxon.health <= 0){
    console.log(viking.name + " has " + viking.health + " of health and saxon is dead!!");
  } else if (viking.health <= 0){
    console.log(viking.name + " is dead!! and saxon has " + saxon.health + " of health");
  } else {
    console.log(viking.name + " health: " + viking.health + " || " + "saxon health: " + saxon.health);
  }
}



function battleTurn(vikings,saxons) {
  for(p=0;p<vikings.length;p++){
    var viking = vikings[p];
    var saxon = saxons[(Math.floor(Math.random() * saxons.length))];
    if ((viking.health > 0) && (saxon.health > 0)){
      viking.health -= saxon.strength;
      saxon.health -= viking.strength;
      showFight(viking,saxon);
    } else if (saxon.health <= 0){
      p--;
    }
  }
}

function reCountDead(warriors){
  var result = 0;
  for(f=0;f<warriors.length;f++){
    if (warriors[f].health <= 0){
      result++;
    }
  }
  return result;
}

function showTheResult(vikings,saxons){
  var deadVik = reCountDead(vikings);
  var deadSax = reCountDead(saxons);
  var percenVik = vikings.length / deadVik;
  var percenSax = saxons.length / deadSax;
  if (percenVik > percenSax){
    console.log("Vikings wins! Alive vikings: " + (vikings.length - deadVik) + "/" + vikings.length + " and alive Saxons: " + (saxons.length - deadSax) + "/" + saxons.length);
  } else if (percenSax > percenVik){
    console.log("Saxons wins! Alive saxons: " + (saxons.length - deadSax) + "/" + saxons.length + " and alive Vikings: " + (vikings.length - deadVik) + "/" + vikings.length);
  } else {
    console.log("The result is tie, Alive saxons: " + (saxons.length - deadSax) + "/" + saxons.length + " and alive Vikings: " + (vikings.length - deadVik) + "/" + vikings.length);
  }
}


function turns(num){
  for (j=1;j<=num;j++){
    console.log("\nTURN " + j + " OF " + num + " ****************************************************")
      battleTurn(vikings,saxons);
  }
  showTheResult(vikings,saxons);
}

var randomTurns = getRandom(5,8);
turns(randomTurns);
//
// for(k=0;k<20;k++){
//   console.log(showViking(vikings[k]));
// }
// for(h=0;h<40;h++){
//   console.log(saxons[h].health)
// }
