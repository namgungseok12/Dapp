// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    // Ether payments
    // Modifiers
    // Visibility
    // Events
    // Enums

    address payable public owner;

    constructor() {
        owner = msg.sender;
    }

    function book() payable {
        owner.transfer(msg.value);
    }
}