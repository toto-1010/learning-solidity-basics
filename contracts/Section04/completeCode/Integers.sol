// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Integers Typeを学ぼう
 */
contract Integers {
   /** 
    * @dev intX:符号付き整数, uintX:符号なし整数
    * int8〜int256/uint8〜uint256まで8単位
    * uintとintは、それぞれuint256とint256のエイリアス
    */
    int public i = 10;
    uint public u = 10;

    int256 public i256 = 10;
    uint256 public u256 = 10;

    /** @dev 8bit 上限値下限値確認
     *   int8 : -128 〜 127 / 10000000 - 01111111
     *  uint8 : 0    〜 255 / 00000000 - 11111111
     * https://note.cman.jp/convert/bit/
     */
     int8 public i8 = 127;
     int8 public im8 = -128;

     uint8 public u8 = 255;
     uint8 public uz8 = 0;

    /// @dev 比較演算子
    // 以下
    bool public comparison1 = (i <= 256);

    // 未満
    bool public comparison2 = (i < 256);

    // イコール
    bool public comparison3 = (i == 256);

    // イコールではない
    bool public comparison4 = (i != 256);

    // 以上
    bool public comparison5 = (i >= 256);

    // より大きい
    bool public comparison6 = (i > 256);


    /// @dev 型違いは比較できないので注意。比較したいときは型を合わせる
   //  bool public comparison7 = (i == u);
   bool public comparison8 = (uint(i) == u);
   

   /// @dev ビット演算子
   // AND : 両方のビットが共に1の場合だけ1
   int8 public iBitOpe1 = int8(12) & int8(7);
   // 00001100
   // 00000111
   // 00000100

   // OR : 両方のビットのどちらかが1の場合に1
   int8 public iBitOpe2 = int8(12) | int8(7);
   // 00001100
   // 00000111
   // 00001111

   // XOR : ビットの値が異なる場合にだけ1
   int8 public iBitOpe3 = int8(12) ^ int8(7);

   // NOT : ビット反転
   int8 public iBitOpe4 = ~int8(12);

   /// @dev シフト演算
   // 左シフト
   // 00001000 -> 00010000 
   int8 public ilshift = (8 << 1)   ;

   // 右シフト
   /// 00001000 -> 00000100    
   int8 public irshift = (8 >> 1)  ; 

   /// @dev 算術演算子
   int8 a = 8;
   int8 b = 6;

   // 足し算
   int8 public iadd = a + b;

   // 引き算
   int8 public isub = a - b;

   // 掛け算
   int8 public imul = a * b;

   // 割り算
   int8 public idiv = a / b;

   // 剰余 : aをbで割った余り
   int8 public imod = a % b;

   // べき乗
   int256 public ipower = 2 ** 10;

   /// @dev 数値リテラル
   int256 public million = 1_000_000;

   // 計算過程では小数が使える
   int256 public c = 3.2 + 1.8 + 4;

   /// @dev 小数は扱えない(結果が整数なら扱える)
   int256 public e = .2 * 5;


   /// @dev 三項演算子
   function ternary(int8 t) external pure returns (int8) {
      return ( 0 < t ? int8(t) : int8(-1));
   }
}
