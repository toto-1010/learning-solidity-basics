// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title コントラクト内の構造 を学ぼう
 * コントラクト内には以下のような宣言を含められる
 *  State Variables, Functions, Function Modifiers, Events, Errors, Struct Types and Enum Types.
 * さらに、コントラクトは他のコントラクトを継承できる(このコードでは扱わない)
 */
contract StructureOfAContract {
    /** 
     * @dev 状態変数定義
     * 値はコントラクト内のストレージ領域に永続的に保存される
     * 状態変数は、Constant(定数)またはImmutable(不変)として宣言することができる（別途解説）
     */

    /** 
     * @dev struct定義
     * 構造体は、複数の変数をグループ化することができるカスタムタイプ
     */

    // 定義した構造体に名前をつける


    /** 
     * @dev enum定義
     * 列挙型を使用すると、「定数値」セットを持つカスタム型を作成できる
     */


    /** 
     * @dev イベント定義
     * EVM(Ethereum Virtual Machine)のロギング機能とのインタフェース
     */


    /** 
     * @dev error定義
     * 失敗の状況に対して説明的な名前とデータを定義
     * revert 文で使用することができる
     */


    /** 
     * @dev constructor定義
     * コントラクトの作成時に実行され、コントラクトの初期化コードを実行することができる
     */



    /** 
     * @dev Functon Modifier定義
     * 宣言的な方法でファンクションのセマンティクス（意味づけ）を修正するために使用する
     */


    /** 
     * @dev Function定義
     * ファンクションはコード内の実行可能な機能単位
     * 引数や戻り値、Visibility(可視性)、modifierなどをファンクションヘッダーに追記できる
     * スマートコントラクトへのアクセスには大きく以下２種類ある
     *  Call : 状態の読み取り。変更を伴わないのでブロックチェーン上に何もブロードキャストせずローカルで処理。
     *         基本的にはガス代であるEtherは消費しない
     *  Transaction : 状態の変更を伴う。ネットワークにブロードキャストされ、マイナーによって処理され、有効であればブロックチェーン上に公開される。
     *                ガス代としてEtherを消費する
     */
    // ファンクション定義 Call
 

    // ファンクション定義 Transaction

}
