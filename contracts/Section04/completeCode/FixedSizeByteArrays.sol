// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Fixed-size byte arrays を学ぼう
 * 固定的なサイズのByte配列はValue Typesである(bytes1,bytes2,bytes3,...,bytes32)
 * https://docs.soliditylang.org/en/v0.8.17/types.html#fixed-size-byte-arrays 
 * 一方、 bytes型やstring型は動的にサイズを決めるByte配列として扱われ、Reference Typesに属する（Value Typesではない）
 * https://docs.soliditylang.org/en/v0.8.17/types.html#dynamically-sized-byte-array
 */
contract FixedSizeByteArrays {
    /// @dev bytes1型定義
    bytes1 a = 0x73; // [01110011]
    bytes1 b = 0xb5; // [10110101]

    /// @dev bytes2型定義
    bytes2 c = 0xb5d2; //  [10110101][11010010]


    /// @dev 比較
    bool public comp1 = (a == b);
    bool public comp2 = (a <= b);
    bool public comp3 = (a < b);
    bool public comp4 = (a != b);
    bool public comp5 = (a >= b);
    bool public comp6 = (a > b);


    // @dev ビット演算
    bytes1 public bop1 = a & b;//[00110001]
    bytes1 public bop2 = a | b; //[11110111]
    bytes1 public bop3 = a ^ b; //[11000110]
    bytes1 public bop4 = ~a;    //[10001100]

    // @dev シフト演算
    // 左シフト
    // [01110011] -> [11100110]    
    bytes1 public blshift = (a << 1);

    // 右シフト
    // [01110011] -> [00111001]    
    bytes1 public brshift = (a >> 1);


    // @dev インデックスアクセス
    bytes1 public idx1 = c[0];
    bytes1 public idx2 = c[1];


    // @dev メンバーファンクション
    bytes4 hoge = 0x484F474F;
    function getLength() public view returns (uint) {
        return hoge.length;
    }

}
