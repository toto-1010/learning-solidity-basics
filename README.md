# 概要
私、ととが製作した学習教材の一部です。  

これからSolidityを学習される方々向けの学習コースで使用したソースコードを無料提供します。  
※DApp（分散アプリケーション）やスマートコントラクト開発における知識、技術力向上が主な目的です。私は日本におけるこれらの技術発展を望む者です。

コードの解説については現在動画（現時点では有料）のみで行なっています。もし関心のある方いらっしゃればご覧ください。
  
  

### 注意事項
このGitHubリポジトリにあるソースコードは学習目的のものです。  以下の点は予めご了承の上ご利用ください。
  - ソースコードそのものはコースの受講者か否かに限らず[MITライセンス](https://github.com/toto-1010/learning-solidity-basics/blob/main/LICENSE)のもと、無料提供しますが、そのまま使ったり、切り貼りしたりしてご自身のNFTコントラクトを開発し、Ethereumなどのメインネットワークにデプロイすることは推奨しません。  
  - MITライセンス記載の通り、これを禁止するものではありませんが、「本ソフトウェアの使用またはその他の取引に起因または関連して発生した、いかなるクレーム、損害またはその他の責任についても、著作者または著作権所有者は一切責任を負いません。」 と記載がある通り、利用の際はご自身の責任のもと行なってください。 
  - 特定の銘柄や商品の投資や投機を促すものではありません。  
  - 本GitHubリポジトリから直接Q&Aは受け付けていません。  
  - このリポジトリで提供するソースコード以外、例えばコースの解説動画や資料、NFT画像、その他の著作権をはじめとする全ての権利は私、「とと」が有しています。  
  
  

### 解説動画とソースコードのリンク

#### Section02 Solidityソースレイアウトとコントラクトの構造（Solidity layout,Structure of a Contract）
- [レイアウト（Solidity Layout）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section02/completeCode/Layout.sol)
- [Solidity変数の種類(Variables)](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section02/completeCode/Variables.sol)
- [コントラクトの構造（Structure of a Contract）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section02/completeCode/StructureOfAContract.sol)

#### Section03 ファンクションとスコープ(Expressions,Scope)
- [関数型（Function）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section03/completeCode/Function.sol)
- [可視性によるファンクションの呼び出しの違い（Function Call）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section03/completeCode/FunctionCall.sol)
- [ファンクションの複数の戻り値（Returning Multiple Values）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section03/completeCode/ReturnMultipleValues.sol)
- [スコープ（Scope）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section03/completeCode/Scope.sol)

#### Section04 バリュータイプ(値型)（Value Types）
- [論理型（Booleans）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section04/completeCode/Booleans.sol)
- [整数型（Integers）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section04/completeCode/Integers.sol)
- [アドレス型（Address）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section04/completeCode/Address.sol)
- [コントラクト型（Contract）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section04/completeCode/Contract.sol)
- [固定サイズのバイト配列型Fixed-size byte arrays](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section04/completeCode/FixedSizeByteArrays.sol)
- [列挙型（Enums）](https://github.com/toto-1010/learning-solidity-basics/tree/main/contracts/Section04/completeCode/Enums.sol)
- [関数型（Function）]※「Section03 式、スコープ」で解説

#### Section05 リファレンスタイプ(参照型)とマッピング型（Reference Types/Mapping Types）
- [参照型データの格納先(DataLocation)](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section05/completeCode/DataLocation.sol)
- [動的サイズのバイト配列型:文字列とバイト(String/bytes)](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section05/completeCode/StringBytes.sol)
- [配列型（Arrays）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section05/completeCode/Arrays.sol)
- [構造体（Structs）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section05/completeCode/Structs.sol)
- [マッピング（Mapping）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section05/completeCode/Mapping.sol)

#### Section06 単位とグローバル変数と特別なファンクション（Units and Globally Available Variables）
- [ETHの単位（Ether Units）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section06/completeCode/EtherUnits.sol)
- [時間の単位（Time Units）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section06/completeCode/TimeUnits.sol)
- [トランザクションプロパティ（Transaction Properties）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section06/completeCode/TransactionProperties.sol)
- [ブロックプロパティ（Block Properties）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section06/completeCode/BlockProperties.sol)
##### 特別なファンクション
- [ABIファンクション（ABI Function）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section06/completeCode/ABIEncodeDecodeFunction.sol)
- [数学的・ハッシュ化ファンクション（Mathematical & Cryptographic Function）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section06/completeCode/MathematicalCryptographicFunction.sol)

#### Section07 制御の仕組み（Control Structures）
##### 制御構文
- [条件分岐(If~Else）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section07/completeCode/IfElse.sol)
- [Whileループ](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section07/completeCode/While.sol)
- [Forループ](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section07/completeCode/For.sol)
##### アンダーオーバーフローチェック
- [オーバーフローアンダーフローチェック（Checked/Unchecked Arithmetic）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section07/completeCode/CheckedUncheckedArithmetic.sol)
##### エラーハンドリング
- [コントラクト内のハンドリング（Assert/Require/Revert）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section07/completeCode/AssertRequireRevert.sol)
- [外部接続時のハンドリング（Try/Catch）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section07/completeCode/TryCatch.sol)

#### Section08 コントラクト(Contract)
- [newを使ったコントラクトの作り方（Creating Contract via new）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section08/completeCode/CreatingContract.sol)
- [可視性（Visibility）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section08/completeCode/Visibility.sol)
- [ゲッターファンクション（GetterFunction）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section08/completeCode/GetterFunction.sol)
- [ファンクション修飾子（Function Modifier）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section08/completeCode/FunctionModifier.sol)
- [イベント（Events）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section08/completeCode/Event.sol)
- [定数と不変の状態変数（Constant and Immutable State Variables](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section08/completeCode/ConstantImmutable.sol)
- [オーバーロード（Function Overloading）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section08/completeCode/FunctionOverload.sol)
- [Function/FallbackファンクションとETHの受け取り（Receive Ether Function/Fallback Function）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section08/completeCode/ReceiveFallbackFunction.sol)

#### Section09 継承(Inferitance)
- [継承1（Inferitance1）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section09/completeCode/Inheritance1.sol)
- [継承2（Inferitance2）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section09/completeCode/Inheritance2.sol)
- [継承3（Inferitance3）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section09/completeCode/Inheritance3.sol)
- [継承4（Inferitance4）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section09/completeCode/Inheritance4.sol)
- [継承5（Inferitance5）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section09/completeCode/Inheritance5.sol)

#### Section10 インタフェース、抽象コントラクト、ライブラリ、using A for B構文(Interfaces,Abstract Contract,Library,Using For)
- [インターフェース（Interfaces1）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section10/completeCode/Interface1.sol)
- [インターフェース（Interfaces2）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section10/completeCode/Interface2.sol)
- [Interfaces2学習で使うSimpleCalc Contract](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section10/completeCode/SimpleCalc.sol)
- [抽象コントラクト（Abstract Contract）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section10/completeCode/AbstractContract.sol)
- [ライブラリ（Library）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section10/completeCode/Library.sol)
- [ライブラリファンクションのアタッチ（Using For）](https://github.com/toto-1010/learning-solidity-basics/blob/main/contracts/Section10/completeCode/UsingFor.sol)


