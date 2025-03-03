// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.24;

import "./IResult.sol";

contract Additioner {
    address private resultContract;

    constructor(address _resultContract){
       resultContract = _resultContract;
    }

    function add(uint256 n) public  {
       IResult resultObj = IResult(resultContract);
       uint256 addition = resultObj.result() + n;
       resultObj.setResult(addition);
    }

    function changeFee(uint256 n) public {
       IResult resultObj = IResult(resultContract);
       resultObj.changeFee(n);
    }
}