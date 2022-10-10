// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title 変数 を学ぼう
 * Solidityには、3種類の変数がある
 * - 状態変数(State Variables)
 * - ローカル変数(Local Variables)
 * - グローバル変数(Global variables)
 */
contract Variables {
    // 状態変数 : コントラクトのストレージ領域に格納される変数(SSD/HDDへの永続的な保管イメージ)
    uint num = 1;

    function add(uint a_) public view returns (uint) {
        // a_はローカル変数 : データ保持期間は関数終了まで(memoryへの一時的な保管イメージ)
        return num + a_;
    }
    function getBlockTimeStamp() public view returns (uint) {
        //グローバル変数 : トランザクションやブロックチェーンのプロパティに関する情報を保持する特別な変数 
        return block.timestamp;
    }
}
