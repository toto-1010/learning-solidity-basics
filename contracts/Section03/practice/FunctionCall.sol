// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Function Call を学ぼう
 * 以下Visibilityについては改めて解説する
 *  public   : コントラクトの外部からも内部からもアクセス可能
 *  external : コントラクトの外部のみアクセス可能
 *  internal : コントラクトの内部のみアクセス可能
 *  private  : コントラクトの内部のみアクセス可能だが、継承先でアクセスできない
 */
contract FunctionCall {
    /// @dev Publicファンクションは外部からCallできる

    /// @dev Internalファンクションは外部からはCallできない。内部からのみCallできる

    /// @dev External Function Call

    /// @dev PublicファンクションからPrivateファンクションをCallできる

    /// @dev PrivateファンクションからPublicファンクションをCallできる

    /// @dev ExternalファンクションはInternalファンクションからCallできない


    /// @dev 引数の指定

    //未使用の仮引数は名前を省略できる

}