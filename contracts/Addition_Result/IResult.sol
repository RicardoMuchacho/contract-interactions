// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.24;

interface IResult {
    function result() external view returns(uint256);
    function setResult(uint256 n) external;
    function changeFee(uint256 n) external;
}