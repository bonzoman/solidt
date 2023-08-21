// SPDX-License-Identifier: MIT 
pragma solidity >= 0.7.0 < 0.9.0; // ^0.8.17 : 0.8.17 이상

/* 
 * 배열(array)
 *
 */

contract Array {

    // string [] public nameArray;
    // string [] public nameArray = new string[](3); //3개짜리 빈 배열 생성
     string [] public nameArray = ['a', 'b', 'c']; //3개짜리 배열 생성

    function nameArrayLength() public view returns(uint){
        return nameArray.length;
    }

    function addName(string memory _name) public {
        nameArray.push(_name); // push 마지막에 추가
    } 

    function removeName() public {
        nameArray.pop(); // pop 마지막꺼 삭제
    } 

    function deleteName(uint _index) public {
        delete nameArray[_index]; // _index 번째 삭제(초기화)(length 변하지 않음)
    } 

    function replaceName(uint _index, string memory _name) public {
        nameArray[_index] = _name; // _index 번째 값 replace(length 변하지 않음)
    } 

    function getName(uint _index) public view returns(string memory) {
        return nameArray[_index];
    }

    function test() view public {
        assert(nameArray.length == 3);
    }

    function stringcompare(string calldata _data) view public returns(string memory) {
        if(keccak256(bytes(nameArray[0])) == keccak256(bytes(_data))) {
            return "same";
        } else {
            return "diff";
        }
    }
}
