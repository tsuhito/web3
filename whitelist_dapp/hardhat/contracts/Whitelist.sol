// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Whitelist {
    // Max number of whitelisted addresses allowed
    uint8 public mawWhitelistedAddresses;

    // create a mapping of whiteListedAddresses
    // if an address is whitelisted, we would set it to true, it is false by
    // default for all other addresses
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted keeps track of the number of addresses that are
    // whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses 
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        mawWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */
    
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "sender is already whitelisted");
        
        // check if the number of whitelisted addresses is less than the max, if not then throw an error
        require(numAddressesWhitelisted < mawWhitelistedAddresses, "Max number of whitelisted addresses already reached");

        // add the address which called the function to the whitelistedAddress mapping
        whitelistedAddresses[msg.sender] = true;

        // increment the number of whitelisted addresses
        numAddressesWhitelisted++;
    }

}