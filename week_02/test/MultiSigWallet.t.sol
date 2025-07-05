// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MultiSigWallet} from "../src/MultiSigWallet.sol";


contract MultiSigWalletTest is Test {
    MultiSigWallet public multiSigWallet;

    address public owner1 = address(123);
    address public owner2 = address(456);
    address public owner3 = address(789);
    address public owner4 = address(246);
    address public owner5 = address(975);

    address[] public owners;

    uint256 public numOfConfirmationRequired = 5;

    function setUp() public {
        owners.push(owner1);
        owners.push(owner2);
        owners.push(owner3);
        owners.push(owner4);
        owners.push(owner5);
        multiSigWallet = new MultiSigWallet(owners, numOfConfirmationRequired);

        vm.deal(address(multiSigWallet), 20 ether);
    }

    
}