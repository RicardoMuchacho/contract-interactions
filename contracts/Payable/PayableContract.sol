// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.24;

contract PayableContract {

  event receiveCalled(address, uint256);
  event fallbackCalled(address, uint256);

  // function receiveEth() public payable {}

  function withdrawEth(uint256 amount) public {
    uint256 amountToEth = amount*10**18;
    (bool success ,) = msg.sender.call{value: amountToEth}("");
    if (!success) revert();
  }

  function getBalance() public view returns(uint256 balance){
    balance = address(this).balance;
  }

  // called when the contract receives plain ETH (no data)
  receive() external payable { emit receiveCalled(msg.sender, msg.value);}
  
  // called when no matching function exists OR when calldata is sent with ETH
  fallback() external payable { emit fallbackCalled(msg.sender, msg.value);}
}