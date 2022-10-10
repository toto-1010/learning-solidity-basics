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


abstract contract AbstractAddSub {
    // 状態変数定義が可能
    uint public num;

    // constructor定義が可能
    constructor(uint num_) {
        num = num_;
    }

    // ファンクションと実行内容定義が可能
    function add(uint a_) public view returns (uint) {
        return a_ + num;
    }

    // ファンクション実行内容が未定義でも定義可能
    function setNum(uint num_) public virtual returns (uint);
    function sub(uint a_) public view virtual returns (uint);
}

contract A is AbstractAddSub {
    constructor(uint num_) AbstractAddSub(num_) {}

    // 継承先でファンクション実行内容の定義が可能
    function setNum(uint num_) public override returns (uint) {
        num = num_;
        return num;
    }

    function sub(uint a_) public view override returns (uint) {
        require(a_ >= num, "a_ >= num");
        return a_ - num;
    }

    // 追加ファンクション定義が可能
    function mul(uint a_) public view returns (uint) {
        return a_ * num;
    }
}
