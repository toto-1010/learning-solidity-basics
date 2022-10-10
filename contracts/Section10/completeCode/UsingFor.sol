// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title UsingFor を学ぼう
 * Using A for B; 
 *  任意の型(B)にメンバ関数として関数(A)をアタッチすることが可能
 *  ファイルレベルでも、コントラクトレベルでも、コントラクト内部で有効
 */

import {IncrementCountOnly} from "./Library.sol";

contract UsingFor {
    using IncrementCountOnly for IncrementCountOnly.Counter;
    IncrementCountOnly.Counter private _num;

    function current() public view returns (uint) {
        return _num.currentNum();
    }
    function increment() public {
        _num.incrementNum();
    }
}
