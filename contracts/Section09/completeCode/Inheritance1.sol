// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Inheritance（継承）を学ぼう
 * Constructor、Function、状態変数(constant/immutable含む)、Event、Function Modifierなどを継承することができる
 */

    /*
    継承階層図
                      A
                     / \
                    /   \
          Inheritance1  Inheritance2
    */

contract A {
    /// @dev 状態変数定義
    uint public num;
    uint public immutable startTime = block.timestamp;
    address public immutable owner;
    string public constant learning = "Solidity";

    /// @dev Event定義
    event ChangeNum(address indexed from, uint num);

    /// @dev Function Modifier定義
    modifier onlyOwner {
        require(owner == msg.sender, "not owner");
        _;
    }

    /// @dev Constructor定義
    constructor() {
        owner = msg.sender;
    }

    /// @dev Function定義
    function add(uint a, uint b) public view onlyOwner returns (uint) {
        return a + b;
    }
}

contract Inheritance1 is A {
    /// @dev 追加状態変数定義
    string public name;

    /// @dev 追加Event定義
    event SetName(
        address indexed from,
        string indexed name,
        string plang,
        uint start
    );

    /// @dev 追加Function定義    
    function changeName(string memory newName) public {
        name = newName;
        /// @dev 状態変数の継承確認 learning/startTime
        emit SetName(msg.sender, name, learning, startTime);
    }
}

contract Inheritance2 is A {
    /// @dev 状態変数の継承確認 num, Constructorで設定した状態変数確認owner, Eventの継承確認
    function changeNum(uint newNum) public onlyOwner {
        num = newNum;
        emit ChangeNum(owner, num);
    }

    /// @dev 継承時におけるOverload確認
    function add(uint a, uint b, uint c) public view onlyOwner returns (uint) {
        return a + b + c;
    }
}
