// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title 変数スコープ を学ぼう
 */
contract Scope {
    function blockScope() pure public {
        {
            uint a;
            a = 10;
        }
        // ブロックが異なるので同じ変数名を定義可能
        {
            uint a;
            a = 11;
        }

        // このブロックスコープにaの定義はないので以下行はcompileエラーになる
        // return a;
    }
    function blockScope2() pure public returns (uint) {
        uint a;
        {
            // aに代入
            a = 10;
        }
        {
            // aに代入
            a = 11;
        }
        return a;
    }
    function blockScope3() pure public returns (uint) {
        uint a;
        {
            // Compileエラー。下位ブロックで上位定義済みのaを再定義できない
            // uint a;
            a = 10;

        }

        return a;
    }

}
