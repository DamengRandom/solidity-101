pragma solidity >= 0.7.0 < 0.9.0;

// contract X {
//     function y() public view returns (string memory) {
//         return 'hello';
//     } // This is implemented contract function !!
// }


// base contract
abstract contract X {
    function y() public view virtual returns(string memory); // this is an typical abstract function !! - no implementations at all !!!!!
}


// derived contract
contract Z is X {
    function y() public pure override returns(string memory) {
        return 'aloha ~~';
    }    
}

// Another example of creating an abstract contract

abstract contract Integer {
    function calculateIntegers(uint _v1, uint _v2) public view virtual returns(uint);
}

contract CalculateInteger is Integer {
    function calculateIntegers(uint _v1, uint _v2) public pure override returns(uint) {
        return _v1 + _v2;
    }
}

/*
    Comments:
    
        Abstract contract: contains at least one funcion without any implementation !!
        
        base contract: (parent, provider, core, higher level ...)
        dreived contract: (child, inherited from ...)
    */