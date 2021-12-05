pragma solidity >=0.7.0 < 0.9.0;

contract FallbackFunction {
    event Log(uint gas);
    
    fallback () external payable {
        // please keep shor t for your fallback function
        // 2300 gas should allow to emit a log in solidity ..
        emit Log(gasleft()); // returns how much gas left ..
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
        // this refers to the whole contract "FallbackFunction"
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value); // transfer gas value to FallbackFunction to use ..
        // transfer is using 2254 gas unit
    }
    
    function callFallback(address payable _to) public payable {
        // send the ether with the call method:
        (bool sent,) = _to.call{value: msg.value}(''); // call is using 78719114 gas unit
        require(sent, "Failed to sent ..");
    }
}

/*
    Comments: its like a 404 in web, error handler function !!
    
    Define afallback function:
    - CANNOT have a NAME
    - does NOT take any INPUTS
    - does NOT return any OUTPUTS
    - MUST be declared as EXTERNAL
    
    when we transfer ether, we can use `payable` keyword !!
*/