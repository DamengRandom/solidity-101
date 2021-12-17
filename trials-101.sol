// pragma solidity >= 0.5.0 < 0.63.0;
pragma solidity >= 0.7.0 < 0.9.0;

contract SyntaxStudy {
    constructor() public {
    }
    
    uint public x = 100; // state variable
    bool private privateBool = false;
    string internal internalString = 'internal variable can be seen either within the current contract scope or inherited contract from this contract';
    
    function getSyntaxString() private view returns(string memory) {
        return 'Hi there ..';
        // this function can not be viewed after deployed because we set this function as a 'private' function !!!
    }
    
    // function defineSyntaxString() public returns(string memory) {
    //     string word = 'Hello';
    //     return word;
    // }
    
    function getUintValue() public view returns(uint) {
        uint x = 10; // local variable
        uint y = 20;
        
        return x * y;
    }
    
    function multiply(uint val1, uint val2) public view returns (uint) {
        return val1 * val2;
    }
    
    function calculator(uint val1, uint val2) public view returns (string memory) {
        string memory reuslt1 = "Great";
        string memory reuslt2 = "Okay ..";
        string memory reuslt3 = "Cool!!";

        if (multiply(val1, val2) > 30) {
            return reuslt1;
        } else if(val1 == val2) {
            return reuslt3;
        } else {
            return reuslt2;
        }
    }
    
    function overwriteStateVariable() public returns (uint) {
        // since we have removed keyword "view" from function, so we can re-assign teh state variable now !!
        x = 1000;
        return x;
    }
    
    function showThePrivateValue() private pure returns (uint) {
        uint privateValue = 2000;
        return privateValue; // this value can be viewed by purePublic function !!
    }
    
    function purePublic() public pure returns (uint) {
        // uint pureUint = 30;
        // return pureUint;
        return showThePrivateValue();
    }
    
    function externalFunction() external returns (uint) {
        return 2929; // this function will only be able to be called outside of this contract !!
    }
    
    function readPrivateScopeVariable() public view returns (bool) {
        // return externalFunction(); // cause scope error because externalFunction is only for external contract useage !!
        return privateBool;
    }
    
    function readInternalVariable() public view returns (string memory) {
        return internalString;
    }
}

/*
    Comments:

    - variable: is a memory reference place to save/store some values for your program
    - 3 main types: Boolean, Integer and string
    
    - for the function, we can write private function, which will be only available in current contract scope !!
    
    - function scope: anything write inside function, remains localized inside the function (only function run these code)
    
    - local variable will overite state variable !!
    
    - state variable is for re-use purpose, eg: 2 functions both need to use a variable x, so we define x as state variable then ..
    
    - EVM (Ethereum Virtual Machine): refers to a run time environment for smart contracts in Ethereum !!
    
    - Account types: 
        - external account: public private key pair (From holders)
        - contracts account: (From code level - built by developers)
        
        if we need send ether from one account to another, we are using public key
        
    - nouce: is a number of transactions sent from a given address !!
    
    - wei: its the smallest denomination of a ether [1 ether = 1,000,000,000,000,000,000 wei (10 power of 18)]
    
    - solidity scope keywords: private public internal external
    
    - state vs local variables !!
    
        - eg: uint stateVriable = 10;
        - function() public view returns (uint) { // inside this function we can use stateVriable because we have public view for this function }
        - uint public publicStateVariable = 20; // even better
        
    - 
*/
