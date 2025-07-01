// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {Mapping} from "../src/Mapping.sol";

contract TestMapping is Test {
    Mapping public mpp;

    function setUp() public {
        mpp = new Mapping();
    }

    function test_myMap() public {
        mpp.set_myMap(0xba230e7c7E39D09443d8Da0a332DD787BD1352cb, 500);
        assertEq(mpp.get_myMap(0xba230e7c7E39D09443d8Da0a332DD787BD1352cb), 500);
        mpp.remove_myMap(0xba230e7c7E39D09443d8Da0a332DD787BD1352cb);
        assertEq(mpp.get_myMap(0xba230e7c7E39D09443d8Da0a332DD787BD1352cb), 0);
    }


    function test_nested() public {
        mpp.set_nested(0xba230e7c7E39D09443d8Da0a332DD787BD1352cb, 256, true);
        assertEq(mpp.get_nested(0xba230e7c7E39D09443d8Da0a332DD787BD1352cb, 256), true);
        mpp.remove_nested(0xba230e7c7E39D09443d8Da0a332DD787BD1352cb, 256);
        assertEq(mpp.get_nested(0xba230e7c7E39D09443d8Da0a332DD787BD1352cb, 256), false);
    }


}