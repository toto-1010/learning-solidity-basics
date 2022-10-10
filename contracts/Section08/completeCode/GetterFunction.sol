// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title GetterFunction を学ぼう
 * すべてのpublicな状態変数に対して、コンパイラはGetterファンクションを自動的に作成
 */
contract GetterFunction {
    /** 
     * @dev 状態変数は、宣言時に初期化できる
     */
    uint public num = 8;

    // Getterファンクションでは要素を指定して値を取得することになる
    uint[] public array = [1,2,3,4,5];

    // コントラクト内からのアクセスとコントラクト外からのアクセス方法
    function access(uint newNum) public returns (uint) {
        num = newNum;// Internal Access(State Variables Access)
        return this.num(); // external Access（Getter Function Access）
    }

    // 全要素を返したい場合は、Getterファンクションではなく明示的にファンクション作成すれば返せる
    function getArray() public view returns (uint[] memory) {
        return array;
    }
}

contract A {
    function f() public returns (uint) {
        GetterFunction gf = new GetterFunction();
        return gf.num(); // 状態変数numに対するGetterファンクションをcallして値を返す
    }
}
