// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Interface を学ぶために使う簡単な実装です
 */

contract SimpleCalc {
    function add(uint a_, uint b_) public pure returns (uint) {
        return a_ + b_;
    }
    function sub(uint a_, uint b_) public pure returns (uint) {
        require(a_ >= b_, "a_ > b_");
        return a_ - b_;
    }
    function mul(uint a_, uint b_) public pure returns (uint) {
        return a_ * b_;
    }
    function div(uint a_, uint b_) public pure returns (uint) {
        require(b_ > 0, "b_ > 0");
        return a_ / b_;
    }
} 