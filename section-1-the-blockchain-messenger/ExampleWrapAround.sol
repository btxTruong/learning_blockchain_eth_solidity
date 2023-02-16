// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;

contract ExampleWrapAround {
  uint public myUint; // if we set default value, it will cost extra gas, so don't need to set to any valueZ

  uint8 public myUint8 = 2 ** 4;

  function setMyUint(uint _myUint) public {
    myUint = _myUint;
  }

  function decrementUint() public {
    myUint--;
  }

  function incrementUint8() public {
    unchecked {
      myUint8++;
    }
  }
}
