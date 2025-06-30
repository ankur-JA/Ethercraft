// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {EtherUnits} from "../src/EtherUnits.sol";


contract TestEtherUnits is Test {
    EtherUnits public etherUnits;

    function setUp() public {
        etherUnits = new EtherUnits();
    }


    function test_units() public view {
        assertEq(etherUnits.oneWei(), 1);
        assertEq(etherUnits.oneGwei(), 1e9);
        assertEq(etherUnits.oneEther(), 1e18);
    }
}