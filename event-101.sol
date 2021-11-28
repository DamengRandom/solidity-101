pragma solidity >= 0.7.0 < 0.9.0;

contract Event101 {
    // Example of an event:
    
    // event name must be CamelCase or camelCase !!
    // indexed must be less or equal to 3 !!
    event NewTrade(
        uint indexed date,
        address from,
        address indexed to,
        uint indexed amount
    );
    
    function emitEvent(address _to, uint _amount) public {
        emit NewTrade(block.timestamp, msg.sender, _to, _amount);
    }
}
