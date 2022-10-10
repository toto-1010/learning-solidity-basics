// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title 色々な多重継承の扱いを学ぼう
 */

    /*
    継承階層図
            A(ベース)
           / \
          B   C f()なし
           \ /   
           D,E <- 並行なBとCを継承する場合、どちらを先に探索するか(親にするか)継承元が指定する必要がある
    */

import "hardhat/console.sol";

/// ベースコントラクトを継承した複数のコントラクトをさらに継承する場合
contract A{
    function f() public virtual {
        console.log("A");
    }
}

contract B is A {
    function f() public virtual override {
        console.log("B");
    }
    function bF() public pure returns (uint) {
        return 1;
    }
}

contract C is A {
    function cF() public pure returns (uint) {
        return 2;
    }
}

/// @dev Dに近いコントラクトをCにする場合

/// @dev Eに近いコントラクトをBにする場合
// AはC, Bから継承しているため記述を省いて良い
