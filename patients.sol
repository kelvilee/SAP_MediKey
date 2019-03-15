pragma solidity >=0.4.22 <0.6.0;
contract BasicInformation {
string information;
address owner;
//represents a single person
    struct person {
        string name;
        uint weight;
        uint height;
        bool smoker;
        bool pregnant;
        bool recentSurgery;
        bool allergies;
        bool existingCond;
        bool recentIllness;
        address patient;
    }



//store Person for each user 
mapping(address=> person) public persons;

//this function is not working, help
function addData(string _name, uint _weight, unint _height, bool _smoke, bool _preg, bool _surgery, bool _allergies, bool _cond, bool _illness, address _patient) public{
    persons[_patientData] = person({
        name: _name,
        weight: _weight,
        height: _height,
        smoker: _smoke,
        pregnant: _preg,
        recentSurgery: _surgery,
        allergies: _allergies,
        existingCond: _cond,
        recentIllness: _illness,
        patient: _patient
    });
}
    function getInformation() view public returns (bool smoker){
        require(owner == msg.sender);
        return smoker;
    }
}