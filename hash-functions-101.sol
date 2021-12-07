pragma solidity >= 0.7.0 < 0.9.0;

contract Oracle {
    address admin;
    uint public rand;
    
    constructor() public {
        admin = msg.sender;
    }
    
    
    function getInteger(uint value) public {
        require(msg.sender == admin);
        rand = value;
    }
}

contract RandomNumberGernator {
    Oracle oracle;
    
    constructor(address oracleAddress) public {
        oracle = Oracle(oracleAddress);
    }
    
    function randMod(uint range) external view returns(uint) {
        return uint(keccak256(abi.encodePacked(oracle.rand(), block.timestamp, block.difficulty, msg.sender))) % range;
        // keccak256: is a leading hash function
        // encodePacked: used for concatenate the arguments together !!
    }
}

/*
    Comments: Cryptographic Hash Function (CHF): is an algorithm that takes an arbitrary amount of data input—a credential—and produces a fixed-size output of enciphered text called a hash value

    Example:
    
    if we type input as: damon
    we will get output as: 1f9489f5feb46a3d6d1c18e398b084102c612654d9829a30b287919f7606b140 (By using SHA-256)
    
    give plain text and get cipher text by hash algorithms ~~
*/
