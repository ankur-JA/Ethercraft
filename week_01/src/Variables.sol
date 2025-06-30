// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// There are 3 types of variables in Solidity

// local
//      declared inside a function
//      not stored on the blockchain
// state
//      declared outside a function
//      stored on the blockchain
// global (provides information about the blockchain)

contract Variables {
    // state variable store's on the blockchain

    string public text = "Hello world!";
    uint256 public num = 123;


    function doSomething() public view{
        // local variable
        uint256 u256 = 12355;


        // global variable like block and msg
        uint time = block.timestamp;
        address sender = msg.sender;
    }
}