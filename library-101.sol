pragma solidity >= 0.7.0 < 0.9.0;

library Search {
    function indexOf(uint[] storage self, uint value) public view returns(uint) {
        for (uint index =0; index < self.length; index++) if (self[index] == value) return index;
    }
}

contract TestSearchLibrary {
    uint[] data;

    // constructor() public {
        // for (uint index = 1; index <= 5; index++) data.push(index);
    // }
    
    function setDataArray(uint size) external {
        for (uint index = 1; index <= size; index++) data.push(index);
    }
    
    function isValuePresent(uint _value) external view returns(uint) {
        uint value = _value;
        uint foundIndex = Search.indexOf(data, value); // we can directly use library class !!
        
        return foundIndex;
    }
}

library Search2 {
    function indexOf(uint[] storage self, uint value) public view returns(uint) {
        for (uint index =0; index < self.length; index++) if (self[index] == value) return index;
    }
}

contract TestSearchLibrary2 {
    using Search2 for uint[]; // using library for variable (another element)
    uint[] data;
    
    constructor() public {
        for (uint index = 1; index <= 5; index++) data.push(index); // preset data list inside constructor
    }

    // function setDataArray(uint size) external {
    //     for (uint index = 1; index <= size; index++) data.push(index);
    // }
    
    function isValuePresent() external view returns(uint) {
        uint value = 4;
        uint foundIndex = data.indexOf(value); // 
        
        return foundIndex;
    }
}


/*
    Comments:
    
    Library: cannot be inherited
             cannot have state variables
             cannot inherit any element
             cannot be destroyed as it is assumed as stateless
             
             pure and view functions can ONLY be called from the outside of the library
             
    Solidity code will be compiled down to lower level lanaguage which using EVM (Ethereum Virtual Machine)
    
    We can use Assembly as the low level language to directly manipulate the EVM !! (Eg; dirctly change the memory ..)
    
    When we write assemly code, we can use keyword assembly (eg: assembly {}) under the function
    
    One example: covert data to bytes32 ->
    
    bytes memory data = new bytes(10);

    assembly {
        dataB32 := mload(add(data, 32));
    }
*/
