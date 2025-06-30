// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {Immutable} from "../src/Immutable.sol";


contract TestImmutable is Test {
    Immutable public _immutable;

    function setUp() public {
        _immutable = new Immutable(0xba230e7c7E39D09443d8Da0a332DD787BD1352cb, 256);
    }


    function test_immutable() public view {
        assertEq(_immutable.addr(), 0xba230e7c7E39D09443d8Da0a332DD787BD1352cb);
        assertEq(_immutable.num(), 256);
    }
}