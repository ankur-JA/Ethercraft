// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Array {
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];

    uint256[10] public fixedSizeArray;

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    function get_array() public view returns (uint256[] memory) {
        return arr;
    }

    function dataPush(uint256 i) public {
        arr.push(i);
    }

    function dataPop() public {
       arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 i) public {
        delete arr[i];
    }
}