//run truffle version
//Truffle v5.0.0-beta.2
//Solidity v0.5.0 (solc-js)
//Node v8.11.3

pragma solidity ^0.5.0;

contract Election {
<<<<<<< HEAD
    //Model a Patient; must be instantiated to create a Patient
    struct Candidate {
        //unsigned int = uint
        uint id;
        string name;
        uint voteCount;
        bool allergies;
        string bloodType;
        string birthdate;
    }

    //Store a Patient


   // Store accounts that have voted
    mapping(address => bool) public voters;
=======
    //Store patient
    //Read patient
    //public = gives state variable and assigned getter auto
    string public candidate;
>>>>>>> parent of bcf44f3... 1 vote per account works

    //Constructor
    //Runs whenever deployed to blockchain; therefore public
    constructor () public {
<<<<<<< HEAD
        addCandidate("Christy Yau", true, "A", "10-09-1989");
        addCandidate("Kelvin Lee", false, "AB", "04-25-1994");
        addCandidate("Lena Kwan", true, "O", "03-10-2010");
        addCandidate("Peter Ahn", true, "B", "09-27-1990");
    }

    /* Local variables are prepended w/ underscore.
    This is a private function as the public interface
    should not have access to this; only want
    contract to be able to do this */
    function addCandidate(string memory _name, bool _allergies, string memory _bloodType, string memory _smoker) private {
        /*We want candidatesCount to represent id
        of Candidate, so we increment first */
        candidatesCount++;
        //params based on struc above: id, name, voteCount
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0, _allergies, _bloodType, _smoker);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
        emit votedEvent(_candidateId);
=======
        candidate = "Patient 1";
>>>>>>> parent of bcf44f3... 1 vote per account works
    }
}