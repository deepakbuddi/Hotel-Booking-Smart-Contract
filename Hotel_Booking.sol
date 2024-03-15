// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract HotelBook{

    enum Status{
        Vacant,
        Occupied
    }

    Status public currentStatus;

    event Occupy(address _occupant, uint _amt);

    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = Status.Vacant;
    }

    modifier onlyWhileVacant(){
        require(currentStatus == Status.Vacant, "Room is occupied");
        _;
    }

    modifier cost(uint _amt){
        require(msg.value >= _amt, "Your balance is not sufficient");
        _;
    }

    function book() public payable onlyWhileVacant cost(2 ether){
        currentStatus = Status.Occupied;
        require(true);
        emit Occupy(msg.sender, msg.value);
    }
}