// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {IfElse} from "../src/IfElse.sol";

contract TestIfElse is Test {
    IfElse public ifElse;

    function setUp() public {
        ifElse = new IfElse();
    }

    function test_foo() public view {
        assertEq(ifElse.foo(13), 1);
    }

    function test_tenary() public view {
        assertEq(ifElse.ternary(4), 1);
    }

}