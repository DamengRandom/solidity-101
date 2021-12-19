pragma solidity >=0.7.0 <0.9.0;

contract GatewayTest {
    uint private data;
    uint public info;
    
    constructor() {
        info = 10;
    }
    
    function increment(uint a) private pure returns(uint) {
        return a + 1;
    }
    
    function duplicateData(uint a) public {
        data = a;
    }
    
    function getData() public view returns(uint) {
        return data;
    }
    
    function compute(uint a, uint b) pure internal returns(uint) {
        return a + b;
    }
}


contract GatewayTestChild {
    GatewayTest gt = new GatewayTest();
    
    function readInfo() public view returns(uint) { return gt.info(); }
    // Attention: if we want to use info from another class/contract, we have to add bracket for the variable !!!!!!!!!  
}

contract GatewayTestAnotherChild is GatewayTest { // inherit from GatewayTest
    uint private result;
    GatewayTest private gt;
    
    constructor() {
        gt = new GatewayTest();
    }
    
    function callCompute() public {
        result = compute(23, 5); // directly call because `GatewayTestAnotherChild is GatewayTest` [inheritance !!!!]
        // as you can see, compute can be visble when we call contract GatewayTestAnotherChild, which proves that internal function can be accessible form parent contract / class !!!
        
    }
    
    function getCommputeResult() public view returns(uint) {
        return result;
    }
    
    function getNewInfo() public view returns(uint) {
        return gt.info();
    }
}

// inheritance: to extend the functionality of a contract !! (git more functions can be used from another contract/class)

contract inheritanceParent {
    uint private value = 10;
    
    function readValue() public view returns(uint) {
        return value;
    }
}


contract inheritanceChild is inheritanceParent {
    function getValue() public view returns(uint) {
        return readValue();
    }
    
    function compute(uint anotherValue) public view returns(uint) {
        return readValue() + anotherValue;
    }
}