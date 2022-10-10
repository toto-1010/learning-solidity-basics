// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Enums Typeを学ぼう
 * Enum(列挙)型は、Solidity でユーザー定義型を作成する1つの方法
 * Enumを使用すると、「定数値」セットを持つカスタム型を作成できる
 * すべての整数型との間で明示的に変換可能
 */
contract Enums {
    /// @dev 列挙型でタスクステータスを定義
    enum TaskStatus { NotStarted, InProcess, Finished, Canceled }

    /// @dev TaskStatusの変数(status)を定義
    TaskStatus status;

    /// @dev 引数で受け取った値を設定する
    function setStatus(TaskStatus choice) external {
        status = choice;
    }

    /// @dev 現ステータスを返す(uintに変換できる)
    function getStatus() external view returns (uint) {
        return uint(status);
    }

    /// @dev 最初のステータスを返す
    function getSmallestStatus() external pure returns (TaskStatus) {
        return type(TaskStatus).min;
    }

    /// @dev 最後のステータスを返す
    function getLargestStatus() external pure returns (TaskStatus) {
        return type(TaskStatus).max;
    }

}
