// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract DynamicSizeArray {
    uint256[] dynamicArray;

    function getLength() public view returns (uint256) {
        return dynamicArray.length;
    }

    function getArray() public view returns (uint256[] memory) {
        return dynamicArray;
    }

    function getValueInArray(uint256 index) public view returns (uint256) {
        require(dynamicArray.length >= index, "Array index out of bound.");
        return dynamicArray[index];
    }

    function addValueInArray(uint256 value) public {
        dynamicArray.push(value);
    }

    function removeLastValueInArray() public {
        require(dynamicArray.length > 0, "Array is already empty");
        dynamicArray.pop();
    }

    function cleanValueInArray() public {
        require(dynamicArray.length != 0, "Array is already empty.");
        delete dynamicArray;
    }

    function sumAllValueInArray() public view returns(uint){
       uint sum;
        for (uint256 i = 0; i < dynamicArray.length; i++) {
            sum += dynamicArray[i];
        }

        return sum;
    }

    function findMaxValueInArray() public view returns(uint){
       require(dynamicArray.length != 0, "Array is empty.");   
       uint max = dynamicArray[0];
        for (uint256 i = 0; i < dynamicArray.length; i++) {
            if(max < dynamicArray[i]){
                max = dynamicArray[i];
            }
        }

        return max;
    }
}
