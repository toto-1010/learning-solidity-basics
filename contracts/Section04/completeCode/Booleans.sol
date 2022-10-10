// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Booleans Typeを学ぼう
 */
contract Booleans {
    /// @dev Boolean型にはtrueまたはfalseが入る
    bool public t1 = true;
    bool public f1 = false;

    /// @dev 反転
    bool public f2 = !t1;
    bool public t2 = !f1;

    /// @dev 論理積
    bool public conjunction1 = t1 && t2;
    bool public conjunction2 = t1 && f1;
    bool public conjunction3 = f1 && t1;
    bool public conjunction4 = f1 && f2;

    /// @dev 論理和
    bool public disjunction1 = t1 || t2;
    bool public disjunction2 = t1 || f1;
    bool public disjunction3 = f1 || t1;
    bool public disjunction4 = f1 || f2;

    /// @dev 同値チェック結果(true|false)を設定
    bool public equality1 = (t1 == t2);
    bool public equality2 = (t1 == f1);

    /// @dev 不同値チェック結果(true|false)を設定
    bool public inequality1 = (t1 != t2);
    bool public inequality2 = (t1 != f1);
}
