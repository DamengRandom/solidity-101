pragma solidity >=0.7.0 < 0.9.0;

contract StructsStudy {
    struct Movie {
        string title;
        string director;
        uint moveId;
    }
    
    Movie movie;
    
    function setMovie() public {
        movie = Movie('Transformers', 'Michael Bay', 1);
    }
    
    function readMovie () public view returns (Movie memory) {
        return movie;
    }
}

/*
    Comments:

    Struct are types which represents a record, its like a typescript type `any`.
    We basically define some types for presenting the record type
    
    As you can see from the result of readMovie() function, the struct is actually a tuple !!!!!!
*/
