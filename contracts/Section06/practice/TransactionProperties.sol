// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title TransactionProperties を学ぼう
 * グローバルな名前空間に常に存在し、主にブロックチェーンに関する情報を提供したり、
 * 汎用的なユーティリティ関数として使用される特殊な変数や関数がある
 * グローバル変数と呼ばれる
 * tx.gaspriceは割愛します。リストは以下をご確認ください。
 *  https://docs.soliditylang.org/en/v0.8.17/units-and-global-variables.html#block-and-transaction-properties
*/
contract TransactionProperties {
  // msg.data: トランザクションデータ
  // msg.sig: トランザクションデータの最初の4バイト


  // トランザクションValue

  
  /** @dev msg.senderとtx.originの違い
    *  A(EOA)->B(CA)->C(CA)の順番でCallするとき、Cの内部では msg.senderはBになる。tx.originはトランザクションの発行元なのでAになる。
    */
  // msg.sender：ファンクションを発行したアドレス（EOA/ContractAddress）

  // tx.origin：トランザクション発行アドレス(EOA)
  // 以下のようにアクセス制限に使う場合は非推奨（よく理解して使わないとバグに繋がる）
  // address fromAddr;
  // constructor() {
  //     fromAddr = msg.sender;
  // }
  // function test() external {
  //   require(tx.origin == msg.sender);  ★
  //   〜何かしらの処理〜
  // }
  // 
}

contract B {

}

contract C {
  /** @dev msg.senderとtx.originの違い
    *  A(EOA)->B(CA)->C(CA)の順番でCallするとき、Cの内部では msg.senderはBになる。tx.originはトランザクションの発行元なのでAになる。
    */
  // msg.sender：ファンクションを発行したアドレス（EOA/ContractAddress）

  // tx.origin：トランザクション発行アドレス(EOA)

}
