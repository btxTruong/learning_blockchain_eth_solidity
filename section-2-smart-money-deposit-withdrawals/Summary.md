# Section summary

## Setter and Getter Function

- Writing transaction: Transactions
- Reading transaction: Call

- Calls are against a local blockchain node
  - Remember: Everyone has a copy of the blockchain
  - If you don't need to change anything, you don't need to inform other participants
  - Reading is virtually free

- View Function: Reading from state and from other View functions
- Pure Function: Not reading or modifying the state


## Function Visibility
- Public:
  - Can be called internally and externally
- Private:
  - Only for the contract, not externally reachable and not via derived contract
- External:
  - Can be called from other contracts
  - Can be called externally
- Internal:
  - Only from the contract itself or from derived contracts. Can't be invoked by a transaction

## Constructor
- A function with the name "constructor(...)"
- Called only during deployment
- Can't be called afterwards
- Is either public or internal

## Fallback Function
- A function with the name "fallback() external [payable]" to receive calldata
- A function with the name "receive() external payable" to receive a value without calldata
- Called when a transaction with the wrong function signature is sent to the smart contract
- Called when the function in the transaction isn't found
- Can only be external
  - Fallback payable is optional
- Contracts receiving Ether without a fallback function and without a function call will throw an exception
- You cannot completely avoid receiving Ether
- Worst case: You can only rely on 2300 gas
  - _contractAddress.transfer(1 ether); send only 2300 gas along
- Forcefully prevent contract execution if called with contract data
  - require(msg.data.length == 0)

## Msg.value and address
- Global msg object contains a value property (in wei)
- How much wei as sent during this call ?
- Address type variables have a balance (address X = 0x123...X.balance)
- Address type variable can be payable (address payable x)
- Payable addresses can receive a value (x.transfer(...wei))
- The contract itself can have a balance (address(this).balance)