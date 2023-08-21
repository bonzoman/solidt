// SPDX-License-Identifier: MIT 
pragma solidity >= 0.7.0 < 0.9.0; // ^0.8.17 : 0.8.17 이상

/* 
 * 상속, override
 *
 */


contract User {
    string public name;
    uint public age;

    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
    }

    function getFamilyName() public pure returns(string memory) { // pure : function 밖의 변수 Read, Write 모두 불가능..
        return "Oh";
    }

    function setName(string memory _name) public {
        name = _name;
    }     

    function getName() public view returns(string memory) {
        return name;
    }   


    function setAge(uint _age) public {
        age = _age;
    } 

    function getAge() public virtual view returns(uint) { //virtual : override 가능하게
        return age;
    }   
}


//contract Son is User("sizzoong", 15) { //상속 방법 1
contract Son is User { //상속 방법 2

    constructor() User("sizzoong", 15) { //상속 방법 2 (추가 로직 구현 가능)
        // 어쩌고 저쩌고
    }
    
    function getUserInfo() public view returns(string memory, string memory, uint){
        return (this.getFamilyName(), this.name(), this.age()); // Lec03을 상속받아서 familyName, name, age 접근
    } 

    function getAge() public view override returns(uint) { //User의 getAge 함수를 override 함
        return age + 100;
    }   
    
}
