// SPDX-License-Identifier: MIT 
pragma solidity >= 0.7.0 < 0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
//import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/ERC20.sol";


contract myToken is ERC20 {

    constructor(string memory _name, string memory _symbol, uint _totalSupply) ERC20(_name, _symbol) {
        _mint(msg.sender, _totalSupply * 10**18);
    }
}

// 1000 000000000000000000

//A. 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//balance : 990 000000000000000000

//B. 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
//balance : 10 000000000000000000

//C. 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db

/* 
transfer 함수
    보내는 주체 : A,  A(msg.sender) -> B(_to) 에게 10(_value) 전송
transferFrom 함수
    보내는 주체 : C,  A(_from)      -> B(_to) 에게 10(_value) 전송
approve 함수    
    C가 A의 코인을 전송하기때문에 A는 C에게 보낼 수 있는 권한을 주어야 한다.
allowance 함수
    A(_owner)는 C(_spender)에게 보낼 수 있는 권한을 조회
*/