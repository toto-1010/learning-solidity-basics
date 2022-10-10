// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Event を学ぼう
 * 概要
 *  SolidityのEventは、EVMへのロギング機能の上に抽象化された機能で、
 *  EVM(Ethereum Virtual Machine)のロギング機能とのインタフェースになっている
 *  クライアントアプリケーションはEthereumクライアントのRPCインターフェースを介してこれらのイベントをサブスクライブおよびlistenできる
 *  -> Solidityではただのログ、クライアントアプリではイベントという感覚がしっくりくる
 *  Contractコードの中からはEventで発行したログにはアクセスできない。
 *  継承可能
 * 
 * ログはどこに保存されているか？
 *  Receipt Trieにトランザクション結果（ステータスとログ）が含まれ、ツリー構造で管理される。
 *  データ自体はDBに保存され、ツリーのルートハッシュだけがブロックヘッダに格納される。
 *   https://www.lucassaldanha.com/content/images/2018/12/summary-final.png
 *    上記図の引用元) https://www.lucassaldanha.com/ethereum-yellow-paper-walkthrough-2/
 * 
 * ロギングするデータ
 *  indexed属性を基本的に最大3つまで付与できる(匿名イベントの場合は最大4つ)
 *  indexedのついたパラメータでフィルタリングすることができるようになる
 *  indexedを参照型に対して指定すると、 その値のKeccak-256ハッシュが代わりにtopicとして保存される。
 *  topicは特別なデータ構造のこと。それぞれ32バイトしか保持できない（なのでこれより長くなる可能性のある参照方はハッシュ化される）
 * 
 */

contract Event {
    /// @dev event定義
    event Log(address indexed from, string indexed s1, string s2, uint indexed u1, uint u2);

    /// @dev ロギングはemitで行う
    function LogF(
        string memory s1_,
        string memory s2_,
        uint u1_,
        uint u2_
    ) public {
        // Etherscanで確認
        // 例） 以下は、 hoge1,hoge2,10,20 を指定した場合の出力
        // 最大3つのインデックス付きトピック(ABIエンコード)があり、それぞれが配列の1項目
        // [topic0] 0x2d3f7340f1f4240652f3d84ff853755875ec812ee1e41c8cc07865a0cba88e77
        // [topic1] 0x000000000000000000000000ae2656f5595ffd799ae312d18e5b35e5a8c89f97 <- msg.sender
        // [topic2] 0x0d10ee9f79d1d0c6f4baf201735eb27346aac604b2c16fa5af5cea6e3dc5c0e9 <- s1_の値 hoge1
        // [topic3] 0x000000000000000000000000000000000000000000000000000000000000000a <- u1_の値 10
        // 
        // そして以下のような項目は、インデックス付けされていないトピックをすべて連結したもの（これもABIエンコード）。
        // 0000000000000000000000000000000000000000000000000000000000000040
        // 0000000000000000000000000000000000000000000000000000000000000014 <- u2_の値 20
        // 0000000000000000000000000000000000000000000000000000000000000005
        // 686f676532000000000000000000000000000000000000000000000000000000 <- s2_の値 hoge2

        emit Log(msg.sender, s1_, s2_, u1_, u2_);
    }

    function eventHash() public pure returns (bytes32) {
        // topics[0] はイベントのシグネチャのハッシュ
        // イベント宣言文字列をフラット化した keccak256 ハッシュで、この例では Log(address,string,string,uint256,uint256)
        return keccak256("Log(address,string,string,uint256,uint256)");
    }

    function stringHash(string memory s1_) public pure returns (bytes32) {
        // indexedを参照型に対して指定すると、 その値のKeccak-256ハッシュが代わりにtopicとして保存される。
        return keccak256(bytes(s1_));
    }

    function nonIndexedHash(string memory s2_, uint u2_) public pure returns(bytes memory) {
        // 例） 以下に、 hoge2,20 を指定した場合の出力を貼り付けて、上記LogF()内の
        // 「インデックス付けされていないトピック」と比較してみてください。
        // 0000000000000000000000000000000000000000000000000000000000000040
        // 0000000000000000000000000000000000000000000000000000000000000014
        // 0000000000000000000000000000000000000000000000000000000000000005
        // 686f676532000000000000000000000000000000000000000000000000000000
        // 
        return abi.encode(s2_,u2_);
    }

}
