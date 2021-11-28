pragma solidity >= 0.7.0 < 0.9.0;

contract Counter {
    uint public count;
    
    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}

contract MyCounter {
    function incrementCounter(address _addr) external {
        ICounter(_addr).increment();
    }
    
    function readCounter(address _addr) external view returns(uint) {
        return ICounter(_addr).count();
    }
}

/*
    Comments:
    Interface:  cannot have any function with implementations
                cannot have constructor
                cannot have state variable
                function inside interface can only be external
                can have structs and enum
                
    So far my understanding about the interface: is more like a delegation class and define the variable and function in "external" type
    
    the power of the interface is Counter and MyCounter value are synchronous, when you trigger increment from Counter contract, the MyCounter the count value also increased, vice versa !!!! 
*/
