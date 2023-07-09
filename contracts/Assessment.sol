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
