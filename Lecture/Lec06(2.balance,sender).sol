// SPDX-License-Identifier: MIT 
pragma solidity >= 0.7.0 < 0.9.0; // ^0.8.17 : 0.8.17 이상

/* 
 * balance는 해당 특정 주소의 현재 이더의 잔액
 * msg.sender 는 스마트컨트랙과 상호 작용하는 주체
 */

contract MobileBanking{
    
 
    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to,uint256 _value);
   
    function sendEther(address payable _to) public payable {
        require(msg.sender.balance>=msg.value, "Your balance is not enough");
        _to.transfer(msg.value);    
        emit SendInfo(msg.sender,(msg.sender).balance);
    }
    
    function checkValueNow() public{
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }
    
    function checkUserMoney(address _to) public{
        emit CurrentValueOfSomeone(msg.sender,_to ,_to.balance);
    }
    
}

