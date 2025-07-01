// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Mapping {
    mapping(address => uint256) public myMap;

    mapping(address => mapping(uint256 => bool)) public nested;

    function get_myMap(address _addr) public view returns(uint256) {
        return myMap[_addr];
    }

    function set_myMap(address _addr, uint256 _i) public {
        myMap[_addr] = _i;
    }

    function remove_myMap(address _addr) public {
        delete myMap[_addr];
    } 


    function get_nested(address _addr, uint256 _i) public view returns(bool) {
        return nested[_addr][_i];
    }

    function set_nested(address _addr, uint256 _i, bool _boo) public {
        nested[_addr][_i] = _boo;
    }

    function remove_nested(address _addr, uint256 _i) public {
        delete nested[_addr][_i];
    }
}