pragma solidity ^0.8.0;
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter{
    uint public count = 0;

    // constructor() public {
    //     count = 0;
    // }

    // function getCount() public view returns(uint) {
    //     return count;
    // }

    function incrementCount() public {
        count++;
    }
}