var read = require('read');
var fs = require('fs');
var colors = require('colors');

//Read the external file and create an array with the questions and answers
///////////////////////////////////////////////////////////////////////////
var text = fs.readFileSync("quiz.txt", "utf8");
var text1 = text.split("\n");
var quiz=[];

text1.forEach(function(value){
  quiz.push(value.split("$"));
})

quiz.splice((quiz.length - 1), 1);
///////////////////////////////////////////////////////////////////////////////

//helper functions
////////////////////////////////////////////////////////////////////////////
function getRandom(min, max) {
  return Math.floor(Math.random() * (max - min) + min);
}
console.reset = function () {
  return process.stdout.write('\033c');
}
///////////////////////////////////////////////////////////////////////

//define questions and users class and create questions and users arrays
/////////////////////////////////////////////////////////////////////////
var Question = function(text,answer){
  Question.counter++;
  this.text = text;
  this.answer = answer;
  this.id = Question.counter;
  this.bonus = false;
}
Question.counter = 0;
questions = [];
quiz.forEach(function(value){
  questions.push(new Question(value[0],value[1]));
})
questions[getRandom(0,questions.length-1)].bonus = true;

var User = function(name){
  this.name = name;
  this.points = 0;
  this.questionId = 0;
}
var activeUser;
var questionNumber = 0;
var users = JSON.parse(fs.readFileSync('my.json', 'utf8'));
/////////////////////////////////////////////////////////////////////////

//start the Game

//show ranking users
//////////////////////////////////////////////////////
function showLead(){
  var sortedUsers = users.sort(function(a,b){
    return b.points > a.points;
  })
  console.reset();
  console.log("Here the ranking of Users\n")
  sortedUsers.forEach(function(value){
  console.log(value.name + "............" + value.points + " points");
  })
  setTimeout(startUser,5000);
}
//////////////////////////////////////////////////////
//show main menu and login and create user
/////////////////////////////////////////////////
function startUser(){
  console.reset();
  var welcome = {prompt: "Welcome to the quiz!\n(1) New user\n(2) Login\n(3) Exit>".bold};
  read(welcome,checkStart);
}

function newUser(){
  var newUser = {prompt: "Write your name...\n>"};
  read(newUser,createUser);
}

function loginUser(){
  var loginUser = {prompt: "Write your username...\n>"};
  read(loginUser,checkUserLogin);
}

function checkStart(err,ans){
  if (ans == 1){
    newUser();
  } else if (ans == 2){
    loginUser();
  } else if (ans == 3){
    return console.log("Bye bye!");
  } else {
    console.log("Just write an answer".red);
    startUser();
  }
}

function createUser(err,name){
  theUser = new User(name);
  users.push(theUser);
  activeUser = theUser;
  questionNumber = 0;
  console.log("\nLet's start with the quiz...\n".inverse);
  setTimeout(Game,1000);
}

function checkUserLogin(err,name){
  var existingUser = users.filter(function(a){
    return a.name == name;
  })
  if (existingUser[0] != undefined){
    activeUser = existingUser[0];
    questionNumber = activeUser.questionId;
    console.log("\nLet's continue with the quiz...\n".inverse);
    setTimeout(Game,1000);
  } else {
    console.log("Inexistent login!".red);
    setTimeout(startUser,1000);
  }
}

///////////////////////////////////////////////////////////////////////////
//start the questions
///////////////////////////////////////////////////////////

function Game(){
  console.reset();
  if (questionNumber == questions.length){
    return console.log("You have finished the quiz!\n Here your score: " + activeUser.name + ": " + activeUser.points + " points.");
  }
  var question = questions[questionNumber];
  activeUser.questionId = question.id - 1;
  var options = {prompt: question.text + "\n>"};
  read(options, theAnswer);
  function theAnswer (err, answer){
    if (answer == 'exit'){
      return startUser();
    } else if (answer == 'save'){
      return saveUsers();
    }
    else {
      if (checkAnswer(question.answer,answer)){
        if (question.bonus === true) {
          activeUser.points += 20;
          console.log((("\nBONUS QUESTION!x2 Points. You have " + activeUser.points + " points!\n").rainbow).bold);
          questionNumber++;
        } else {
          activeUser.points += 10;
          console.log(("\nFine! You have " + activeUser.points + " points!\n").underline.green);
          questionNumber++;
        }
      } else {
        activeUser.points -= 5;
        console.log(("\nIncorrect! You have " + activeUser.points + " points!\n").underline.red);
      }
    }
    setTimeout(Game,1500);
  }
}

function checkAnswer(userAnswer,realAnswer){
  if (userAnswer.toUpperCase() == realAnswer.toUpperCase()){
    return true;
  } else {
    return false;
  }
}
////////////////////////////////////////////////////////////////

//save user progress
/////////////////////////////////////////////////////////////////
function saveUsers() {
  var mydata = [];
  users.forEach(function(value){
    mydata.push(value);
  })

  fs.writeFile("my.json", JSON.stringify(mydata, null, 4), function(err) {
    if(err) {
      console.log(err);
    } else {
     console.log("User saved!");
     setTimeout(startUser,1000);
    }
  });
}
////////////////////////////////////////////////////////////


//run the game!!!
showLead();
