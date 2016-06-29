var encoder = require("./caesar.js");


console.log("Et tu, brute?");
console.log(encoder.cypher("Et tu, brute?"));
console.log(encoder.decypher(encoder.cypher("Et tu, brute?")));
