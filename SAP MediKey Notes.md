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