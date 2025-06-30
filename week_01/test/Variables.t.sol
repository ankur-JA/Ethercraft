// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {Variables} from "../src/Variables.sol";

contract TestVariable is Test {
    Variables public variable;

    function setUp() public {
        variable = new Variables();
    }

    function test_state() public view {
        assertEq(variable.text(), "Hello world!");
        assertEq(variable.num(), 123);
    }

    function test_doSomething() public view {
        variable.doSomething();
    }

}