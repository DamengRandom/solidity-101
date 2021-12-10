pragma solidity >=0.7.0 < 0.9.0;

contract Coin {
    address public minter;
    mapping(address => uint) public balances;
    
    event Sent(address from, address to, uint amount);
    
    // constructor function only runs when contract gets deployed
    constructor() public {
        minter = msg.sender;
    }
    
    // make new coins and send them to an address
    // only the owner can send these coins
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);

        balances[receiver] += amount;
    }
    
    error insufficiencyBalance (uint requested, uint available);
    
    // send amount of coins to an existing address
    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender])
            revert insufficiencyBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        
        emit Sent(msg.sender, receiver, amount);
    }
}
