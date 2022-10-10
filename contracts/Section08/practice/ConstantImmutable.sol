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

    /// @dev immutableは初期値なしでもOK。しかしその場合constructorでの初期値定義が必要
    // state visibilityでGetter Functionの生成と併用可能

    // string constant name;は初期化値が設定されていないのでcompileエラーとなる

    /// @dev 状態変数の値読み出しはviewを指定

    /// @dev constantではない状態変数の値は変更可能

    /// @dev 定数の値読み出しはpureを指定


    /// @dev constantが付いている状態変数の値は変更不可能

    /// @dev immutable(min)の値読み出しはpureを指定

    /// @dev immutable(min)の値は変更不可

}
