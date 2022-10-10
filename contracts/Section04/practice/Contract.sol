// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Contract Typeを学ぼう
 * 全Contractはそれ自身の型を定義する
 * Address型に明示的に変換できる
 * Contract型のローカル変数を宣言できる（MyContract c）
 * Contractをインスタンス化することができる(new)
 */
contract Contract {
    /// @dev constructorやfunctionにpayableを付与、宣言すると、コントラクトはETHを受け取れるようになる


    /// @dev Addressコントラクトの型情報(type)から名前を取得

    /** 
     * @dev Addressコントラクトの型情報(type)から作成コードを取得
     * creationCodeはスマートコントラクトのコンストラクタロジックとコンストラクタパラメータを含む
     */


    /** 
     * @dev Addressコントラクトの型情報(type)からランタイムコードを取得
     * runtimeCodeはオンチェーンに保存されるコード
     * このコードには、コントラクトのコンストラクタ・ロジックやコンストラクタ・パラメータは含まれない
     */

    /// @dev thisは現コントラクト(Contract)を意味する

    /// @dev 現コントラクトを破棄し、その資金を与えられたアドレスに送る。本当に削除されるのはトランザクション終了時。

    /// @dev コントラクト型（MyContract c）のローカル変数を定義し、Addressコントラクトのファンクションを実行
    
    /// @dev コントラクトのインスタンス化
    // 別途改めて扱う
 
}

/** 
 * @title Address Typeを学ぼう
 */
contract Address {
    string public ownerName;

    constructor(string memory ownerName_) {
        ownerName = ownerName_;
    }

    /// @dev msg.senderはクエリ/トランザクション元アカウントアドレスが入っているグローバル変数
    address public fromAddr = msg.sender;

    /// @dev アカウントアドレス(EOA)の所有ETHを取得
    function getBalance() public view returns (uint256) {
        uint256 balance = fromAddr.balance;
        return balance;
    }
    /// @dev コントラクトのバイトコードを取得
    function getByteCode() public view returns (bytes memory) {
        return address(this).code;
    }

    /** 
     * @dev ETH送金 transfer/send/callの違い
     * transfer:宛先がコントラクトのアドレスである場合、
     * そのコード (Receive Ether Functionまたは Fallback Functionが存在すれば実行される
     * この実行がガス欠になったり、何らかの形で失敗した場合、
     * Ether転送は元に戻り、現在のコントラクトは例外を発生させて停止する
     *
     * send:transferの低レベルファンクション。実行に失敗した場合、現在のコントラクトは例外で停止しないが、sendはfalseを返す
     * 安全なEther転送を行うには、常にsendの戻り値を確認し、transferを使用するか、
     * より良い方法として受信者がお金を引き出すwithdrawパターンを使用する
     *
     * call:ABIに準拠しないコントラクトとのインタフェースや、エンコーディングをより直接的に制御するために用意されている。
     * これらはすべて1バイトのメモリパラメータを取り、成功条件（bool）と返されたデータ（バイトメモリ）を返す
     */    

    /// @dev 宛先アドレスにtransferでETHを移転(移転の場合send/callよりもtransferを使おう)
    function transfer(address payable to) public payable {
        to.transfer(msg.value);
    }

    /// @dev 宛先アドレスにsendでETHを移転
    function send(address payable to) public payable returns (bool) {
        return to.send(msg.value);
    }

    /// @dev 宛先アドレスにcallでETHを移転
    function call(address payable to) public payable returns (bool, bytes memory) {
        return to.call{value: msg.value}("");
    }
}
