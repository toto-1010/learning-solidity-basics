// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title ABI Encoding and Decoding Functions を学ぼう
 * コントラクトアプリケーションバイナリインターフェース（ABI）は、ブロックチェーンの外側からとコントラクト間の
 * 相互作用の両方において、イーサリアムエコシステム内のコントラクトと対話するための標準的な方法のこと
 * データは、以下のABI仕様に記載されているように、そのタイプに従ってエンコードされる
 * https://docs.soliditylang.org/en/v0.8.17/abi-spec.html#contract-abi-specification
 */
contract ABIEncodeDecodeFunction {
    // abi.encode()とabi.encodePacked()の違い
    // 「Solidity v0.5.0 Breaking Changes」より抜粋
    // ABIエンコーダーが、外部関数呼び出しやabi.encodeで使用されるとき、 calldata（msg.dataと外部関数パラメータ）からの
    // バイト配列と文字列を 適切にパディングするようになった。パディングなしのエンコーディングには、abi.encodePackedを使用してください。
    //   https://docs.soliditylang.org/en/latest/050-breaking-changes.html#semantic-only-changes

    // encodeする。パディングあり
    function encode(string memory s1_, string memory s2_) public pure returns (bytes memory) {
        return abi.encode(s1_, s2_);
    }

    // Solidity は非標準の packed モードをサポート。パディングなし
    function encodePacked(string memory s1_, string memory s2_) public pure returns (bytes memory) {
        return abi.encodePacked(s1_, s2_);
    }
    // abi.encode()の結果をdecodeする
    function decode(bytes memory encodedData) public pure returns (string memory, string memory) {
        (string memory s1, string memory s2) = abi.decode(encodedData, (string, string));
        return (s1, s2);
    }
}
