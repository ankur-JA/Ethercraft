// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract GearCoin {
    string _name;
    string _symbol;
    uint8 _decimals;

    uint256 _totalSupply;

    address owner;

    mapping (address => uint256) balances;

    mapping (address => mapping (address => uint256)) allowances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    modifier onlyOwner() {
        require(msg.sender == owner, "First be the Owner");
        _;
    }
    

    constructor (string memory name_, string memory symbol_, uint8 decimals_) {
        _name = name_;
        _symbol = symbol_;
        _decimals = decimals_;
        owner = msg.sender;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totolSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        balance = balances[_owner];
        return balance;
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        require(balances[msg.sender] >= _value, "Not enough token!");

        balances[msg.sender] -= _value;
        balances[_to] += _value;

        success = true;

        emit Transfer(msg.sender, _to, _value);

        return success;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(allowances[_from][msg.sender] >= _value, "Not enough token!");

        balances[_from] -= _value;
        balances[_to] += _value;

        success = true;

        return success;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowances[msg.sender][_spender] = _value;

        success = true;
        
        emit Approval(msg.sender, _spender, _value);

        return success;
    }

    function allowance(address _owner, address _spender) public view returns(uint256) {
        uint256 balance = allowances[_owner][_spender];

        return balance;
    }

    function mint(address _to, uint256 _value) public onlyOwner returns (bool success) {
        balances[_to] += _value;

        _totalSupply += _value;

        success = true;

        return success;

    }

    function burn(uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value, "You don't have the token!");

        balances[msg.sender] -= _value;

        _totalSupply -= _value;

        success = true;

        return success;
    }
}
