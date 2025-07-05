// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


/*
 It is basic wallet
  - Anyone can ehter to contract
  - Only owner can withdraw the ether
*/

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "sorry you are not the owner");

        payable(msg.sender).transfer(amount);
    }

    function getAmount() public view returns (uint256) {
        return address(this).balance;
    }
}
