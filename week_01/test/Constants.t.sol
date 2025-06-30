// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {Constants} from "../src/Constants.sol";

contract TestConstant is Test {
    Constants public constants;

    function setUp() public {
        constants = new Constants();
    }


    function test_constant() public view {
        assertEq(constants.MY_ADDRESS(), 0xba230e7c7E39D09443d8Da0a332DD787BD1352cb);
        assertEq(constants.MY_NUM(), 123);
    }
}