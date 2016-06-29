var pry = require("pryjs");
var sentence = "Et tu, brute?";

function encryption(shift) {
  if (shift == undefined) {
    shift = -3;
  }

  return function(sentence) {
    var result = "";
    var splitSentence = sentence.split('');

    splitSentence.forEach(function (letter) {
      var changedLetter = String.fromCharCode(letter.charCodeAt(0) + shift);

      if (letter.toUpperCase() >= "A" && letter.toUpperCase() <= "Z") {
        if (letter == letter.toUpperCase()) {
          if (changedLetter > "Z"){
            changedLetter = String.fromCharCode(changedLetter.charCodeAt(0) - 26);
          } else if (changedLetter < "A"){
            changedLetter = String.fromCharCode(changedLetter.charCodeAt(0) + 26);
          }
          result += changedLetter;
        } else if (letter == letter.toLowerCase()){
          if (changedLetter > "z"){
            changedLetter = String.fromCharCode(changedLetter.charCodeAt(0) - 26);
          } else if (changedLetter < "a"){
            changedLetter = String.fromCharCode(changedLetter.charCodeAt(0) + 26);
          }
          result += changedLetter;
        }
      } else {
        result += letter;
      }
    })
    return result;
  }
}


cypher = encryption(6);
decypher = encryption(-6);

exports.cypher = cypher;
exports.decypher = decypher;
