# BasicNFT (BNFT) - A Basic BEP-721 NFT with Capacity Tracking

![License](https://img.shields.io/badge/License-MIT-blue)

A simple ERC721-compliant (BEP-721) NFT contract deployed on the Binance Smart Chain (BSC). This contract allows minting NFTs with a customizable `capacity` and tracks the last update timestamp for each NFT.

## Features

- **Mint NFTs**: Create new NFTs with a specified capacity (open to all users in the current implementation).
- **Update Capacity**: NFT owners can update the capacity of their NFTs.
- **Track Timestamps**: Automatically records the last update time for each NFT.
- **Time Check**: Calculate how much time has passed since the last update for any NFT.
- **OpenZeppelin Integration**: Built using the audited OpenZeppelin ERC721 standard for security.

## Installation

1. **Prerequisites**:
   - Node.js (v18+ recommended)
   - npm or yarn
   - A development environment like [Hardhat](https://hardhat.org/) or [Truffle](https://trufflesuite.com/)

2. **Install Dependencies**:
   ```bash
   npm install @openzeppelin/contracts
   ```

## Usage

### Installation
```bash
npx hardhat compile
```

### Deploying to BSC

1. Configure your BSC network settings in `hardhat.config.js`.:
2. Run:
   ```bash
   npx hardhat run scripts/deploy.js --network bscTestnet
   ```

### Interacting with the Contract

#### Mint a New NFT
```javascript
// JavaScript example (using ethers.js)
await basicNFT.mintNFT(userAddress, 1, 500); // Mint NFT with ID 1 and 500 capacity
```

#### Update NFT Capacity
```javascript
// Only the NFT owner can call this
await basicNFT.updateCapacity(1, 750); // Update capacity of NFT 1 to 750
```

#### Check Time Since Last Update
```javascript
const timeElapsed = await basicNFT.getTimeSinceLastUpdate(1);
console.log(`Time since last update: ${timeElapsed} seconds`);
```

## Usage

### Structs
```solidity
struct NFTInfo {
    uint256 capacity;    // Capacity
    uint256 lastUpdated; // Timestamp of last update
}
```

### Functions

- **mintNFT(address to, uint256 tokenId, uint256 capacity)**: Mints a new NFT (no access restrictions by default).
- **updateCapacity(uint256 tokenId, uint256 newCapacity)**: Updates the NFT's capacity (caller must own the NFT).
- **getTimeSinceLastUpdate(uint256 tokenId)**: Returns the time (in seconds) since the last capacity update.

## Security Note

- The `mintNFT` function is **open to all users** in the provided code. To restrict minting, add access control (e.g., OpenZeppelin's `Ownable`).
- Always audit and test contracts before deploying to production.

## License

This project is licensed under the **MIT License**.

## Contributing

Contributions are welcome! Open a pull request or issue for discussions.

## Disclaimer

This contract is for educational purposes only. Use at your own risk.