// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.24;

contract Caller {

   event CallExecuted(address, uint256, bool);

   function callPayable(address _payableAddress, string calldata _data) public payable {
      bytes memory _calldata = abi.encodeWithSignature(_data);
      (bool success,) = _payableAddress.call{value: msg.value}(_calldata);
      require(success, "Transaction failed");

      emit CallExecuted(_payableAddress, msg.value, success);
   }

   function callPayableGetBalance(address _payableAddress) public returns(uint256 balance) {
      bytes memory _calldata = abi.encodeWithSignature("getBalance()");
      (bool success, bytes memory returnedData) = _payableAddress.call{value: 0}(_calldata);
      require(success, "Transaction failed");
      balance = abi.decode(returnedData, (uint256));
   }
}