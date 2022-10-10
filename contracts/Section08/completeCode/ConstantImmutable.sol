// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Constant and Immutable State Variables を学ぼう
 * 状態変数は、Constant(定数)またはImmutable(不変)として宣言することができる
 */
contract ConstantImmutable {
    // コントラクトが構築された後は、これらの値は変更することはできない
    // Constant(定数)は、コンパイル時に値を固定する必要がある
    // Immutable(不変)の場合は、コンパイル時には未定でもOKだが、constructorでは定義が必要
    // これらに対応している型はstringと値型の各型(int,address..etc)

    /// @dev constantは初期値の指定が必要
    string text = "TEXT";
    string public constant feeling = "good";

    /// @dev immutableは初期値なしでもOK。しかしその場合constructorでの初期値定義が必要
    // state visibilityでGetter Functionの生成と併用可能
    uint public immutable max;
    uint immutable min = 10;
    address immutable owner;

    constructor(uint max_) {
        max = max_;
        owner = msg.sender;
    }

    /// @dev 状態変数の値読み出しはviewを指定
    function getText() public view returns (string memory) {
        return text;
    }

    /// @dev constantではない状態変数の値は変更可能
    function changeText(string memory newS) public returns (string memory) {
        text = newS;
        return text;
    }

    /// @dev 定数の値読み出しはpureを指定
    function getFeeling() public pure returns (string memory) {
        return feeling;
    }

    /// @dev constantが付いている状態変数の値は変更不可能
    // function changeFeeling(string memory newF) public returns (string memory) {
    //     feeling = newF;
    //     return feeling;
    // }

    /// @dev immutable(min)の値読み出しはpureを指定
    function getMin() public pure returns (uint) {
        return min;
    }
    /// @dev immutable(min)の値は変更不可
    // function changeMin(uint newM) public returns (uint) {
    //     min = newM;
    //     return min;
    // }

}
