// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {GearCoin} from "../src/GearCoin.sol";

contract GearCoinTest is Test {
    GearCoin public gearcoin;

    address owner = address(this);
    address user1 = address(1);
    address user2 = address(2);

    function setUp() public {
        gearcoin = new GearCoin('TOKEN', 'TK');
    }

    function test_name() public view {
        assertEq(gearcoin.name(), "TOKEN");
    }

    function test_symbol() public view {
        assertEq(gearcoin.symbol(), 'TK');
    }

    function test_decimals() public view {
        assertEq(gearcoin.decimals(), 6);
    }

    function test_mint() public {
        gearcoin.mint(user1, 10 ether);
    }
}
