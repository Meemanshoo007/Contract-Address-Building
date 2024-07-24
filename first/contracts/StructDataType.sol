// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract StructDataType {
 struct Student {
        string name;
        uint roll;
        bool pass;
    }

    Student public student;

    // Student[4] public studentsArr;

    mapping(uint => Student) public students;
    uint public studentCount;



    function insertDummy() public returns (Student memory){
        student.name = "Meemanshoo";
        student.roll = 12;
        student.pass = true;
        return student;
    }

    function insert(string memory _name , uint _roll, bool _pass) public returns (Student memory){
        student.name = _name;
        student.roll = _roll;
        student.pass = _pass;
        return student;
    }


    function insertStudent(string memory _name, uint _roll, bool _pass) public returns (Student memory) {
        students[studentCount] = Student(_name, _roll, _pass);
        studentCount++;
        return students[studentCount - 1];
    }
    
}