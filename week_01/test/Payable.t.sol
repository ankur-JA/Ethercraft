// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {Payable} from "../src/Payable.sol";

contract TestPayable is Test {
    Payable public payableContract;
    address owner;
    address user;

    function setUp() public {
        owner = address(this);
        user = address(0xba230e7c7E39D09443d8Da0a332DD787BD1352cb);
        vm.deal(address(this), 10 ether);
        payableContract = new Payable{value: 1 ether}();
    }

    function test_owner() public view {
        assertEq(payableContract.owner(), owner);
    }

    function test_deposit() public {
        vm.deal(address(this), 10 ether);
        (bool success,) = address(payableContract).call{value: 1 ether}("");
        require(success, "Failed to send ETH");
        assertEq(address(payableContract).balance, 2 ether);
    }


    function test_withdraw() public {
        vm.deal(address(this), 10 ether);
        (bool success, ) = address(payableContract).call{value: 1 ether}("");
        require(success, "failed to send eth");
        uint256 ownerBalanceBefore = owner.balance;

        payableContract.withdraw();

        assertEq(address(payableContract).balance, 0);

        assertGt(owner.balance, ownerBalanceBefore);
    }
}