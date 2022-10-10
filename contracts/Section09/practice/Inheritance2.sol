// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title 継承時のconstructorの扱いを学ぼう
 */
    /*
    継承階層図
      NonArgConstructor     ArgConstructor
              |                 /    \
              |                /      \
              |               /        \
              |              /          \
              |             /            \
        Inheritance1   Inheritance2  Inheritance3         
    */


contract NonArgConstructor {
}

contract ArgConstructor {
}

/// @dev 継承したコントラクトにconstructor引数がない場合

/// @dev 継承したコントラクトにconstructor引数がある、かつ定数で設定したい場合

/// @dev 継承したコントラクトにconstructor引数がある、かつ変数で設定したい場合
