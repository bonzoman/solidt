// SPDX-License-Identifier: MIT 
pragma solidity >= 0.7.0 < 0.9.0;

contract Lec01{
    string public hi = "Hello solidity2";

    bool public b1 = false;

    bytes4 public bt4 = 0x12345678; //byte1~32
    bytes public bt = "String";

    address public addr = 0xE12EA99b2A6603EC19e3138a92d8F0101a588031;


    int8 public i = 126; //int:음수포함
    uint8 public ui = 123; //uint(unsigned int):음수포함X

    uint256 public ether1 = 1 ether;
    uint256 public wei1 = 1 wei;
    uint256 public gwei1 = 1 gwei;
    
    

}