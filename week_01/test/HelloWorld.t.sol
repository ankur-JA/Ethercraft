// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract HelloWorldTest is Test {
    HelloWorld public helloworld;

    function setUp() public {
        helloworld = new HelloWorld();
    }

    function test_helloWorld() public view {
        string memory message = helloworld.greet();
        console.log("Greeted with:", message);
        assertEq(message, "Hello World!");
    }

    
}
