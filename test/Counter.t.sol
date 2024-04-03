// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        (, uint256 number) = counter.data();
        assertEq(number, 1);
    }

    function test_Increment_call() public {
        counter.increment();
        (bool success, bytes memory returnData) = address(counter).call(abi.encodeCall(counter.data, ()));
        assertTrue(success);
        Counter.Data memory data = abi.decode(returnData, (Counter.Data));
        assertEq(data.number, 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        (, uint256 number) = counter.data();
        assertEq(number, x);
    }
}
