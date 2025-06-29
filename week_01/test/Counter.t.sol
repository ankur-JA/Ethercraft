// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter(100);
    }

    function test_increment() public {
        counter.increment();
        assertEq(counter.count(), 101);
    }

    function test_decrement() public {
        counter.decrement();
        assertEq(counter.count(), 99);
    }

    function test_getCount() public {
        assertEq(counter.getCount(), 100);
    }
}