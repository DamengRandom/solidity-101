pragma solidity >= 0.7.0 < 0.9.0;

contract Array {
    uint [] public array;
    uint [] public array2;
    uint [200] public fixedArray;
    
    function push(uint number) public {
        array.push(number);
    }
    
    function pop() public {
        array.pop();
    }
    
    function length() public view returns(uint) {
        return array.length;
    }
    
    function readArray() public view returns(uint[] memory) {
        return array;
    }
    
    function remove(uint index) public {
        delete array[index];
        // eg, you have an array is [1, 2], and you set index value to 0. 
        // After run above line, the result will be [0, 2]
    }
    
    function removeElement(uint index) public {
        array[index] = array[array.length - 1];
        array.pop(); // this is a rough way, because it changes the last element location inside array
    }
}

contract RemoveArrayElement { // This is a better way !!
    uint[] arrayNew = [1,2,3,4];
    uint[] emptyArray;
    
    function remove(uint index) public returns(uint[] memory) {
        if (index >= arrayNew.length) return emptyArray;

        for (uint i = index; i<arrayNew.length-1; i++){
            arrayNew[i] = arrayNew[i+1];
        }
        
        arrayNew.pop();
        
        return arrayNew;
    }
    
    function readArray() public view returns(uint[] memory) {
        return arrayNew;
    }
}

/*
    Comments:
    
    Array: a collection of data by sequence, array is a data structure (a form of data) !!
*/
