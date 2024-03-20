# LUKSO Quickstart

In this project you will create your first Universal Profile (UP), and add to it as metadata your favourite song. You will then deploy the smart contract on the LUKSO Testnet.

This repository comes with all the code that you will need including smart contract, deployment script, and configuration. All you will have to do is to clone it, update with your favourite song, and deploy it.

## Prerequisites

1. Get some LYXt from the [faucet](https://faucet.testnet.lukso.network).
2. Have Hardhat installed
   If you do not ahve it installed, you can install it using:

   `npm install --save-dev hardhat`

## Steps

1. `git clone https://github.com/biancabuzea200/LUKSO_Quickstart.git`

2. Compile the smart contract
   `npx hardhat compile`

3. In the deploy.ts script, change the {INSERT_YOUR_FAVOURITE_SONG_HERE} to the name of your favourite song.

4. Rename the .env.example to .env and declare your private key and deployment address:

   PRIVATE_KEY=0x..

   UP_ADDR=0x..

5. Deploy to LUKSO Testnet
   Make sure that you have some LYXt for deployment then run:

   `npx hardhat run scripts/deploy.ts --network luksoTestnet`
