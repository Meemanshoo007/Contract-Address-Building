// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract StringDataType {
    
    string public myString;

    function getString() public view returns(string memory) {
        return myString;
    }

    function setString(string memory value) public {
        myString = value;
    }

    function getStringLength() public view returns(uint) {
        return bytes(myString).length;
    }
}