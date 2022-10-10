// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Error handling: Assert, Require, Revertを学ぼう
 * 
 * Solidity はエラーハンドリングとして状態を元に戻す例外処理を実行できる
 * 例外処理では、トランザクションで加えられたすべての状態変更を元に戻し、呼び出し元にエラーを知らせることが可能。
 * 例外処理には、エラーの理由やパニック時の例外コードというデータを呼び出し元に返すことができる。
 *
 * Error(string)型のエラーとPanic(uint256)型のエラーがある
 *  - Error(string)型のエラーは、通常のエラー
 *    例えば、ファンクション引数の値のバリデーションチェックでのエラー検出
 *  - Panic(uint256)型のエラーは、バグのないコードに存在してはならない類のエラーに使用されるもの
 *    例えば、0での割り算など。
 *
 * ファンクション
 *  - Error(string)型のエラーを発生させる : Require/Revert
 *  - Panic(uint256)型のエラーを生成を発生させる : Assert
 */


contract AssertRequireRevert {
    /**
　　    * @dev assertは、Panic(uint256)型のエラーを生成
     * Assert は、内部エラー(internal error)のテストと不変性のチェックにのみ使用します。
    　　* 内部エラー例）オーバーフロー検出や配列に対してk[-1]など負のインデックスでアクセスしたりなどの内部的なエラー(internal error)で使用すべき
 　　   * 正しく機能するコードは、たとえ無効な外部入力(例：引数の値)があったとしても、決してパニックを発生させるべきではない
     * 例外処理実行までに消費したガスは戻ってこないが、未消費のガスは戻る。
     *  「呼び出しに使用可能なすべてのガスを消費していましたが、Solidity 0.8.0 以降はそのようなことはありません。」
     *  以下のNoteを参照のこと
     *   https://docs.soliditylang.org/en/v0.8.17/control-structures.html#panic-via-assert-and-error-via-require
     *
     *
    　　* パニック例外コード一覧
     *   https://docs.soliditylang.org/en/v0.8.17/control-structures.html#panic-via-assert-and-error-via-require
     * パニック例外は，次のような場合に発生する。エラーデータとともに提供されるエラーコードは、パニックの種類を示す。
     *
     * 0x00 : 一般的なコンパイラ挿入型パニックに使用されます
     * 0x01 : falseと評価される引数でassertを呼び出した場合
     * 0x11 : 算術演算の結果、unchecked{ ... }ブロックの外でアンダーフローまたはオーバーフローが発生した場合。
     * 0x12 : ゼロで割ったりモジュロしたりする場合（例：5 / 0や23 % 0）
     * 0x21 : 大きすぎる値やマイナスの値をenum型に変換した場合
     * 0x22 : 正しくエンコードされていないストレージバイト配列にアクセスした場合
     * 0x31 : 空の配列に対して .pop() を呼び出した場合
     * 0x32 : 配列、bytesN、配列スライスを境界外または負のインデックスでアクセスした場合（i >= x.length または i < 0 の場合の x[i] など）
     * 0x41 : メモリを過剰に割り当てたり、大きすぎる配列を作成した場合
     * 0x51 : 内部関数型のゼロ初期化変数を呼び出した場合
     */

    uint public price = 1000;

    /**
    * @dev
    *  errorステートメントでエラー定義が可能。継承できるが、オーバーライドやオーバーロードは不可。
    *  このコメントにエラー理由を記述できる。
    *  このコメントはBlockchainに記録されないので、安価なエラー報告機能として活用できるメリットがある
    *  @param a_ number to be devided
    *  @param b_ divisor
    */
    error DivError(uint a_, uint b_);

    function assertF() external {
        for (uint i = 0; i < 100; i++) {
            price = i;
        }
        // price == 1000がtrueならOK, price != 0ならパニック型エラー
        assert( price == 1000 );

    }

    /**
　　    * @dev requireは、データを持たずにエラーを発生させるか、Error(string)型のエラーを発生させるかのどちらか。
    　　* 引数チェックなど実行時まで検出できない有効な条件を確保するために使用する
 　　   * 外部コントラクトの呼び出しによる入力や戻り値に対する条件チェックにも使うことがある
     * 例外処理実行までに消費したガスは戻ってこないが、未消費のガスは戻る。
    　　*/
    function requireF(uint n) external pure returns (uint) {
        require( n <= 10 , "out of range above 10");
        uint power = n ** 2;
        return power;
    }

    /** 
     * @dev revert()はError(string)型のエラーを発生させる
     * revertステートメントとrevertファンクションを使用して、直接revertをトリガーできる
     * 例外処理実行までに消費したガスは戻ってこないが、未消費のガスは戻る。
     */ 
    function revertF(uint a, uint b) external pure returns (uint, uint, uint) {
        if (b == 0) {
            // revertファンクション
            // a:1, b:0
            revert("enter a number greater than 0");
        } else if (a == 0) {
            // revertステートメント。errorステートメントとセット
            // a:0, b:1
            revert DivError(a, b);
        } else {
            // a:10, b:2
            return (a, b, a/b);

        }
    }
}
