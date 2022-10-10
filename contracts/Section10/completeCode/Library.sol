// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Library を学ぼう
 *  ライブラリは、さまざまなcontractで再利用することが目的
 *  ライブラリ内定義のファンクションはLibraryを使う側のコントラクトのコンテキストで実行される
 */

library IncrementCountOnly {
    struct Counter {
        uint _num;
    }

    function currentNum(Counter storage c) internal view returns (uint) {
        return c._num;
    }

    function incrementNum(Counter storage c) internal {
        unchecked {c._num++;}
    }
}