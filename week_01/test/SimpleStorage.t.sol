// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";


contract TestSimpleStorage is Test {
    SimpleStorage public simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }

    function test_set() public {
        simpleStorage.set(123);
        assertEq(simpleStorage.num(), 123);
    }

    function test_get() public {
        simpleStorage.set(23);
        assertEq(simpleStorage.get(), 23);
    }
}