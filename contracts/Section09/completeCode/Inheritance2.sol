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
  address public owner;

  constructor() {
    owner = msg.sender;
  }
}

contract ArgConstructor {
  string public name;

  constructor(string memory name_) {
    name = name_;
  }
}

/// @dev 継承したコントラクトにconstructor引数がない場合
contract Inheritance1 is NonArgConstructor {
  uint public price;

  constructor(uint price_) {
    price = price_;
  }
}

/// @dev 継承したコントラクトにconstructor引数がある、かつ定数で設定したい場合
contract Inheritance2 is ArgConstructor("MyFirstNFT") {
  uint public price;

  constructor(uint price_) {
    price = price_;
  }
}

/// @dev 継承したコントラクトにconstructor引数がある、かつ変数で設定したい場合
contract Inheritance3 is ArgConstructor {
  uint public price;

  constructor(uint price_, string memory name_) ArgConstructor(name_) {
    price = price_;
  }
}
