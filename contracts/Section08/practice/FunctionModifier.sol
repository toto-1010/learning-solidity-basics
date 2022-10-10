// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title FunctionModifier を学ぼう
 * 宣言的な方法でファンクションのセマンティクス（意味づけ）を修正するために使用する
 * 例えば、modifierを使用すると、ファンクションの内容を実行する前に自動的に条件をチェックすることができる(以下onlyOwner)
 * modifierは継承可能で、かつオーバーライド可能※継承(InheritanceX)参照
 */
contract FunctionModifier {

    /// @dev クエリ、トランザクション発行者アドレスがこのコントラクトのownerであることをチェック

    /// @dev コントラクト作成時のデプロイアカウントをownerに設定する

    /// @dev ownerだけしか状態変数numを変更できない

}
/**
 * @dev modifierは継承して上書き定義可能
 */
contract Modifiers {
    /// @dev ETH(msg.value)を指定しているかチェック

    }
}

// modifierも継承できる
contract A is Modifiers{

}
