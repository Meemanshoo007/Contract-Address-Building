// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ToDoList {
  uint taskCount = 0;

    struct Task{
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) tasks;

    event TaskCreated(uint id, string content);
    event TaskCompleted(uint id, bool completed);

    constructor(){
        tasks[taskCount] = Task(taskCount, "Initial Task", false);
    }

    function getTask(uint _id) public view returns(Task memory){
        Task memory task = tasks[_id];
        return task;
    }

    function createTask(string memory _content) public{
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content);
    }

    function toggleTaskCompleted(uint _id)public{
        bool comp = !tasks[_id].completed;
        tasks[_id].completed = comp;
        emit TaskCompleted(_id, tasks[_id].completed);
    }

    function getTaskCount() public view returns(uint){
        return  taskCount + 1;
    }

    function getAllTask() public view returns (Task[] memory){
        Task[] memory taskList = new Task[](taskCount + 1); //initialize an empty array of length = `nextCandidateId - 1`
        for(uint i = 0; i < taskList.length; i++){
            taskList[i] = tasks[i];
        }
        return taskList;
    }
}

