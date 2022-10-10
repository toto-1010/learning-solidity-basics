// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title BlockProperties を学ぼう
 * グローバルな名前空間に常に存在し、主にブロックチェーンに関する情報を提供したり、
 * 汎用的なユーティリティ関数として使用される特殊な変数や関数がある
 * グローバル変数と呼ばれる
 * getBasefee、getGaslimit、gasLeft、getCoinbase、getDifficultyは割愛しています。
 * 全リストは以下をご確認ください。
 *  https://docs.soliditylang.org/en/v0.8.17/units-and-global-variables.html#block-and-transaction-properties
 */
contract BlockProperties {
    // チェーンID
    // 例）↓
    // Ethereum Main Network chainid:1, hex 0x1
    // Goerli Test Network	 chainid:5, hex 0x5
    // Matic(Poygon) Mainnet chainid:137, hex 0x89
    // Matic Testnet Mumbai	 chainid:80001, hex 0x13881
    function getChainId() external view returns (uint) {
        return block.chainid;
    }

    // ブロックナンバー
    function getBlockNumber() external view returns (uint) {
        return block.number;
    }

    // ブロックハッシュ
    function getBlockHash(uint blockNum_ ) external view returns (bytes32) {
        return blockhash(blockNum_);
    }

    // ブロックタイムスタンプ UNIXエポック（1970/1/1 00:00:00）からの秒数
    function getTimeStamp() external view returns (uint) {
        return block.timestamp;
    }

}
