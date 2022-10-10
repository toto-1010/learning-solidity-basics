// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title newを使ったコード内からのContractの作り方 を学ぼう
 */

contract ContractA {
    /// @dev publicで定義 -> Getterファンクションを生成
    string public name;
    string public symbol;
    address public owner;

    constructor(string memory name_, string memory symbol_) {
        name = name_;
        symbol = symbol_;
        owner = msg.sender;
    }

    /// @dev トランザクション確認用ファンクション
    function changeName(string memory newName) external returns (string memory) {
        name = newName;
        return name;
    }
}

contract CreatingContract {
    ContractA public conA;

    function createContractA(string memory name_, string memory symbol_)
        public
        returns (ContractA)
    {
        // newで作成可能。constructor指定している場合は引数で渡す。インスタンス化
        conA = new ContractA(name_, symbol_);
        return conA;
    }
    /// @dev ContractAのGetterファンクションを実行
    function getName() external view returns (string memory) {
        return conA.name(); 
    }
    /// @dev ContractAのGetterファンクションを実行
    function getSymbol() external view returns (string memory) {
        return conA.symbol(); 
    }

    /// @dev ContractAのGetterファンクションを実行
    function getOwner() external view returns (address) {
        return conA.owner(); 
    }

    /// @dev ContractAにトランザクション発行
    function callChangeNameF(string memory newName)
        external
        returns (string memory)
    {
        return conA.changeName(newName);
    }
}