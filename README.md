# Building in Avalanche Assessment
This project demonstrates deploying a smart contract with various token functions to Avalanche Testnet.
<br><br>**This project is only a demonstration of using a smart contract to the Avalanche Test.**

## Description
Project is done in Solidity.
<br>The smart contract allows users to check their balance, burn, transfer, and redeem tokens/items. The owner of the contract can mint tokens in addition to what the users can do.

## Running the program
### For users
* Go to https://remix.ethereum.org/
* Press the dropdown for Environment, then select Injected Provider.
* If prompted, use Metamask on which wallet will be used.
* Select the account to be used, then change the network to Avalanche Testnet C-Chain.
* Press Deploy & Run at the sidebar of Remix.
* Paste the contract address ``0x8049e20280c527802666a1AC72104Ae32F06c4c8``, then press ``At Address``.
* Token methods can be run on the newly created contract placed at the bottom left part of the page.

### For contract deployers
* Place private key and API key in ``hardhat.config.js``.
* Run ``npx hardhat run scripts/deploy.js --network fuji`` (Assuming contract is being deployed in Avalanche Testnet).
* Run ``npx hardhat verify <token address>`` (token address is found in the previous command run).

## Authors
* CoolUsername99
* Metacrafters (project template provider)
