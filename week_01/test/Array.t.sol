// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {Array} from "../src/Array.sol";

contract TestArray is Test {
    Array public arr;

    function setUp() public {
        arr = new Array();
    }

    function test_arr() public {
        arr.dataPush(1);
        arr.dataPush(2);
        arr.dataPush(3);
        assertEq(arr.getLength(), 3);
        arr.dataPop();
        assertEq(arr.getLength(), 2);

        arr.remove(1);

        assertEq(arr.get(1), 0);

    }
}