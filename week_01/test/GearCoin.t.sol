// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {GearCoin} from "../src/GearCoin.sol";

contract GearCoinTest is Test {
    GearCoin public gearcoin;

    function setUp() public {
        gearcoin = new GearCoin('TOKEN', 'TK', 6);
    }

    function test_name() public view {
        assertEq(gearcoin.name(), "TOKEN");
    }

    
}
