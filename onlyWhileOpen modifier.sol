pragma solidity 0.5.1;

contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    
    uint256 openingTime = 1623582860;
    
    modifier onlyWhileOpen(){
        require(block.timestamp >= openingTime); //함수호출자의정보가 owner와 일치하면 실행
        _;
    }
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyWhileOpen{
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incrementCount() internal {
        peopleCount +=1;
    }
}