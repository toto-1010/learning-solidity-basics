// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Returning Multiple Values を学ぼう
 */
contract ReturningMultipleValues {
    // 複数の戻りを指定
    function multipleReturn() internal pure returns (uint, string memory, bool) {
        return (1, "hoge", true);
    }

    // ファンクションの複数の戻り値を受け取る
    function callMultipleReturn() public pure returns (uint, string memory, bool) {
        (uint a, string memory b, bool c)  = multipleReturn();
        return (a, b, c);
    }

    // ファンクションの複数の戻り値から必要なものだけ抽出
    function throwAwayReturnValue() public pure returns (uint, bool) {
        (uint a, , bool c) = multipleReturn();
        return (a, c);
    }

    /// @dev Function return variables（関数の戻り値変数）を利用した複数return
    function add(uint a_, uint b_) public pure returns (uint mulNum, uint sumNum) {
        /// @dev returnのためだけに使う変数は型の定義不要
        sumNum = a_ + b_;
        mulNum = a_ * b_;
    } 
     
}
