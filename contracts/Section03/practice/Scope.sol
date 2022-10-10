// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title 変数スコープ を学ぼう
 */
contract Scope {
    function blockScope() pure public {
        // ブロックが異なるので同じ変数名を定義可能

        // このブロックスコープにaの定義はないので以下行はcompileエラーになる
        // return a;
    }
    function blockScope2() pure public returns (uint) {
            // aに代入

            // aに代入
    }
    function blockScope3() pure public returns (uint) {
            // Compileエラー。下位ブロックで上位定義済みのaを再定義できない

            // uint a
            // aに代入

    }

}
