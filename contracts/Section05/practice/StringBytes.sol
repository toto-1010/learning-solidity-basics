// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title String/Bytes Type を学ぼう
 *
 * Reference Typeの型（Value Typeではない）
 * bytes型とstring型の変数は特殊な「配列」
 * bytesは、動的サイズのバイト配列
 * stringは、動的サイズのUTF-8エンコード文字列
 * https://docs.soliditylang.org/en/v0.8.17/types.html#dynamically-sized-byte-array
 *   ※一方、固定的なサイズのByte配列はValue Typeである(bytes1,bytes2,bytes3,...,bytes32)
 *     https://docs.soliditylang.org/en/v0.8.17/types.html#fixed-size-byte-arrays
 *
 */

contract StringBytes {
    // 状態変数定義の際にはData Location(storage|memory|calldata)の指定は不要

    /// @dev String(文字列)リテラルはダブルクォートまたはシングルクォートで記述する

    //  長い文字列を扱うときに便利なように、連続した複数の部分に分割することもできる

    /// @dev Unicode変換できる
    // Unicode一覧
    //   https://ja.wikipedia.org/wiki/Unicode%E4%B8%80%E8%A6%A7_0000-0FFF

    /// @dev Unicode UTF-8
    

    /// @dev 16進数リテラル
    // Unicode URT-8に変換

    /// @dev エスケープ文字\

    /// @dev Solidityにおける文字列比較

    /// @dev String/Bytes型のメンバーメソッド
    // Solidityにおける結合
    // String結合

    // Bytes結合

    // 文字列長の取得


    /// @dev String/Bytes型配列操作
    // 文字列の一部変更

    // 文字列を大文字に変換


    // 配列スライス

    // 固定長バイトの場合はValueTypeになるので、Data Locationの指定は不要
}
