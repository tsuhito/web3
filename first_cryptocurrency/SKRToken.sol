// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Import ERC20 Contract from Open Zeppelin like a template 
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

// Extends on OpenZeppelin's ERC20 class
contract SikerimToken is ERC20 {

    // We also want to call the constructor import
    // inside ERC20
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) 
    {
        // This is OUR constructor
        // Get some tokens for ourselves 
        // msg.sender is the person deploying the contract
        _mint(msg.sender, 10 * 10 ** 18);
    }

}