// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Address Typeを学ぼう
 */
contract Address {


    /// @dev msg.senderはクエリ/トランザクション元アカウントアドレスが入っているグローバル変数
    address public fromAddr;

    constructor() {
        fromAddr = msg.sender;
    }

    /// @dev アカウントアドレス(EOA)の所有ETHを取得
    function getBalance() public view returns (uint256) {
        uint256 balance = fromAddr.balance;
        return balance;
    }

    /// @dev コントラクトのバイトコードを取得
    function getByteCode() public view returns (bytes memory) {
        return address(this).code;
    }

    /// @dev コントラクトのバイトコードハッシュを取得
    function getByteCodeHash() public view returns (bytes32) {
        return address(this).codehash;
    }


    /** 
     * @dev ETH送金 `address payable`型のメンバーメソッド：transfer/send/call
     * 前提：EOAだけでなく、コントラクトアドレスにもETHを送金することができる
     *     ここではEOAに対するETH送金を学ぶ。
     *     コントラクトへの送金については別途Receive Ether FunctionやFallback Functionの箇所で解説
     *
     * transfer:ガス欠になったり、何らかの形で失敗した場合、
     * Ether転送は元に戻り、現在のコントラクトは例外を発生させて停止する
     * ガス量:2300固定
     *
     * send:transferの低レベルファンクション。実行に失敗した場合、例外で停止しないが、sendはfalseを返すので、
     * 安全なEther転送を行うには、常にsendの戻り値をrequire(別途解説)などで確認すること、もしくはsendではなくtransferを使用する。
     * ガス量:2300固定
     *
     * call:他のコントラクトを呼び出すためのものだが、
     * 型チェック、関数の存在チェック、引数のパッキングをバイパスするため、この目的のために.call() を使うのは実は非推奨だが、
     * コントラクトに対してETHを送金する利用に限り推奨されている。
     * 戻り値としては、成功失敗の結果（bool）とcallで戻ってきたデータ(bytes memory)の２つ
     * ガス量:固定なし
     *
     * さらに良い方法として送金せず、受信者がお金を引き出すwithdrawパターンを使用するのが安全。
     */    

    // ETH送金のためには State Mutabilityの1つである payable の指定が必要↓
    // State Mutability
    /** 
     * @dev 何も指定しない/view/pure/payableを宣言することができる
     * 何も指定しない : 状態変数を変更したりするときに使う（ = トランザクション発行）
     * pure : 状態変数やグローバル変数にアクセスしない場合に指定。
     * view : 状態変数やグローバル変数を参照する場合に指定。状態を変更しないことが約束される。
     * payable : ETH送金などのときにはpayableの指定が上記に追加で必要
     */

    /// @dev transferでETHを移転
    function transfer(address payable to) public payable {
        to.transfer(msg.value);
    }

    /// @dev sendでETHを移転
    function send(address payable to) public payable returns (bool) {
        bool result = to.send(msg.value);
        require(result, "failed");
        return result;
    }

    /// @dev callでETHを移転
    function call(address payable to) public payable returns (bool, bytes memory) {
        (bool result, bytes memory data) = to.call{value: msg.value}("");
        require(result, "failed");
        return (result, data);
    }

}
