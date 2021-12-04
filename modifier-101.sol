pragma solidity >=0.7.0 < 0.9.0;

contract FunctionViewAndPure {
    uint value = 10;
    
    function viewExample(uint _value) public view returns(uint) { // not allow to pass an expression into function
        // value = 4; // Cause ERROR: you can't make value state change, state is read only !!
        // return _value + value;
        return _value;
    }

    function pureExample() public pure returns(uint) { // allow pass param into function
        uint _value = 4;
        return 10 + _value; // cannot use any global variables, such as value defined in line 4
    }

    /*
        Comments:

        function keyword `view`: means not change or update anything inside function, just ensure the state value keeps unchanged and "read only" !! 
        [shorter version: view means read only !!]
        
        In Solidity, we have 2 colors function, orange and blue, orange means editable, we can set some parameters, blue means un-changable, just read only value ~~
        
        function keyword `pure`: means also returns a value, and the value can be defined by developer, like a fixed value. `view` is read only, but pure means you can set a specific fixed/hardcoded value you want the function to return ~~
        [see above example: pureExample]
    */
}

// Function modifier example

contract Owner {
    // function modifier
    
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _; // function "continue" run
    }
    
    modifier costs(uint _price) {
        require(msg.value >= _price);
        _;
    }
}

/*
    Comments:
    
    - function modifier: is used to modify the behaviour of a function !!
    
    - modifier is more like a helper function which reduce the code repeat issue (reduce the gas cost !!), like DRY rule, try to make code functionality re-usable !!
*/

contract Register is Owner {
    mapping(address => bool) registeredAddresses;
    
    uint price;
    
    constructor(uint initialPrice) public {
        price = initialPrice;
    }
    
    function register() public payable costs(price) {
         registeredAddresses[msg.sender] = true;  
    }
    
    function changePrice(uint _price) public onlyOwner {
        price = _price;
    }
}