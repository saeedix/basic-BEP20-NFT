// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    struct NFTInfo {
        uint256 capacity;    // Capacity in watts
        uint256 lastUpdated; // Timestamp of last update
    }

    mapping(uint256 => NFTInfo) public nftInfo;

    constructor() ERC721("BasicNFT", "BNFT") {}

    // Mint new NFT with capacity (owner only)
    function mintNFT(address to, uint256 tokenId, uint256 capacity) external {
        _mint(to, tokenId);
        nftInfo[tokenId] = NFTInfo(capacity, block.timestamp);
    }

    // Update NFT capacity (owner only)
    function updateCapacity(uint256 tokenId, uint256 newCapacity) external {
        require(ownerOf(tokenId) == msg.sender, "Not owner");
        nftInfo[tokenId].capacity = newCapacity;
        nftInfo[tokenId].lastUpdated = block.timestamp;
    }

    // Get time since last update
    function getTimeSinceLastUpdate(uint256 tokenId) external view returns (uint256) {
        return block.timestamp - nftInfo[tokenId].lastUpdated;
    }
}