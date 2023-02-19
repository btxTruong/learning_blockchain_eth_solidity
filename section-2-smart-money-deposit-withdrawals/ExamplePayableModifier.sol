// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExamplePayableModifier {
  string public myString = "Hello world";

  // payable modifier to be needed to receive eth
  function updateString(string memory _newString) public payable {
    // you'll see that every time you send 1 eth, you can update the string.
    // But if you send less or more, you just get refunded.
    if (msg.value == 1 ether) {
      myString = _newString;
    } else {
      payable(msg.sender).transfer(msg.value);
    }
  }
}
