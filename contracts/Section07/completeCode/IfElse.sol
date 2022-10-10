// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title if〜else〜 を学ぼう
 */
contract IfElse {
    uint public a;
    function ifF(uint n) external {
        if (a < n) {
            a = n;
        }
    }
    function ifElse(address to) external view returns (bool) {
        if (msg.sender != to) {
            return true;
        } else {
            return false;
        }
    }
    function ifElseIf(uint n) external pure returns (string memory) {
        if (n < 10) {
            return "low";
        } else if (n <= 100) {
            return "medium";
        } else {
            return "high";
        }
    }
}
