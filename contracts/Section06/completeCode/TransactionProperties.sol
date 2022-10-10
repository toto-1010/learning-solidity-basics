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
  function getData(uint a_) 
    external 
    pure 
    returns (
      uint,
      bytes calldata,
      bytes4
    ) {
      return (a_, msg.data, msg.sig);
    }

  // トランザクションValue
  function getValue() external payable returns (uint) {
    return msg.value;
  }
  
  /** @dev msg.senderとtx.originの違い
    *  A(EOA)->B(CA)->C(CA)の順番でCallするとき、Cの内部では msg.senderはBになる。
    *  tx.originはトランザクションの発行元なのでAになる。
    */
  // msg.sender：ファンクションを発行したアドレス（EOA/ContractAddress）
  function getSender() external returns (address, address) {
    // return msg.sender;
    B contractB = new B();
    return (contractB.bGetSender());
  }

  // tx.origin：トランザクション発行アドレス(EOA)
  // 以下のようにアクセス制限に使う場合は非推奨（よく理解して使わないとバグに繋がる）
  // address fromAddr;
  // constructor() {
  //     fromAddr = msg.sender;
  // }
  // function test() external {
  //   require(tx.origin == fromAddr);  ★
  //   〜何かしらの処理〜
  // }
  // 
  function getOrigin() external returns (address, address) {
    // return tx.origin;
    B contractB = new B();
    return (contractB.bGetOrigin());
  }
}

contract B {
  function bGetSender() public returns (address, address) {
    C contractC = new C();
    return (contractC.cGetSender(), address(this));
  }
  function bGetOrigin() public returns (address, address) {
    C contractC = new C();
    return (contractC.cGetOrigin(), address(this));
  }

}

contract C {
  /** @dev msg.senderとtx.originの違い
    *  A(EOA)->B(CA)->C(CA)の順番でCallするとき、Cの内部では msg.senderはBになる。tx.originはトランザクションの発行元なのでAになる。
    */
  // msg.sender：ファンクションを発行したアドレス（EOA/ContractAddress）
  function cGetSender() public view returns (address) {
    return msg.sender;
  }
  // tx.origin：トランザクション発行アドレス(EOA)
  function cGetOrigin() public view returns (address) {
    return tx.origin;
  }
}
