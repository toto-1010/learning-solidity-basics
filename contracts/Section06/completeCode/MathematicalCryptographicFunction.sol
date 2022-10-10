// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title 数学的なファンクション、ハッシュ化ファンクションを学ぼう
 */

contract MathematicalCryptographicFunction {
    // (x + y) % k
    function addMod(uint x_, uint y_, uint k_) external pure returns (uint) {
        return addmod(x_, y_, k_);
    }
    // (x * y) % k
    function mulMod(uint x_, uint y_, uint k_) external pure returns (uint) {
        return mulmod(x_, y_, k_);
    }
    /**
     * @dev Solidityでは、ハッシュ関数はまずデータの入力がABIエンコードされている必要がある
     * hash化するinput dataはハッシュ後の衝突を避けるためにabi.encodeを使った方が良い。
     */
    // Keccak-256ハッシュ
    function keccak256Hash1(string memory s1_, string memory s2_) external pure returns (bytes32,bytes memory) {
        return (keccak256(abi.encode(s1_, s2_)),abi.encode(s1_, s2_));
    }
    function keccak256Hash2(string memory s1_, string memory s2_) external pure returns (bytes32,bytes memory) {
        return (keccak256(abi.encodePacked(s1_, s2_)),abi.encodePacked(s1_, s2_));
    }
    // SHA-256ハッシュ
    function sha256Hash(string memory s1_, string memory s2_) external pure returns (bytes32) {
        return sha256(abi.encode(s1_, s2_));
    }
    // RIPEMD-160ハッシュ
    function ripemd160Hash(string memory s1_, string memory s2_) external pure returns (bytes20) {
        return ripemd160(abi.encode(s1_, s2_));
    }
}
