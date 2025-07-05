// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {EtherWallet} from "../src/EtherWallet.sol";

contract TestEtherWallet is Test {
    EtherWallet public etherWallet;

    function setUp() public {
        etherWallet = new EtherWallet();
        vm.deal(address(etherWallet), 10 ether);
    }

    function test_balance() public {
        (bool sucess,) = payable(address(etherWallet)).call{value: 5 ether}("");
        require(sucess, "failed the transfer!");

        assertEq(etherWallet.getAmount(), 15 ether);
    }

    receive() external payable{}

    fallback() external payable {}

    function test_withdraw() public {
        etherWallet.withdraw(5 ether);
        console.log("Reached here!");
        //uint256 balanceBefore = address(this).balance;
        assertEq(etherWallet.getAmount(), 5 ether);
        //assertEq(address(this).balance, balanceBefore + 5 ether);

    }
}