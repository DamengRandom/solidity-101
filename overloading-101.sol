pragma solidity >=0.7.0 <0.9.0;

contract OverloaidngFn {
    function sameVariableType(uint value, uint anotherValue) public {
        // must contain another uint variable, if both function only contain value param, first sameVariableType function will report error ..
    
        value + anotherValue;
    }
    
    function sameVariableType(uint value) public {
        //
        value;
    }
    
    function sameSum(uint firstValue, uint secondValue, uint thirdValue) public pure returns(uint) {
        return firstValue + secondValue + thirdValue;
    }
    
    function sameSum(uint firstValue, uint secondValue) public pure returns(uint) {
        return firstValue + secondValue;
    }
    
    function getSumTwoArgs() public pure returns(uint) {
        return sameSum(1, 1);
    }
    
    function getSumThreeArgs() public pure returns(uint) {
        return sameSum(1, 2, 3);
    }
}

/*
    Comemnts: overloading
    
    overloading: mutliple functions has same function name and scope !!
*/
