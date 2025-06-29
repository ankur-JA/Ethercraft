// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {Primitives} from "../src/Primitives.sol";

contract TestPrimitives is Test {
    Primitives public primitives;

    function setUp() public {
        primitives = new Primitives();
    }

    function test_boo() public view {
        console.log(primitives._boo());
        assertEq(primitives._boo(), true);
    }

    function test_u8() public view {
        assertEq(primitives.u8(), 1);
    }

    function test_u256() public view {
        assertEq(primitives.u256(), 33);
    }

    function test_u() public view {
        assertEq(primitives.u(), 44);
    }

    function test_i8() public view {
        assertEq(primitives.i8(), -8);
    }

    function test_i256() public view {
        assertEq(primitives.i256(), -44);
    }

    function test_addr() public view {
        console.log(primitives._addr());
        address addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
        assertEq(primitives._addr(), addr);
    }

    function test_min256() public view {
        int256 min = type(int256).min;
        assertEq(primitives.min256(), min);
    }


    function test_max256() public view {
        int256 max = type(int256).max;
        assertEq(primitives.max256(), max);
    }

    function test_default() public view {
        assertEq(primitives.defaultValue(), 0);
        assertEq(primitives.intDefaultValue(), 0);
        assertEq(primitives.boolDefaultValue(), false);
        assertEq(primitives.addressDefaultValu(), 0x0000000000000000000000000000000000000000);
    }

}