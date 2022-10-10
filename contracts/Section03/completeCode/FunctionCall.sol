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
    function pub1(uint a, uint b) public pure returns (uint) {
        return _itl1(a,b);
    }

    /// @dev Internalファンクションは外部からはCallできない。内部からのみCallできる
    function _itl1(uint a, uint b) internal pure returns (uint) {
        return (a + b);
    }

    /// @dev External Function Call
    function ext1(uint a, uint b) external pure returns (uint) {
        return (a + b);
    }

    /// @dev PublicファンクションからPrivateファンクションをCallできる
    function pub2(uint a, uint b) public pure returns (uint) {
        return _pri2(a,b);
    }

    function pub3(uint a, uint b) public pure returns (uint) {
        return (a * b);
    }

    /// @dev PrivateファンクションからPublicファンクションをCallできる
    function _pri2(uint a, uint b) private pure returns (uint) {
        return pub3(a,b);
    }

    /// @dev ExternalファンクションはInternalファンクションからCallできない
    function _itl3(uint a, uint b) internal view returns (uint) {
        // return ext1(a,b);
        return this.ext1(a,b);
    }
    function pub4(uint a, uint b) public view returns (uint) {
        return _itl3(a,b);
    }
   

    /// @dev 引数の指定
    function _itl4(uint a, uint b) internal pure returns (uint) {
        return (a ** b);
    }

    //未使用の仮引数は名前を省略できる
    function pub5(uint a_, uint b_, uint) public pure returns (uint) {
        return _itl4({b: b_, a: a_});
    }
}
