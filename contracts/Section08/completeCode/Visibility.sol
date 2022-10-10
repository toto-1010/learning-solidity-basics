// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title State Variable Visibility(Getter Function) と Function Visibilityを学ぼう
 * アクセス制御の１機能で、日本語では、「可視性」。スマートコントラクトの外から、もしくは中からのアクセス可否を指定できる
 * 状態変数(State Variable)とファンクションに対して設定可能
 */
// Function Visibility
/** 
 * @dev コントラクトの内外からのアクセスに対して制御をかけることができる
 * 以下Visibilityについては改めて解説する
 *  public   : コントラクトの外部からも内部からもアクセス可能
 *  external : コントラクトの外部のみアクセス可能
 *  internal : コントラクトの内部のみアクセス可能
 *  private  : コントラクトの内部のみアクセス可能だが、継承先でアクセスできない
 * 
 * visibilityがpublicであればthis.f()外部アクセスとf()内部アクセスどちらでも実行可能
 * visibilityをexternalに変更すると、f()で内部から実行できなくなる
 * visibilityをinternal|privateに変更すると、this.f()で外部から実行できなくなる
 */ 

contract contractA {
    // publicな状態変数に対してコンパイラがGetterファンクションを自動生成する(Setterは自動作成しない)
    // Getterファンクションは別で解説
    string public publicVariable = "publicVariable";
    // internalは省略可能(つまり、状態変数のデフォルト設定)
    // internalな状態変数は継承先でアクセスできる※継承(Inferitance)は別で解説
    string internal internalVariable = "internalVariable";
    // privateな状態変数は継承先でアクセスできない
    string private privateVariable = "privateVariable";

    function publicFunction() public pure returns (uint) {
        return 1;
    }
    function externalFunction() external pure returns (uint) {
        return 2;
    }
    function internalFunction() internal pure returns (uint) {
        return 3;
    }
    function privateFunction() private pure returns (uint) {
        return 4;
    }
}

// contractAを継承
contract Visibility is contractA {
    // publicファンクションは継承先でもコントラクト内外両方からcallできる
    function callPublicFunction() public pure returns (uint) {
        // コントラクト外からのファンクションcall
        // return this.publicFunction();

        // コントラクト内からのファンクションcall
        return publicFunction();
    }

    // externalファンクションは継承先でもコントラクト外からのみしかcallできない
    function callExternalFunction() public view returns (uint) {
        // コントラクト外からのファンクションcall
        return this.externalFunction();
        // コントラクト内からのファンクションcall
        // return externalFunction();
    }

    // internalファンクションは継承先でもcallできる
    function callInternalFunction() public pure returns (uint) {
        return internalFunction();
    }

    // privateファンクションは継承先ではcallできない
    // function callPrivateFunction() public pure returns (uint) {
    //     return privateFunction();
    // }


    // publicな状態変数は継承先でもアクセスできる
    function returnPublicVariable() public view returns (string memory) {
        return publicVariable;
    }

    // internalな状態変数は継承先でもアクセスできる
    function returnInternalVariable() public view returns (string memory) {
        return internalVariable;
    }

    // privateな状態変数は継承先ではアクセスできない
    // function returnPrivateVariable() public view returns (string memory) {
    //     return privateVariable;
    // }
}
