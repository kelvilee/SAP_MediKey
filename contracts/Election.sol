//run truffle version
//Truffle v5.0.0-beta.2
//Solidity v0.5.0 (solc-js)
//Node v8.11.3

pragma solidity ^0.5.0;

contract Election {
    //Model a Patient; must be instantiated to create a Patient
    struct Candidate {
        //unsigned int = uint
        uint id;
        string name;
        uint voteCount;
    }

    //Store a Patient


   // Store accounts that have voted
    mapping(address => bool) public voters;

    //Fetch Patient
    /*Mapping is like associative array or hash w/ key : value
    Mapping takes the data types expected for each key and pair;
    in this case, we are storing it with the unsigned integer ids
    as keys and the Patient struct as the value
    By declaring it public, we automatically have getter
    Can't iterate or determine size of map; will return default
    value of empty Candidate struct */
    mapping(uint => Candidate) public candidates;

    /* Counter cache keeps track of the number of patients
    so we can fetch every one and know how many there are in
    total. Default value is 0 for uint*/
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    //Runs whenever migrated and deployed to blockchain; therefore public
    constructor () public {
        addCandidate("Patient 1");
        addCandidate("Patient 2");
    }

    /* Local variables are prepended w/ underscore.
    This is a private function as the public interface
    should not have access to this; only want
    contract to be able to do this */
    function addCandidate(string memory _name) private {
        /*We want candidatesCount to represent id
        of Candidate, so we increment first */
        candidatesCount++;
        //params based on struc above: id, name, voteCount
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
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
    }
}