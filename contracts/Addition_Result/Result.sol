// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.24;

contract Result {
    uint256 public result = 0;

    function setResult(uint256 n) external {
        result = n;
    }
}