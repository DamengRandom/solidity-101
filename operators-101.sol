pragma solidity >= 0.7.0 < 0.9.0;

contract OperatorLearn {
    constructor() public {}
    
    uint b = 10;
    
    uint [] public numberList = [1, 2, 3, 4, 5, 6];
    
    string expensiveString = 'String is expensive !!';
    
    function getOperator(string memory operationType) private view returns(string memory) {
        return operationType;
    }
    
    function calculator(string memory operationType, int x, int y) public view returns(int) {
        int a = x;
        int b = y;
        
        if (keccak256(abi.encodePacked(operationType)) == keccak256(abi.encodePacked("+"))) {
            return a + b;
        } else if (keccak256(abi.encodePacked(operationType)) == keccak256(abi.encodePacked("-"))) {
            return a - b;
        } else if (keccak256(abi.encodePacked(operationType)) == keccak256(abi.encodePacked("*"))) {
            return a * b;
        } else if (keccak256(abi.encodePacked(operationType)) == keccak256(abi.encodePacked("/"))) {
            return a / b;
        } else if (keccak256(abi.encodePacked(operationType)) == keccak256(abi.encodePacked("%"))) {
            return a % b;
        } else if (keccak256(abi.encodePacked(operationType)) == keccak256(abi.encodePacked("++"))) {
            return ++a + ++b;
        } else if (keccak256(abi.encodePacked(operationType)) == keccak256(abi.encodePacked("--"))) {
            return --a - --b;
        }
        
    }
    
    function plusPlus(int256 v) public view returns(int256) {
        return v + v++;
    }
    
    function Compare() public view {
        uint a = 100;
        uint b = 90;
        
        require(a < b, 'This is false'); // error will be viewed by console logs
    }
    
    function AssignOperatorExample() public view returns(uint) {
        uint c = 2;
        // return c = b; // c is assigned to equal to b, c = b is typical example of assign operator !!
        // return c = c + b;
        return c *= b;
    }
    
    function isModValueZero(uint x, uint y) public view returns (bool) {
        if (x % y == 0) {
            return true;
        }

        return false;
    }
    
    function firstLoop() public view returns (uint) {
        uint modCounter = 0; 
        
        for (uint index = 0; index < numberList.length; index++) {
            if (numberList[index+1] % numberList[index] == 0) {
                modCounter++;
            }
        }
        
        return modCounter;
    }
    
    function getCharacters() public view returns (uint) { // example of using bytes !!!
        bytes memory bytesTakeOver = bytes(expensiveString);
        return bytesTakeOver.length;
    }
    
    /*
        Comments
        
        Operator Categories in Solidity:
        
        1). Arithmetic Operators -> +, -, %, *, / ..
            Comparison Operators -> ==, != ..
        
        2). Operands: variables -> a + b, both a and b are operands, + is the operator
        
        
        
        Solidity exceptions:
        
        `assert` and `require` are convenience functions that check invariants, conditions, and throw exceptions. 
        
        `revert` triggers exceptions and can have an error string.
        
        
        string !!!
        
        string memory: in Solidity memory is a temporary place where to save the string value/data
        
        In Solidity, string is too expensive for computation purposes, eg: string.length will cause error ...
        
        Thus, we need to use bytes !!
        
        
    */ 
}