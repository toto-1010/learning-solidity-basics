// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Data Location を学ぼう
 *
 * すべてのReference Types(参照型)には、それがどこに格納されるかについての「データロケーション」という指定が必要。
 *
 * データロケーション : storage, memory, calldataの３つが指定可能
 * storage : コントラクトが持つストレージに保存され、永続的。読み書き可能
 * memory  : メモリ内に格納され、保持期間はファンクション実行中のみ。読み書き可能
 * calldata: memoryと同じくメモリ内に格納され、保持期間も一時的。読み取りのみで変更不可。
 *           externalのVisibilityがついたファンクションのみで指定可能
 *
 * 変数への値の代入は、参照(実際のデータへのアドレス情報)を与えるか、独立したコピーを作成するかのどちらかで行われる
 * storage, <=> memory,calldata : 値そのもののコピーを渡す
 * memory <=> memory : 値への参照のコピーを渡す
 * storage => local storage : 値への参照のコピーを渡す
 ＊ ※local storage : 関数内で定義された変数のこと
 * storageへの他の割り当ては常に値そのもののコピーを渡す
 */
contract DataLocation {

    // 状態変数はstorage
    struct Character {
        string name;
        uint level;
    }

    Character[] public characters;

    string public a;
    string public b;
    string public c = "ccc";

    function setA() public view returns (string memory,string memory) {
        // storage, <=> memory,calldata : 値そのもののコピーを渡す
        string memory aa = a;
        // aとaaはそれぞれ独立しているので、aは変更されない
        aa = "hoge";
        // 元の状態変数定義の初期設定の値を返す
        return (a,aa);
    }

    function addCharacter(string memory name_, uint level_) public {
        // memory <=> memory : 値への参照のコピーを渡す
        Character memory character = Character(name_, level_);
        Character memory characterChanged = character;

        /*
           targetData <= character
               ^
               |
        characterChanged
         */
        characterChanged.name = "aaa";

        // 状態変数の新しい配列要素に追加
        characters.push(character);
    }

    function setC() public returns (string memory) {
        //  storage => local storage : 値への参照のコピーを渡す
        //  ※local storage : 関数内で定義された変数のこと 
        string storage d = c;

        c = "222";
        return d;        
    }
}
