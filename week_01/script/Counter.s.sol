// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {GearCoin} from "../src/GearCoin.sol";

contract CounterScript is Script {
    GearCoin public gearcoin;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        gearcoin = new GearCoin('TOKEN', 'TK', 6);

        vm.stopBroadcast();
    }
}
