## SAP MediKey



| Component         | Meaning                                                      |
| ----------------- | ------------------------------------------------------------ |
| Migrations.sol    | A smart contract that handles our migrations when we deploy our smart contracts |
| Migrations folder | Where migration files live<br />1_initial_migration.js <-- the prepended number tells Solidity the order in which files should be run during migration |
| Migrations        | Used when you make changes to DB, such as state changes<br />We use a migration to deploy our smart contract to the blockchain -- we're essentially creating a new transaction on blockchain and changing its state |
| node_modules      | Where dependencies live                                      |
| src               | Client-side applicationtest                                  |
| test              | for test files                                               |
| package.json      | specific dependencies                                        |
| truffle.js        | settings                                                     |

Reads on the blockchain are free; writes cost gas.

Whenever we deploy a contract to the blockchain, it will cost Ethereum.

Defaults to debiting the amount from the first amount.

##### Storage vs Memory

| Type    | Purpose                                                      |
| ------- | ------------------------------------------------------------ |
| Storage | contract state variables<br />persistent between function calls<br />expensive to use |
| Memory  | holds temporary values<br />erased between (external) function calls<br />ch |
| Stack   | Holds small local variables<br />Almost free to use<br />Can only hold a limited amount of values |



Contract must be migrated to pick up changes.

```
truffle migrate --reset
```

Remember that all the code and data on blockchain is immutable -- it's not supposed to change!

Whenever we change it for develop purposes, we must push a new copy of smart contract to local blockchain to get our changes.

We lose the state of our contract and we'll be assigned a new address.

Migrations are only intended to be run once.  So we have to use --reset each time when developing.

e.g. dropping tables in development DB and starting over again.'



**candidates()** expects to receive a key (uint) as it is designed to return a single candidate.

```
candidates(1) //returns 1st candidate as count is incremented before adding
candidates(2) 
```



Structs in Solidity are syntactic sugar; Ethereum isn't really aware of them so you can't just call **candidate.id**



After your contract is compiled, you get getters for free, but the EVM doesn't really know how to build a struct when we return a candidate from a mapping.

You can only access things by zero based index.

candidate[0] returns id    ***candidate[0].toNumber()***

candidate[1] returns name

candidate[2] returns voteCount ***candidate[2].toNumber()***



We're modelling our candidate with a struct, and we're storing candidates with mapping.  But how do we represent voters?



Anyone connected to the blockchain should be able to vote.

Voter = modelled by any address connected to the blockchain.

We get 10 accounts for free in Ganache to develop with.

We also have access to these accounts with a library called **web3**



Testing is really important when developing contract.

You want them bug free because blockchain is supposed to be immutable.  If there are any bugs, you must deploy a new copy of it.

This new copy will not have the same state as the old contract, nor the same address.

The only thing you can do with the old one is to disable it.  So you want to avoid it if possible!  Another reason is: Deploying our contract costs gas and ether.

If our contract contains functions that write to the blog chain, the person sending this function is going to be wasting ether and it won't run the way they expect them to.



```
web3.eth.getAccounts()
```



```
> web3.eth.getAccounts().then(function(a) {acc = a})
> acc[0]
> app.vote(1, {from: acc[0]})
```



```
truffle(development)> app.vote(1,{from: acc[1]})
{ tx: '0x47faaa0d156dcdc650aa51ab342a8304df455dfc7cf640820f9342dcc15c031b',
  receipt:
   { transactionHash: '0x47faaa0d156dcdc650aa51ab342a8304df455dfc7cf640820f9342dcc15c031b',
     transactionIndex: 0,
     blockHash: '0xd6e05a53af2fe1606580700136d3be7630e1b4843ee0050908efba75573fdd50',
     blockNumber: 65,
     from: '0x48daad59e455740a371c2fc14394d3253f609d1f',
     to: '0xabfee6f38687fef86c0c41578a873c44fdf1321d',
     gasUsed: 64109,
     cumulativeGasUsed: 64109,
     contractAddress: null,
     logs: [ [Object] ],
     status: true,
     logsBloom: '0x00000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000008000000000000000000000000000040000000000004000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000040000000000000000000000000000000000',
     v: '0x1c',
     r: '0x8cdc278fe85835059b83b478e4b09a2ad51d9d1b6d6c8ff60e78b06f77b461bd',
     s: '0x5642a2d8086d34f759027bcbcedab2c69a8c25138ac503e3fa19c278d92d084a',
     rawLogs: [ [Object] ] },
  logs:
   [ { logIndex: 0,
       transactionIndex: 0,
       transactionHash: '0x47faaa0d156dcdc650aa51ab342a8304df455dfc7cf640820f9342dcc15c031b',
       blockHash: '0xd6e05a53af2fe1606580700136d3be7630e1b4843ee0050908efba75573fdd50',
       blockNumber: 65,
       address: '0xabFEe6f38687fef86C0c41578A873c44fdF1321d',
       type: 'mined',
       id: 'log_062173db',
       event: 'votedEvent',
       args: [Object] } ] }
```



Ethereum network uses the concept of gas to determine how much writing each transaction costs.

Gas vs Gas Price

Gas = unit of price in and of itself

Ethereum amount = Gas Usage x Gas Price

Gas can be complex.