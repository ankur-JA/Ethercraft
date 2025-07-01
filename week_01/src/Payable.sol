// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Functions and addresses declared payable can receive ether into the contract.
contract Payable {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    error notOwner();

    modifier onlyOwner() {
        if(msg.sender != owner) revert notOwner();
        _;
    }

    function deposit() public payable {}

    function notPayable() public {}

    function withdraw() public onlyOwner {
        uint256 amount = address(this).balance;

        (bool success,) = owner.call{value: amount}("");
        require(success, "Faild to send ETHER");
    }

    function transfer(address _addr, uint256 _amount) public onlyOwner {
        (bool success,) = _addr.call{value: _amount}("");
        require(success, "Failed to send ether!");
    }
    
      
}