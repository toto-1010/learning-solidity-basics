// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Arrays typeを学ぼう
 * Reference Typesに属する
 * Array（配列）には，コンパイル時に固定されたサイズを持つものと，動的なサイズを持つものがある
 * 固定サイズkで要素型Tの配列の型はT[k]と書き，動的サイズの配列はT[]と書く
 * 配列の要素は、Mapping型やStruct型を含め、どのような型でも良い
 * 状態変数配列にpublicのvisibilityを付与してGetterファンクションを作成できる。
 *   この場合、配列要素のインデックスが必須
 */
contract Arrays {
    /// @dev int/uint array
    // 配列定義
    // 固定長
    uint[2] public array1 = [1,2];

    // 配列要素は定義した型の要素が必要。以下は定義不可(-1はuintの範囲外)
    // uint[2] public arrayNG = [1, -1];
    // 1はuintXだと見なされるのでintに変換する必要がある
    int[2] public arrayConverted = [int(1), -1];

    /// 可変長
    uint[] public array2 = [1,2];

    // 二次元配列
    uint[2][3] public array3 = [[1,2],[3,4],[5,6]];

    // 配列要素の取り出し方
    uint[2] public fa3 = array3[0]; // [1,2]
    uint[2] public f = [fa3[1], fa3[0]]; // [2,1]

    // 配列要素の変更
    function changeArray1(uint index, uint num) public {
        array1[index] = num;
    }

    // 配列全体の取得
    function getArray() public view returns (uint[2][3] memory) {
        return array3;
    }
    
    // メンバーメソッド
    function length() public view returns (uint) {
        return array2.length;
    }

    function push(uint num) public {
        // array1は固定長なので定義した要素数を超えてpushできない
        // array1.push(num);
        // array2は可変長なのでpushできる
        array2.push(num);
    }

    function pop() public {
        // array2の最後の要素を取り出す
        array2.pop();
    }


    /**
     * @dev 動的な長さを持つメモリ配列は、new演算子で作成することができる
     * ストレージ配列とは異なり、メモリ配列のサイズを変更できない(例.push,.popは使用できない)
     * 必要なサイズをあらかじめ計算しておくか、新しいメモリ配列を作成して各要素をコピーする必要がある
     */
    function createDynamicMemoryArray() public pure returns (uint[] memory, uint[] memory) {
        uint[] memory a = new uint[](4);
        a[0] = 10;
        a[1] = 11;
        a[2] = 12;
        a[3] = 13;

        uint[] memory b = new uint[](5);
        b[0] = a[0];
        b[1] = a[1];
        b[2] = a[2];
        b[3] = a[3];
        b[4] = 14;

        return (a , b);                
    }
    
    /// @dev 配列スライス 引数例([1,2,3,4,5], 2)
    function getArraySlice(uint[] calldata array, uint index) external pure returns (uint[] memory, uint[] memory) {
        return (array[:index], array[:index]);
    }

    function getArraySlice2(uint[] calldata array) external pure returns (uint[] memory, uint[] memory) {
        return (array[1:3], array[4:6]);
    }

}
