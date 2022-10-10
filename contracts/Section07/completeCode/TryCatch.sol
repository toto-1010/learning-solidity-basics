// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title Try/Catch を学ぼう
 * 外部接続時の呼び出し失敗は、try/catch文を使ってキャッチすることができる
 ※ キャッチの仕方は複数ある
 */

// 接続先コントラクト
contract ContractA {
    function div(uint a, uint b) external pure returns (uint) {
        require(a != 0, "a must be greater than 0");
        return a/b;
    }
}

contract TryCatch {
    ContractA public conA;

    constructor() {
        conA = new ContractA();
    }
 
    /**
     * @dev 
     * catch Error(string memory reason) { ... }
     *  エラーがrevert()またはrequire() によって起こった場合やそのような例外を引き起こす内部エラーが起こった場合に実行される
     * catch Panic(uint errorCode) { ... }
     *  エラーがパニックによって引き起こされた場合に実行される
     *  例）失敗assert、ゼロによる割り算、無効な配列アクセス、算術オーバーフローなど
     * catch (bytes memory lowLevelData) { ... }
     *  エラーが他のどれにも一致しない場合、エラーメッセージのデコード中エラーがあった場合、例外とともにエラーデータが提供されなかった場合に実行される
     *  宣言された変数は、そのような場合に低レベルのエラーデータへのアクセスを提供する。
     * catch { ... }
     *. エラーデータに関心なければこれを使う
     */
    function tryCatchDiv(uint a_, uint b_)
        external
        view
        returns (
            uint,
            bool,
            string memory,
            uint,
            bytes memory
        ) {
            try conA.div(a_, b_) returns (uint ans) {
                // conA.div(a_, b_)の実行結果のreturnを (uint ans)として受け取ることができる
                // {a:4,b:2}
                return (ans, true, "", 0, "");
            } catch Error(string memory reason) {
                // {a:0,b:2}
                return (1000, false, reason, 0, "");
            } catch Panic(uint errCode) {
                // {a:2,b:0}
                return (2000, false, "", errCode, "");
            } catch (bytes memory data) {
                return (3000, false, "", 0, data);
            }
        }
        
        /** @dev パニック例外コード
         * 0x00 : 一般的なコンパイラ挿入型パニックに使用されます
         * 0x01 : falseと評価される引数でassertを呼び出した場合
         * 0x11 : 算術演算の結果、unchecked{ ... }ブロックの外でアンダーフローまたはオーバーフローが発生した場合。
         * 0x12 : ゼロで割ったりモジュロしたりする場合（例：5 / 0や23 % 0）
         * 0x21 : 大きすぎる値やマイナスの値をenum型に変換した場合
         * 0x22 : 正しくエンコードされていないストレージバイト配列にアクセスした場合
         * 0x31 : 空の配列に対して .pop() を呼び出した場合
         * 0x32 : 配列、bytesN、配列スライスを境界外または負のインデックスでアクセスした場合（i >= x.length または i < 0 の場合の x[i] など）
         * 0x41 : メモリを過剰に割り当てたり、大きすぎる配列を作成した場合
         * 0x51 : 内部関数型のゼロ初期化変数を呼び出した場合
         */
}
