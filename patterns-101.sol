pragma solidity >=0.7.0 < 0.9.0;

// contract Patterns {
//     modifier onlyOwner {
//         require(true);
//         _;
//     }
    
//     function showNumber(uint value) public returns(uint) {
//         return value;
//     }

//     function LoopExample() public onlyOwner returns(bool success) {
//         for (uint index = 0; index < funders.length; index++) {
//             funders[index].transfer(contributeAmount);
//         }
//         return true;
//     }
// }

// fallback () public { // the function which handle the errors !! That's why we need fallback, gort some back up plan !!
//     // adding the erro handler code here to handle errors
// }


contract Patterns {
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;
    
    function claimRefund() public {
        require(balance[msg.sender] > 0);
        msg.sender.transfer(balance[msg.sender]);
    }
    
    function withdrawalRefund(uint amount) public returns (bool success) {
        require(balance[msg.sender] > amount); // check if balance whether is larger than tranfer amount or not
        balance[msg.sender] -= amount; // current balance
        msg.sender.transfer(amount);
        return true;
    }
    
    // some modifier examples
    modifier onlyBy (address _addr) {
        require(msg.sender != _addr, 'Sender was not recognised ..');
        _;
    }
    
    function changeOwnerByAddress(address _address) onlyBy(owner) public {
      owner = _address;   
    }
}

/*
    Comemnts:
    
    The core reason why we need patterns fopr smart contract is for protecting the contract.
    Sometimes, if we don't use pattern to write conract, our contracts are easily get attacked ..
*/
