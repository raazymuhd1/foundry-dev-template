// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @dev author: REALLY COOL DEV :)
 */
import { ERC20Upgradeable } from "@openzeppelin/upgradeable-contracts/token/ERC20/ERC20Upgradeable.sol";
import {OwnableUpgradeable } from "@openzeppelin/upgradeable-contracts/access/OwnableUpgradeable.sol";

contract CoolDev is ERC20Upgradeable, OwnableUpgradeable {

    constructor() {
        // reinitializers is disabled, preventing any future initialization
        _disableInitializers();
    }

    function initialized(string memory name_, string memory symbol_, uint256 supply_) external onlyInitializing {
        
    }

    function issuance(uint256 amount, address to) external onlyOwner {
        if (to == address(0)) revert("you're not cool dev bro");
        _mint(to, amount);
    }

    function burning(uint256 amount) external {
        if (msg.sender == address(0)) revert("invalid caller");
        _burn(msg.sender, amount);
    }
}
