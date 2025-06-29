// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Primitives {
    bool public _boo = true;

    uint8 public u8 = 1;
    uint256 public u256 = 33;
    uint public u = 44;

    int8 public i8 = -8;
    int256 public i256 = -44;

    address public _addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    // mim and max of int

    int256 public min256 = type(int256).min;
    int256 public max256 = type(int256).max;

    // default values
    uint public defaultValue;
    int256 public intDefaultValue;
    address public addressDefaultValu;
    bool public boolDefaultValue;
}