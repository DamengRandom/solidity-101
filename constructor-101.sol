pragma solidity >= 0.7.0 < 0.9.0;

// contract Member {
//     bytes name;
//     uint age;
    
//     constructor(bytes memory _name, uint _age) public {
//         name = _name;
//         age = _age;
//     }
// }

// contract Teacher is Member ('Damon', 32) { // hardcode assign the value directly (rough one ..)
//     function getName() public view returns(string memory) {
//         return string(name); // we can convert bytes to readable string !!
//     }
// }

contract Member {
    string name;
    uint age;
    
    constructor(string memory _name, uint _age) public {
        name = _name;
        age = _age;
    }
}

contract Teacher is Member
{
    constructor(string memory n, uint a) Member(n = 'unknown', a) public {}
    
    function getName() public view returns(string memory) {
        return name; // we can convert bytes to readable string !!
    }
}


/*
    Comments:
    
    Constructor: used for initialise the contract state !! (Only one per contract (.sol) file)
    
    constrcutor can either be public or internal
    
    internal constrcutor marks as contract as abstract
    
    if no constrcutor defined by default, the default constructor will be present by default
    
    
    so far my understanding of the keyword 'contract' can be treated as 'class' in OOP !!!
*/
