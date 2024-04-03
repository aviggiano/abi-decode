// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    struct Data {
        string name;
        uint256 number;
    }

    Data public data;

    function setNumber(uint256 newNumber) public {
        data.number = newNumber;
    }

    function setName(string memory newName) public {
        data.name = newName;
    }

    function increment() public {
        data.number++;
    }
}
