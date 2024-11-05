// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
    // Ether payments
    // Modifiers
    // Visibility
    // Events
    // Enums

contract HotelRoom {

    // vacant
    // occupied
    enum Statuses {
        Vacant, 
        Occupied
    }
    Statuses public currentStatus;
   
    address payable public owner;

    event Occupy(address _occupant, uint _value);

    constructor() {
        owner = payable(msg.sender); // 컨트랙트를 배포한 사람의 주소가 저장됩니다.
    }

    modifier onlyWhileVacant {
        // Check status
        require(currentStatus == Statuses.Vacant,"Currently occupied.");
        _;
        // 언더스코어(_)는 함수 수정자 내부에서만 사용되는 특별한 문자로,
        // Solidity에게 나머지 코드를 실행하도록 지시한다.
    }

    modifier costs(uint _amount){
        // Check price
        require(msg.value >= _amount, "Not enough ether provided.");
        _;
    }

    function book() public payable onlyWhileVacant costs(2 ether) {
     
        currentStatus = Statuses.Occupied;
        
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent);

        emit Occupy(msg.sender, msg.value);
    }
}


  