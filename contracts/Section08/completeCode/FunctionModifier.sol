// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title FunctionModifier を学ぼう
 * 宣言的な方法でファンクションのセマンティクス（意味づけ）を修正するために使用する
 * 例えば、modifierを使用すると、ファンクションの内容を実行する前に自動的に条件をチェックすることができる(以下onlyOwner)
 * modifierは継承可能で、かつオーバーライド可能※継承(InheritanceX)参照
 */
contract FunctionModifier {
    address public owner;
    uint public num;
    /// @dev クエリ、トランザクション発行者アドレスがこのコントラクトのownerであることをチェック
    modifier onlyOwner {
        require(owner == msg.sender, "not owner");
        _;
    }

    /// @dev コントラクト作成時のデプロイアカウントをownerに設定する
    constructor() {
        owner = msg.sender;
    }

    /// @dev ownerだけしか状態変数numを変更できない
    function changeNum(uint newNum) public onlyOwner returns (uint) {
        num = newNum;
        return num;
    }

}
/**
 * @dev modifierは継承して上書き定義可能
 */
contract Modifiers {
    /// @dev ETH(msg.value)を指定しているかチェック
    modifier checkValue(uint value_) virtual {
        require(value_ > 0, "Specify ETH greater than 0");
        _;
    }    
}

// modifierも継承できる
contract A is Modifiers{
    uint public num;

    modifier checkValue(uint value_) override {
        require(value_ > 1 ether, "Specify ETH greater than 1 Ether");
        _;
    }   

    function changeNum(uint newNum) public payable checkValue(msg.value) returns (uint) {
        num = newNum;
        return num;
    }    
}

