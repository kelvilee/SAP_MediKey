//run truffle version
//Truffle v5.0.0-beta.2
//Solidity v0.5.0 (solc-js)
//Node v8.11.3

pragma solidity ^0.5.0;

contract Election {
    //Store patient
    //Read patient
    //public = gives state variable and assigned getter auto
    string public candidate;

    //Constructor
    //Runs whenever deployed to blockchain; therefore public
    constructor () public {
        candidate = "Patient 1";
    }
}