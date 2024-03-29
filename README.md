## Decentralized ATM with react and solidty 

This project aims to create a decentralized ATM (Automated Teller Machine) using React for the front-end and Solidity for the smart contract development. The goal is to provide users with a secure and transparent way to interact with their cryptocurrency assets and perform various financial transactions.

## Description

The Decentralized ATM with React and Solidity is a project that aims to build a decentralized and secure platform for users to interact with their cryptocurrency assets. It combines the power of React, a popular JavaScript library for building user interfaces, with Solidity, a programming language for developing smart contracts on the Ethereum blockchain.

The main goal of this project is to provide users with a transparent and reliable platform to perform various financial transactions using their cryptocurrency holdings

## Getting Started

* Smart Contract Implementation: Solidity is used to develop smart contracts that define the logic and rules of the MiniBank system. These smart contracts are deployed on the Ethereum blockchain, ensuring transparency and immutability.

* Deposits and Withdrawals: We can deposit funds into their accounts, increasing their balance. They can also withdraw funds, decreasing their balance. The system ensures sufficient funds for withdrawals and prevents overdrafts.


# Solidity Code : 

    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.5;

    //import "hardhat/console.sol";

    contract Assessment {
    address payable public owner;
    uint256 public balance = 0;
   

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    

    constructor(uint initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;

    }

    function getBalance() public view returns(uint256){
        return balance;
    }

    function deposit(uint256 _amount) public payable {
        uint _previousBalance = balance;

        // make sure this is the owner
        require(msg.sender == owner, "You are not the owner of this account");

        
        balance += _amount;

        
        assert(balance == _previousBalance + _amount);

        // emit the event
        emit Deposit(_amount);
    }


    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }

       
        balance -= _withdrawAmount;

        
        assert(balance == (_previousBalance - _withdrawAmount));

        // emit the event
        emit Withdraw(_withdrawAmount);
        }
    }





### Executing program



1. Inside the project directory, in the terminal type: npm i
2. Open two additional terminals in your VS code
3. In the second terminal type: npx hardhat node
4. In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js
5. Back in the first terminal, type npm run dev to launch the front-end.

## Interaction with Decentralized ATM 

The web page will first show the option to connect to your metamask wallet .
Then after connection you will see that your inital balance of ATM is 0 , now you can deposit 1 wei ether or withdraw 1 wei ether by the buttons showing in page.

## Video Tutorial 

https://www.loom.com/share/75417e9519f24cb8ab936f523daaccf3?sid=ccd6b68b-9803-4dd7-a689-9b4397ff4bf4

## Authors

Anurag Rawat
 
 @https://www.linkedin.com/in/rawatanurag/
 
## License

This project is licensed under the MIT License - see the LICENSE.md file for details.





