// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Immutable variables are like constants. 
// Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
// The immutable also gets injected at deployment in the byte code

contract Immutable {
    address public immutable addr;
    uint256 public immutable num;


    constructor(address _addr, uint256 _num) {
        addr = _addr;
        num = _num;
    }
}