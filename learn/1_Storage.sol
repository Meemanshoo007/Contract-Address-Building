// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Student {

    // first project as test as

    uint256 numberOfStudent;

    uint[5] recordNoOfStudents;

    uint initialRecordIndex = 0;

    constructor(){
        numberOfStudent = 10;
    }

    function getLengthOfRecords() public view returns (uint){
        return  recordNoOfStudents.length;
    } 

    function getNoOfStudents() public view returns (uint256){
       
        return numberOfStudent;
    }

     function setNoOfStudents(uint256 _no) public{
        require(initialRecordIndex < 5 , "Update limit reached");

        recordNoOfStudents[initialRecordIndex] = _no;
        numberOfStudent = _no;
        initialRecordIndex++;
    }

    function getAllRecordsOfSetNoOfStudents() public view  returns(uint[5] memory) {
        return recordNoOfStudents;
    }

}

