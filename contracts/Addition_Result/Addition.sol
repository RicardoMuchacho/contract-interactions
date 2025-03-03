// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.24;

import "./IResult.sol";

contract Additioner {
    address private resultContract;
    address public admin;
    uint256 public fee = 5;
    constructor(address _resultContract){
       resultContract = _resultContract;
       admin = msg.sender;
    }
    modifier onlyAdmin() {
      if (msg.sender != admin) revert();
      _;
    }
    function add(uint256 n) public  {
       IResult resultObj = IResult(resultContract);
       uint256 addition = resultObj.result() + n;
       resultObj.setResult(addition);
    }
    function changeFee(uint256 n) public onlyAdmin {
       fee = n;
    }
}