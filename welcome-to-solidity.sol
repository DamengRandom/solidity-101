pragma solidity >= 0.7.0 < 0.9.0;

contract WelcomeToSolidity {
    constructor() public {
    }
    
    function getResult() public view returns(uint) {
        uint a = 1;
        uint b = 2;
        uint c = 5;
        
        uint result = (a + b) * c;
        
        return result;
    }
}

/*
    Comments
    
    - Solidity is a curly-bracket oop language
    - Solidity is inspired by C++, Python and JavaScript
    
    - pragma is used for specifying the complier version for your current .sol file
    (Its like a library version something, different version got different features)
    
*/
