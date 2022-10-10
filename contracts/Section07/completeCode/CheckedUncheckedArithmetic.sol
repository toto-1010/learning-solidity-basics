// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title 算術演算のチェック、アンチェック を学ぼう
 * オーバーフローまたはアンダーフローとは、制限のない整数に対して算術演算を実行したときに、その結果の値が型の範囲外になること
 * Solidity0.8.0以降ではこのチェック機構がデフォルトでついている
 * このチェック機構は意図的に無効にすることができる
 */
contract CheckedUncheckedArithmetic {
    // a:1, b:255
    function checkedOverFlow(uint8 a, uint8 b) external pure returns (uint8) {
        // 加算結果が255を超えるとuint8型の範囲を超えるためオーバーフローとなりrevertされる
        return a + b;
    }

    // a:1, b:2
    function checkedUnderFlow(uint8 a, uint8 b) external pure returns (uint8) {
        // 減算結果が0未満となるとuint8型の範囲を超えるためアンダーフローとなりrevertされる
        return a - b;
    }

    // a:1, b:255
    function uncheckedOverFlow(uint8 a, uint8 b) external pure returns (uint8) {
        // チェックを無効化する オーバーフロー
        unchecked { return a + b; }
    }


    // a:1, b:2
    function uncheckedUnderFlow(uint8 a, uint8 b) external pure returns (uint8) {
        // チェックを無効化する アンダーフロー
        unchecked { return a - b; }
    }


}
