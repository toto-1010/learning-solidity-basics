// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Inheritance(継承)を学ぼう
 * 継承したFunctionやFunctino Modifierは再定義(オーバーライド)できる
 *   継承元で`virtual`を使ってファンクションなどの再定義を許可し、継承先で`override`を使ってオーバーライドできる
 * Solidityは多重継承をサポートしている
 * 継承元(親)のファンクションを実行する場合は、super.を使って内部的に呼び出せる。例：super.f()
 */
    /*
    継承階層図
                     Owner
                     /   \
                    /     \
          Inheritance1  Inheritance2
                             \   
                        Inheritance3 
    */


contract Owner {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    /// @dev modifierオーバーライド virturalでオーバーライドを許可
    modifier limited() virtual {_;}

    /// @dev functionオーバーライド virturalでオーバーライドを許可
    function f(uint a_, uint b_) public view virtual limited returns (uint) {
        return a_ + b_;
    }
}

contract Inheritance1 is Owner {
    /// @dev modifierオーバーライド overrideでオーバーライド
    modifier limited() override {
        require(owner == msg.sender, "only owner");
        _;
    }

    /// @dev functionオーバーライド modifierもオーバーライドされている
    function f(uint a_, uint b_) public view override limited returns (uint) {
        return a_ * b_;
    }
}


contract Inheritance2 is Owner {
    /// @dev virturalとoverride両方指定可能
    function f(uint a_, uint b_) public view virtual override limited returns (uint) {
        return a_ - b_;
    }    
}

contract Inheritance3 is Inheritance2 {
    /// @dev superでInferitance2コントラクトのf()を実行
    function f(uint a_, uint b_) public view override limited returns (uint) {
        require(a_ > b_, "a must be a number greater than b");
        return super.f(a_, b_);
    }    
}
