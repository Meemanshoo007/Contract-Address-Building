// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract FixedSizeArray {
    uint[5] fixedArray;

    function getLength() public view returns (uint){
        return fixedArray.length;
    }

    function getArray() public view returns (uint[5]  memory){
        return fixedArray;
    }

    function getValueInArray(uint index) public view returns (uint){
        require(index < 5, "Index must be less then 5");
        return fixedArray[index];
    }

    function updateValueInArray(uint index, uint value) public{
        require(index < 5, "Index must be less then 5");
        fixedArray[index] = value;
    }

    function cleanValueInArray() public{
        for(uint i = 0 ; i < fixedArray.length; i++){
            fixedArray[i] = uint(0);
        }
    }

    function exchangeIndexValueInArray(uint toIndex, uint fromIndex) public{
        require(toIndex < 5 , "toIndex must be less then 5");
        require(fromIndex < 5 , "fromIndex must be less then 5");
        require( toIndex != fromIndex, "Index must be different");
        uint value = fixedArray[toIndex];
        fixedArray[toIndex] = fixedArray[fromIndex];
        fixedArray[fromIndex] = value;
    }

    function insertDummyDataInArray() public{
        fixedArray = [10,20,90,10,30];
    }

    function sortArrayUsingBubbleSort() public {
        for(uint i = 0 ; i < fixedArray.length; i++){
            for(uint j = 0 ; j < (fixedArray.length - 1)- i; j++){
            if(fixedArray[j] > fixedArray[j+1]){
                uint value = fixedArray[j+1];
                fixedArray[j+1] = fixedArray[j];
                fixedArray[j] = value;
            }
        }
        }
    }
}