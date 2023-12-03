// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Inheritance(継承)を学ぼう
 * 継承したFunctionやFunction Modifierは再定義(オーバーライド)できる
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
    /// @dev modifierオーバーライド virturalでオーバーライドを許可


    /// @dev functionオーバーライド virturalでオーバーライドを許可

}
    
    /// @dev modifierオーバーライド overrideでオーバーライド


    /// @dev functionオーバーライド modifierもオーバーライドされている


    /// @dev virturalとoverride両方指定可能


    /// @dev superでInferitance2コントラクトのf()を実行

