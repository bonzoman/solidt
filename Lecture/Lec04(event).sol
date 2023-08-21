// SPDX-License-Identifier: MIT 
pragma solidity >= 0.7.0 < 0.9.0; // ^0.8.17 : 0.8.17 이상

/* 
 * 이벤트 
 *
 */


contract User {
    event info(string name, uint money);

    function sendMoney() public {
        emit info("aaa", 200);
    }

}

