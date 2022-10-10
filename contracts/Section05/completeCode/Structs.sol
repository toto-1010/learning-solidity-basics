// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Structs Type を学ぼう
 * Reference Typesに属する
 * Struct(構造体)の形で新しい型を定義できる、複数の変数をグループ化することができるカスタムタイプ
 * 構造体はそれ自身の型のメンバを含むことはできないが、構造体自体をMapping型のメンバの値型にしたり(Mapping(uint=>StructA))、
 * その型の動的なサイズの配列(以下Member[] public members)を含むことができる
 */
contract Structs {
    // 構造体定義
    struct Account {
        uint no;
        address addr;
    }

    struct Member {
        address addr;
        string name;
        uint amount;
    }

    Account public account = Account(1, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    // Account public account = Account({no: 1, addr: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4});

    Member[] public members; 

    function getAccount() external view returns (uint) {
        return account.no;
    }

    function setAccount() external {
        account.addr = msg.sender;
    }

    function memberPush(address addr_, string calldata name_, uint amount_) external {
        // オブジェクトで指定
        Member memory mem = Member({
            name: name_,
            amount: amount_,
            addr: addr_
        });
        members.push(mem);
    }

    function getMember(uint idx) external view returns (Member memory) {
        // structを返す(tupple)
        return members[idx];
    } 

    function changeName(uint idx, string calldata newName) external {
        // structのメンバーへのアクセス
        members[idx].name = newName;
    }

    function getName(uint idx) external view returns (string memory) {
        // structのメンバーへのアクセス
        return members[idx].name;
    }
}
