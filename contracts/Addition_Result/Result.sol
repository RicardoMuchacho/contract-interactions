// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.24;

contract Result {
    uint256 public result = 0;
    address public admin;
    uint256 public fee = 5;

    constructor(address _admin){
        admin = _admin;
    }

    modifier onlyAdmin() {
         require(tx.origin == admin, "msg.sender is not admin"); // is like an if + revert() 
    //   if (tx.origin != admin) revert();
      _;
    }

    function setResult(uint256 n) external {
        result = n;
    }

    function changeFee(uint256 n) public onlyAdmin {
       fee = n;
    }
}