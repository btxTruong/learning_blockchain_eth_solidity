// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// We can send a plain eth transaction to a smart contract through the receive function and/or through the fallback function

// receive() is a function that gets priority over fallback() when a calldata is empty.
// But fallback gets precedence over receive when calldata does not fit a valid function signature.

contract ExampleFallback {
  uint  public lastValueSent;
  string public lastFunctionCalled;

  receive() external payable {
    lastValueSent = msg.value;
    lastFunctionCalled = "receive";
  }

  fallback() external payable {
    lastValueSent = msg.value;
    lastFunctionCalled = "fallback";
  }
}
