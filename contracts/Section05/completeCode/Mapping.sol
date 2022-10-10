// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Mapping Type を学ぼう
 */
contract Mapping {
    /** @dev
     * Mapping型は、KeyTypeと対応するValueTypeのペアで構成されるハッシュ テーブルとして機能する
     * mapping(_KeyType => _ValueType) という構文を使い、
     * Mapping型の変数は mapping(_KeyType => _ValueType) _VariableName という構文を使って宣言する
     *  例） mapping(uint => address) public member;
     * KeyTypeには、組み込みのValueType、bytesやstringを指定することができる。
     *   KeyTypeにはマッピング、構造体、配列型など、他のユーザー定義型や複雑な型は使用できない。
     *   一方ValueTypeには、マッピング、配列、構造体を含む任意の型を指定できる。
     * デフォルトの初期値について、仮想的にすべての可能なKeyが存在し、対応するValueについては
     ※ それぞれのKeyの型のデフォルト値にマッピングされる
     * キーデータはマッピングに保存されず、keccak256ハッシュのみが値を検索するのに使われる。
     * このため、マッピングには長さやキーや値が設定されているという概念がない。
     *  https://en.wikipedia.org/wiki/Hash_table
     */

    uint id;
    // Mapping型定義
    mapping(uint => address) public member;
    struct Profile {
        string name;
        uint level;
     }
    
    // Mapping型の_valueTypeにMapping型も指定可能
    mapping(uint => mapping(address=>Profile)) memberProfile;     

    function addMember() public {
        member[id] = msg.sender;
        id++;
    }     
    
    function setMemberProfile(uint id_,string memory name_, uint level_) public {
        require(member[id_] == msg.sender);
        memberProfile[id_][msg.sender] = Profile({name:name_, level:level_});
    }

    function getmemberProfile(uint id_) public view returns (Profile memory) {
        return memberProfile[id_][msg.sender];
    }

    function delMemberProfile(uint id_) public {
        require(member[id_] == msg.sender);
        // deleteで要素を削除
        delete memberProfile[id_][msg.sender];
    }
}
