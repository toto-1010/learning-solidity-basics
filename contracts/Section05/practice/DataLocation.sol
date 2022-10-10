// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Data Location を学ぼう
 *
 * すべてのReference Types(参照型)には、それがどこに格納されるかについての「データロケーション」という指定が必要。
 *
 * データロケーション : storage, memory, calldataの３つが指定可能
 * storage : コントラクトが持つストレージに保存され、永続的。読み書き可能
 * memory  : メモリ内に格納され、保持期間はファンクション実行中のみ。読み書き可能
 * calldata: memoryと同じくメモリ内に格納され、保持期間も一時的。読み取りのみで変更不可。
 *           externalのVisibilityがついたファンクションのみで指定可能
 *
 * 変数への値の代入は、参照(実際のデータへのアドレス情報)を与えるか、独立したコピーを作成するかのどちらかで行われる
 * storage, <=> memory,calldata : 値そのもののコピーを渡す
 * memory <=> memory : 値への参照のコピーを渡す
 * storage => local storage : 値への参照のコピーを渡す
 ＊ ※local storage : 関数内で定義された変数のこと
 * storageへの他の割り当ては常に値そのもののコピーを渡す
 */
contract DataLocation {

    // 状態変数はstorage

}
