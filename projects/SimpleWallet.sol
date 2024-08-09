// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract SimpleWallet {
   
    address public owner;
    string public str;
   
    event Transfer(address receiver,uint amount);
    event Receive(address sender,uint amonut);
    event ReceiveUser(address sender,address reveiver,uint amonut);


    constructor(){
        owner=msg.sender;
    }


    modifier onlyOwner() {
        require(msg.sender == owner,"You don't have access");
        _;
    }
   
    /**Contract related functions**/
    function transferToContract() external payable  {
       str="Amount transferred to the contract";
    }




    function transferToUserViaContract(address payable _to, uint _weiAmount) external onlyOwner {
        require(address(this).balance>=_weiAmount,"Insufficient Balance");
        _to.transfer(_weiAmount);
        emit Transfer(_to,_weiAmount);
    }




    function withdrawFromContract(uint _weiAmount) external onlyOwner {
       require(address(this).balance >= _weiAmount, "Insuffficient balance");
       payable(owner).transfer(_weiAmount);
    }




    function getContractBalanceInWei() external view returns (uint) {
         return address(this).balance;
    }
   
     /**User related functions**/
    function transferToUserViaMsgValue(address _to) external payable {
       require(address(this).balance>=msg.value,"Insufficient Balance");
       payable (_to).transfer(msg.value);
    }




    function receiveFromUser() external payable {
      require(msg.value>0,"Wei Value must be greater than zero");
      payable(owner).transfer(msg.value);
    }


    function getOwnerBalanceInWei() external view returns(uint){
       return owner.balance;
    }


    receive() external payable {
       emit Receive(msg.sender, msg.value);
    }


    fallback() external payable{
        payable(msg.sender).transfer(msg.value);
        str = "Fallback function called";
    }




}
