### My first solidity 101

This repo is for showing what I have learnt about using solidity to write the smart contract ...

This is the trial stage, there will be only basics knowledge points covered by this codebase ...

The codebase will be updated day by day ...


#### Something related with solidity (what I have learnt)

Smart contract: a piece of code lives in blockchain

Ethereum: its about a network of computers which transfer money into different parties and save the transaction history as ledger data.

There are many ethereum networks, such as testing networks (for testing transactions), you can even create your own private ethereum network on your computer and etc

Ethereum has many nodes, node is a machine running an ethereum client (ethereum client: can be understand as a software. Once this software has been installed on computer, ethereum node will be existed on current ethereum network)

Each of the ethereum node has a full copy of transaction blockchain.

blockchain means a database which stores the transaction histories records (people usually called as LEDGER)


What is transaction (The FLOW)?

User clicks `submit` button on form ->
Address sent to backend server ->
Backend server used web3 library to create a `transaction` object ->
Backend server sent `transaction` object to `Rinkeby` test network ->
Backend server waited for transaction to get confirmed ->
Backend server sent success message back to browser.


You can understand transaction is a record which records one account sent money to another account (transaction object is the ledger content !!!!)


transaction object contains: 

- nonce: how many times the sender has sent a transaction
- to: money receiver account
- value: total amount
- gasPrice: the total transaction handling fee (手续费)
- startGas/gasLimit: total units of gas which will cost
- v, r, s: cryptographic pieces of data which used for generating sender's account address
