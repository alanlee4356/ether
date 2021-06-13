pragma solidity 0.5.1;

contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    
    address owner;
    
    modifier onlyOwner(){
        require(msg.sender == owner); //함수호출자의정보가 owner와 일치하면 실행
        _;
    }
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyOwner{
        peopleCount +=1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
}