// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SendWithdrawMoney {

  uint public balanceReceived;

  function deposit() public payable {
    balanceReceived += msg.value;
  }

  function getContractBalance() public view returns (uint) {
    return address(this).balance;
  }

  function withdrawAll() public {
    address payable to = payable(msg.sender);

    to.transfer(getContractBalance());

    // in newer solidity version, we should avoid send or transfer, instead of we use
    // transfer() and send() should be avoided (because they take a hard dependency on gas costs by forwarding a fixed amount of gas: 2300).
    // Gas specific code (call{gas: ..., value: ...}("")) should also be avoided.

    // Read more: https://diligence.consensys.net/blog/2019/09/stop-using-soliditys-transfer-now
    // and https://github.com/ConsenSys/smart-contract-best-practices/blob/master/README-vi.md
    (bool success,) = to.call{value : getContractBalance()}("");
    require(success, "Transfer failed.");
  }

  function withdrawToAddress(address payable to) public {
    to.transfer(getContractBalance());
  }
}
