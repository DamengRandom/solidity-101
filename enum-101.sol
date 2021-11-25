pragma solidity >=0.7.0 < 0.9.0;

contract EnumDemo {
    enum defaultSizeEnums { SMALL, MEIDUM, LARGE }
    defaultSizeEnums sizeChoice;
    
    defaultSizeEnums constant defaultSizeChoice = defaultSizeEnums.MEIDUM;
    
    function SetSizeChoice() public {
        sizeChoice = defaultSizeEnums.LARGE; // now the sizeChoice is large
    }
    
    function getSizeChoice() public view returns(defaultSizeEnums) {
        return sizeChoice;
    }
    
    function getDefaultSizeChoiceValue() public view returns(string memory) {
        if (uint(defaultSizeChoice) == 0) return 'SMALL';
        if (uint(defaultSizeChoice) == 1) return 'MEIDUM';
        if (uint(defaultSizeChoice) == 2) return 'LARGE';
    }
    
    function getSizeChoiceValue() public view returns(string memory) {
        if (uint(sizeChoice) == 0) return 'SMALL';
        if (uint(sizeChoice) == 1) return 'MEIDUM';
        if (uint(sizeChoice) == 2) return 'LARGE';
    }
    
    function getDefaultSizeChoice() public view returns(defaultSizeEnums) {
        return defaultSizeChoice;
    }
}

/*
    Comments:

    enum: a pre-defined collection of data, it will be represented by NUMBER format, above functions result will explain
    
    see above example see how it reversely reprsent each string value ..
*/
