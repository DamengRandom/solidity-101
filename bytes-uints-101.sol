pragma solidity >=0.7.0 < 0.9.0;

contract BitsUnitsConversion {
    uint deafultIs256; // uint means uint256 by default !! range is [0, 2^256-1] // [0, 1.15792089×10^77]
    uint32 exampleOf32; // [0, 2^32-1] // [0, 4294967295]
    uint16 exmapleOf16; // [0, 2^16-1] // [0, 65535]
    uint8 exmapleOf8; // [0, 2^8-1] // [0, 255]
    
    // from bigger to smaller -> decrease 
    
    uint32 a = 0x12345678;
    uint16 b = uint16(a); // 0x5678;
    
    // from smaller to bigger -> increase
    
    uint16 c = 0x1234;
    uint32 d = uint32(c); // 0x00001234; // for uint adding 0s in front
    
    // same rule for bytes !!!!
    
    bytes2 e = 0x1234;
    bytes1 f = bytes1(e); // 0x12;
    
    bytes2 g = 0x1234;
    bytes4 h = bytes4(g); // 0x12340000; // for bytes adding 0s in back
    
    // reason why bytes is adding at the back, think about Octal to Binary,
    // 000 -> 001 // 1
    // 000 -> 010 // 2, so the most front is larger than the most back values, thats why its adding at the back !!
    
    
    // assert(confition) // to check whether true or false !!
    function assertTrial() public {
        assert(1 wei == 1); // must be put inside the function !! 
        assert(1 ether == 1000000000000000000 wei); // 1 ether = 1,000,000,000,000,000,000 (10^18)
        assert(2 ether == 2e18); // 1 ether = 1,000,000,000,000,000,000 (10^18)
    }
    
    function timeConversion() public {
        assert(1 minutes == 60 seconds);
        assert(24 hours == 1440 minutes);
        assert(1 days == 24 hours);
        assert(1 weeks == 7 days);
    }
    /*
        Comments:
        
        Good contract always consider the computation expense, the lower the better !!
    */
}
