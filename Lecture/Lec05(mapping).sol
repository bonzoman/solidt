// SPDX-License-Identifier: MIT 
pragma solidity >= 0.7.0 < 0.9.0; // ^0.8.17 : 0.8.17 이상

/* 
 * 매핑(mapping) (key, value 형태, length 없음)
 *
 */

contract Map {

    //       key     value
    mapping (uint => string) private nameList;

    function setNameList(uint _index, string memory _name) public {
        nameList[_index] = _name;
    } 

    function getNameList(uint _index) public view returns(string memory) {
        return nameList[_index];
    }   

}
