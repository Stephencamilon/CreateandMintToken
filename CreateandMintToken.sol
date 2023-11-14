// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract ModifiedToken is ERC20, Ownable {
    constructor() ERC20("ModifiedToken","MTK") Ownable(msg.sender) {}

    // Mint new tokens and assign to the specified address
    function createTokens(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }

    // Burn tokens from the caller's address
    function destroyTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Transfer tokens from the caller's address to the specified recipient
    function sendTokens(address receiver, uint256 amount) external {
        _transfer(msg.sender, receiver, amount);
    }

    // Retrieve the total supply of tokens
    function getTotalSupply() external view returns (uint256) {
        return totalSupply();
    }

    // Retrieve the balance of tokens for a specific address
    function getBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }
}
