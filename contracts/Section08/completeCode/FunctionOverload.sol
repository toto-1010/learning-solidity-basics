// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title FunctionOverload を学ぼう
 * コントラクトは同じ名前でパラメータの型が異なる複数のファンクションを持つことができる。
 * この処理を「オーバーロード」と呼ぶ
 * 継承されたファンクションにも適用される
 *
 * オーバーロードの例 ERC-721のsafeTransferFromファンクション
 *  https://eips.ethereum.org/EIPS/eip-721#specification
 *    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable;
 *    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;
 *
 * オーバーロードされたファンクションは、現在のスコープにあるファンクション宣言と、ファンクション呼び出しで
 * 与えられた引数をマッチさせることで選択される。
 * すべての引数が暗黙のうちに期待される型に変換される場合、ファンクションはオーバーロードの候補として選択される。
 * 候補が1つもない場合、解決は失敗します。
 */

contract FunctionOverload {

    function func(uint a) public pure returns (uint) {
        return a;
    }

    /// @dev 引数の型を変更してオーバーロード
    function func(uint8 a) public pure returns (uint8 b) {
        b = a;
        return b;
    }
    /// @dev 引数の数を増やしてオーバーロード
    function func(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}

/// @dev 継承された関数にも適用されることを確認する
contract A is FunctionOverload{
    function func(string memory a) public pure returns (string memory) {
        return a;
    }
}
