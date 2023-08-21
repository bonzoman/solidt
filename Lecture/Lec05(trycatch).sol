// SPDX-License-Identifier: MIT 
pragma solidity >= 0.7.0 < 0.9.0; // ^0.8.17 : 0.8.17 이상

/* 
 * try catch
 * 
 * 
 */

contract Math {
    function divide(uint _num1, uint _num2) public pure returns (uint) {
        require(_num1 < 10, "======> Input must be less than 10");
        return _num1 / _num2;
    }
}

contract Runner {
    // event returnValue(uint result);
    event Log(string message);
    event catchError(string _name, string _err);
    event catchPanic(string _name, uint _err);
    event catchLowLevelErr(string _name, bytes _err);

    Math public mathInstance = new Math();

    function run(uint _num1, uint _num2) public returns (uint, bool){

        try mathInstance.divide(_num1, _num2) returns(uint result){
            // emit returnValue(result);
            return(result, true);
        } catch Error(string memory _err) {
            emit catchError("======> revert/require Occured !!!", _err);
            return(0, false);
        } catch Panic(uint _errCode) {
            emit catchPanic("======> assertError/Panic Occured !!!", _errCode);
            return(0, false);
        } catch (bytes memory _errCode) {
            emit catchLowLevelErr("======> LowlevelError Occured !!!", _errCode);
            return(0, false);
        }
    }
    
}

