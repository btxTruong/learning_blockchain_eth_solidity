// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleConstructor {
  address public myAdd;

  constructor(address _someAddress) {
    myAdd = _someAddress;

  }

  function setMyAddress(address _myAddress) public {
    myAdd = _myAddress;
  }

  function setMyAddToMsgSender() public {
    myAdd = msg.sender;
  }
}
