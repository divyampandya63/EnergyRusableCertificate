# Energy Reusable Certificate Token Transfer

## Overview

This project consists of a smart contract written in Solidity for an ERC-20 token named "EnergyReusableCertificate" with a basic UI for transferring tokens. The smart contract includes functionality for creating apartments with associated token balances.

## Smart Contract

The Solidity smart contract is located in the `EnergyReusableCertificate.sol` file. It inherits from OpenZeppelin's ERC20 and Ownable contracts, allowing for token management and ownership functionalities.

### Features

- ERC-20 Token
- Apartment Management
- Initial Apartment Creation
- Token Transfer Function

### Usage

1. Deploy the smart contract to your preferred Ethereum network.
2. Use the provided script to create initial apartments and transfer tokens.

## UI Scripts

### 1. Ether Transfer UI - Script 1

The first HTML script (`index.html`) provides a simple UI for transferring ERC-20 tokens. It includes fields for the recipient's address and the token amount, along with a button to initiate the transfer.

### 2. Token Transfer UI - Script 2

Similar to the first script, this HTML file (`index2.html`) offers another UI for token transfers. It uses Web3.js to interact with the Ethereum network and MetaMask for account access. Make sure to replace the placeholder addresses and ABI with your contract details.

### 3. Token Transfer UI - Script 3

The third HTML script (`index3.html`) provides a UI for transferring tokens directly from the smart contract. It utilizes the Web3.js library and MetaMask for transaction signing. Adjust the sender and recipient addresses, as well as the token amount, according to your needs.

## Getting Started


npm install @openzeppelin/contracts


1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/energy-reusable-certificate.git
   cd energy-reusable-certificate
