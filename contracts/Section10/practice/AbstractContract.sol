// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title AbstractContract を学ぼう
 * contractのテンプレートのようなもので、contractの定義とその実装を切り離し、拡張性を提供するもの
 * abstract contractは、それだけでデプロイできない
 * contractは、そのファンクションの少なくとも1つが実装されていない場合、
 * またはすべてのconstructorに引数を与えていない場合に、abstractを指定する必要がある
 * (例 interfaceを継承したcontractで全てのファンクションを実装していない場合など)
 * abstract contractはinterfaceと似ているが、interfaceの方が宣言できる内容がより限定されている
 */

/** @dev abstractとinterfaceの違い
 * - abstract contractはconstructorを実装できるが、interfaceはconstructorを持つことができない
 * - abstract contractでは定義できるが、interfaceでは状態変数を定義できない
 * - abstract contractは他のcontractやabstract contractを継承できるが、interfaceはcontractを継承できない。
 */


    // 状態変数定義が可能

    // constructor定義が可能

    // ファンクションと実行内容定義が可能

    // ファンクション実行内容が未定義でも定義可能


    // 継承先でファンクション実行内容の定義が可能

    // 追加ファンクション定義が可能


