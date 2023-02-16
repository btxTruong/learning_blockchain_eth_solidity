// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleViewPure {
  uint public myStorageVar;

  // can access the contract variables
  function getMyStorageVar() public view returns (uint) {
    return myStorageVar;
  }

  function getAddition(uint a, uint b) public pure returns (uint) {
    return a + b;
  }

  function setMyStorageVar(uint _anotherVar) pubic {
    myStorageVar = _anotherVar;
  }
}
