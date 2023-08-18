// SPDX-License-Identifier: MIT 
pragma solidity >= 0.7.0 < 0.9.0; // ^0.8.17 : 0.8.17 이상

/* 
 * public, private, internal, external
 *
 * view : function 밖의 변수 Read만 가능
 * pure : function 밖의 변수 Read, Write 모두 불가능
 */


contract Lec02 {
    string public name;
    uint public age;

    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
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

    function getAge() public view returns(uint) {
        return age;
    }   
}


contract Lec02a{

    Lec02 l02 = new Lec02("acucumy", 30);
    
    function setUserInfo(string memory _name, uint _age) public {
        l02.setName(_name);
        l02.setAge(_age);
    } 
    function getUserInfo() public view returns(string memory, uint){
        return (l02.name(),l02.age());
    } 
    
}
