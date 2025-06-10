// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
  * @title GearCoin
  * @dev Simple ERC20-compliant token implementation with mint and burn functionality.
*/

contract GearCoin {
    // Token name
    string _name;

    // Token symbol
    string _symbol;

    //  Token decimals (fixed to 18)
    uint8 constant _decimals = 18;

    // Total token supply
    uint256 _totalSupply;

    // Owner address (has permission to mint new tokens)
    address owner;

    mapping (address => uint256) balances;

    mapping (address => mapping (address => uint256)) allowances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    modifier onlyOwner() {
        require(msg.sender == owner, "First be the Owner");
        _;
    }
    

    constructor (string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
        owner = msg.sender;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public pure returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool){
        require(balances[msg.sender] >= _value, "Not enough token!");

        balances[msg.sender] -= _value;
        balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(allowances[_from][msg.sender] >= _value, "Not enough token!");
        require(balances[_from] >= _value, "Not enough Token");

        balances[_from] -= _value;
        balances[_to] += _value;

        allowances[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        allowances[msg.sender][_spender] = _value;
        
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function allowance(address _owner, address _spender) public view returns(uint256) {
        return allowances[_owner][_spender];
    }

    function mint(address _to, uint256 _value) public onlyOwner returns (bool) {
        balances[_to] += _value;

        _totalSupply += _value;

        return true;

    }

    function burn(uint256 _value) public returns (bool) {
        require(balances[msg.sender] >= _value, "You don't have the token!");

        balances[msg.sender] -= _value;

        _totalSupply -= _value;

        return true;
    }
}
