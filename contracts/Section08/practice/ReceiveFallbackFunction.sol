// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/** 
 * @title ReceiveEtherFunction & Fallback Functionを学ぼう
 */

 /** @dev 
  * これらのファンクションを使ってEtherを受け取ることができる
  * external,payableの指定が必要
  *  - receive() external payable {}
  *  - fallback() external payable {}
  */ 

/** @dev 
 * receive()は、Ether がコントラクトに送信され、 calldata が提供されない (ファンクションが指定されない) 場合のフォールバックファンクションとして使用される
 * これは任意の値を取ることができる。receive() ファンクションが存在しない場合、fallback()が次に呼び出される。
 * 1つのコントラクトは、最大で1つの receive() ファンクションを持つことができる。
 * msg.dataが空である必要がある
 * 
 * fallback()は他のどのファンクションも与えられたファンクションシグネチャに一致しない場合、またはデータがまったく供給されずreceive Ether functionが
 * 存在しない場合に、コントラクトへの呼び出しで実行される。
 * fallback()は常にmsg.dataを受け取るが、Etherも受け取るためにはpayableとマークされている必要がある。
 * これは、呼び出しにタイプミスがある場合や、全くファンクションを指定しない場合などにfallback()が呼ばれる
 * 1コントラクトが持てるFallback Functionは最大１つまで
 * msg.dataが空でない
 */
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

