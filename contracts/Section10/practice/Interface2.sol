// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Interface を学ぼう
 * チェーン上にある既存のスマートコントラクトのファンクションcallにinterfaceを利用する方法
 *  1.interfaceで接続先のスマートコントラクトのファンクションヘッダーを定義
 *  2.接続先のスマートコントラクトのアドレスを指定(interface定義と紐付け)
 *  3.ファンクションcall
 */



/// @dev interfaceを継承していなければ全てのファンクションを定義する必要はない
