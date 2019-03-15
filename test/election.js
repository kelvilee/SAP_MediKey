//Simulating client side action
//Truffle comes bundled with 
//Mocha testing framework
//Chai assertion library
// Added line
//var artifacts = require('truffle-artifactor');
//var contract = require("truffle-contract");

var Election = artifact.require("./Election.sol");

contract("Election", function(accounts) {
    //it and contract are what we get from Mocha testing
    //assertions are from Chai
    it("Initialises with two patients", function() {
        return Election.deployed().then(function(instance) {
            return instance.candidatesCount();
        }).then(function(count) {
            assert.equal(count.toNumber(), 2); 
        });
    });

    it("It initialises the candidates with the correct values", function() {
        return Election.deployed().then(function(instance) {
            electionInstance = instance;
            return electionInstance.candidates(1);
        }).then(function(candidate) {
            assert.equal(candidate[0], 1, "Contains correct id");
            assert.equal(candidate[1], "Candidate 1", "Contains correct name");
            assert.equal(candidate[2], 0, "Contains the correct vote count");
            return electionInstance.candidates(2);
        }).then(function(candidate) {
            assert.equal(candidate[0], 2, "Contains correct id");
            assert.equal(candidate[1], "Candidate 2", "Contains correct name");
            assert.equal(candidate[2], 0, "Contains the correct vote count
        })
    });
});

/*var contract = require("truffle-contract");
var contractJson = require("example-truffle-library/build/contracts/SimpleNameRegistry.json");
var SimpleNameRegistry = contract(contractJson);
SimpleNameRegistry
  .deployed()
  .then(function(instance) {
     return instance.setRegistry(address);
   })
  .then(function(result) {
    // If this callback is called, the transaction was successfully processed.
    alert("Transaction successful!")
  })
  .catch(function(e) {
    // There was an error! Handle it.
  });*/