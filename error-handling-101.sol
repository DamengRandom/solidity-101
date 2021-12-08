pragma solidity >= 0.7.0 < 0.9.0;

contract ErrorHandling101 {
    bool public isSo = true;
    bool umberla = false;
    uint value = 0;
    
    function calVal() public {
        require(isSo, 'no cool ..');
        
        value += 1;
        
        assert(value != 3); // also can put within a function !!
    }
    
    function neverEqual() public view {
        assert(value != 3);
    }
    
    function changeIsSo() public {
        isSo = !isSo;
    }
    
    function getVal() public view returns(uint) {
        return value;
    }
    
    function bringUmberla() public {
        if (!isSo) {
           umberla = true; 
        } else {
            revert('No need to bring umberla today ~~');
        }
        
    }
}

// Another error handling example ~~
contract Vendor {
    address seller;
    
    modifier onlySeller() {
        require(msg.sender == seller, 'Only seller can see it ..');
        _;
    }
    
    function becomeSeller() public {
        seller = msg.sender;
    }
    
    function sell(uint amount) payable public onlySeller {
        if(amount > msg.value) {
            revert('balance not enough ..');
        }
    }
}


/*
    Comments:
    
    Error handling ->
    
        assert(bool condition) -> for handling internal errors, function will trigger a invalid opcode (state value will never change if error exists)
        
        require(bool condition) -> for handling errors in inputs or external components (revet back to original state)
        
        revert() -> provide a custom message to abort the code execution (revet back to original state)
*/
