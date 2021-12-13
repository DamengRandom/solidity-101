pragma solidity >= 0.7.0 < 0.9.0;

contract LedgerBalance {
    mapping(address => uint) public balance;
    
    function updateBalance(uint newBalance) public {
        balance[msg.sender] = newBalance;
    }
    
    function readBalance(address _addr) public view returns(uint) {
        return balance[_addr];
    }
}

contract LedgerUpdates {
    LedgerBalance ledgerBalance = new LedgerBalance(); // again proves that contract is class, we can instaniate a new instance !!! 

    function updateBalance() public {
        ledgerBalance.updateBalance(30);
    }
    
    function readBalance() public view returns(uint) {
        // return ledgerBalance.readBalance(_addr);
        return ledgerBalance.readBalance(msg.sender); // ?? not working
    }
}
