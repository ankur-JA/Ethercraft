// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 public count;

    constructor(uint256 _value) {
        count = _value;
    }

    function increment() public {
        count++;
    }

    function decrement() public {
        count--;
    }

    function getCount() public view returns(uint256) {
        return count;
    }
}