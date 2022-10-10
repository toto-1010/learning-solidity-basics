// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title EtherUnits を学ぼう
 * wei、gwei、etherの接尾辞を付けてEtherより単位の小さな呼称を指定することができる
 * weiが基準
 * 接尾辞が指定されてなければWeiが選択されているとみなされる
 * 1 ether = 10**18 wei
 * 1 gwei  = 10**9 wei
 * 
 */
contract EtherUnits {
    function checkWei() external pure returns (bool) {
        assert(1 wei == 10**0);
        return true;
    }
    function checkGwei() external pure returns (bool) {
        assert(1 gwei == 10**9);
        return true;
    }
    function checkEther() external pure returns (bool) {
        assert(1 ether == 10**18);
        return true;
    }
    function add1Wei(uint wei_) external pure returns (uint) {
        return (wei_ + 1 wei);
    }
    function add1Gwei(uint wei_) external pure returns (uint) {
        return (wei_ + 1 gwei);
    }
    function add1Ether(uint wei_) external pure returns (uint) {
        return (wei_ + 1 ether);
    }
}
