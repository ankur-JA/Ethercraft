// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {Gas} from "../src/Gas.sol";


contract TestGas is Test {
    Gas public gas;


    function setUp() public {
        gas = new Gas();
    }

    function test_forever() public view {
        //gas.forever();
        assertEq(gas.i(), 0);
    }
}