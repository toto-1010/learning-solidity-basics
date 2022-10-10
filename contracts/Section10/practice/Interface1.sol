// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Interface を学ぼう
 * Interfaceの目的は、定義された一連のファンクション定義を強制し、特定のファンクションの実行内容を実装させること。
 * 例えば、EIP-721仕様に記載されているファンクション定義をinterfaceとして定義し、これを継承することで
 * 仕様への準拠を強制し、それぞれのファンクションの実装を定義できる。
 *   interface：safeTransferFromファンクション
 *    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable;
 *   functionの実装:safeTransferFromファンクションを実行すると、NFTが指定アカウントアドレスに移転される
 *    function safeTransferFrom(
 *        address from,
 *        address to,
 *        uint256 tokenId,
 *        bytes memory data
 *    ) public virtual override {
 *        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: caller is not token owner or approved");
 *        _safeTransfer(from, to, tokenId, data);
 *    }
 *
 * interfaceは、動作するために持っていなければならない全てのファンクションの定義。
 * interfaceファンクションヘッダーのみで定義する
 *
 * Function visivilityはexternalの指定が必要
 ※ 継承可能
 *   interface定義を別のinterfaceで継承可能
 *   contractで継承可能。継承先contractではinterfaceで定義した全ファンクションの定義が必要となる
 * virtualの指定はNG
 * 状態変数やconstructor、ファンクション実装の定義はできない
 */


/** @dev abstractとinterfaceの違い
 * - abstract contractはconstructorを実装できるが、interfaceはconstructorを持つことができない
 * - abstract contractでは定義できるが、interfaceでは状態変数を定義できない
 * - abstract contractは他のcontractやabstract contractを継承できるが、interfaceはcontractを継承できない。
 */

    // ファンクションヘッダーのみ({}内の実装定義不可)の定義

    // ファンクションヘッダーのみ({}内の実装定義不可)の定義

/// @dev 継承するcontractは、interfaceで定義された関数をすべて実装しなければならない

    /// @dev external -> publicに変更可能

    // 1つでも未実装にするとcompileエラー。以下コメントアウトしてみると確認できる
