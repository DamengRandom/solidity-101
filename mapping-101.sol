pragma solidity >= 0.7.0 < 0.9.0;

contract MappingStudy {
    // Basic Mapping example !!!!
    // mapping(address => uint) public myFirstMap;
    
    // function getAddress(address _addr) public view returns (uint) {
    //     return myFirstMap[_addr];
    // }
    
    // function setAddress(address _addr, uint _i) public {
    //     myFirstMap[_addr] = _i;
    // }
    
    // function removeAddress(address _addr) public {
    //     delete myFirstMap[_addr];
    // }
    
    // struct & mapping example !!
    
    // struct Movie {
    //     string name;
    //     string director;
    // }
    
    // mapping(uint => Movie) public movie;
    
    // function addMovie(uint id, string memory name, string memory director) public {
    //     movie[id] = Movie(name, director);
    // }
    
    // function readAddedMovie(uint id) public view returns(Movie memory) {
    //     return movie[id];
    // }
    
    
    //  Nested Mapping example !!!!!!
    struct Person {
        string name;
        string role;
    }
    
    mapping(address => mapping(uint => Person)) public person;
    
    function addPerson(uint id, string memory name, string memory role) public {
        person[msg.sender][id] = Person(name, role);
        // msg.sender: is a global variable which represents the transaction address !!!
        // we can get the address from bottom running logs !!👇
    }
    
    function readAddedMovie( uint id) public view returns(Person memory) {
        return person[msg.sender][id];
    }
}

/*
      Comments:
      
      Mapping is quite similar concept in JS, which represents the object, which contains key and value
      
      Eg: mapping(keyName => AnyValue) public variableName;
      
      * In Solidity, if we directly set a key and didn't give a value, the default return will be 0 !!
      Best example is we directly assign an address to getAddress(), and then click function, you will see the value for this address is 0 !!!!!
      * In JavaScript, if .map(value index not found) // will return undefined !!
      
      This could be the big difference !!
      
      Normally address is something like this: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 !!!
      
      // Nested Mapping
      mapping(key => mapping(key2 => value))
      
      // examples of global variables:
      
      * msg.sender: refers to address
      * msg.value: refers to number of wei sent with the message
      * block.timestamp: current block timestamp as seconds
      
      // find more from here: https://docs.soliditylang.org/en/v0.8.7/units-and-global-variables.html
*/
