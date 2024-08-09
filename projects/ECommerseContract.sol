// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract ECommerseContract{

    struct Product{
        string url;
        address owner;
        uint[] lastPrice;
        uint basePrice;
        uint sellPrice;
        bool isAvailable;
        uint256 createdDate;
        uint256 lastSellDate;
        address[] views;
    }

    string public status;

    address ceo;
    Product[] public  products;

    modifier isCeo() {
        require(msg.sender == ceo, "You are not authorize");
          _;
    }

    modifier isNotCeo() {
        require(msg.sender != ceo, "Ceo must not do this");
          _;
    }

    modifier isValidProduct(uint id) {
        require(id < products.length , "Invalid product id");
        _;
    }

    modifier isOwner() {
       
          _;
    }

    constructor(){
        ceo = msg.sender;
        status = "started";
    }

    function addProduct(string calldata url,uint basePrice,uint sellPrice) public isCeo{
        uint[] memory lstPrice;
        address[] memory views;
        require(basePrice > 0 ,"Base price must be greater then 0");
        require(sellPrice > 0 ,"Selling price must be greater then 0");
        require(sellPrice >= basePrice ,"Selling must be greater then or equal to Base price");
        products.push(
            Product(
                url,
                ceo,
                lstPrice,
                basePrice,
                sellPrice,
                false,
                block.timestamp,
                0,
                views
            )
        );
    }

    function toggleProductStat(uint id)public isCeo isValidProduct(id) {       
        products[id].isAvailable = !products[id].isAvailable;
        // status = string(abi.encodePacked("toggled ", boolToString(products[id].isAvailable)));
    }

    // function boolToString(bool _bool) internal  pure returns  (string memory) {
    //     return _bool ? "true" : "false";
    // }

    function updatePriceOfProduct(uint id,uint sellPrice) public isCeo isValidProduct(id)  {
       require(sellPrice > products[id].basePrice ,"Selling price must be greater then Base price"); 
       require(sellPrice > 0 ,"Selling price must be greater then 0");
       products[id].sellPrice = sellPrice;
    }

    function getAllProducts()public view returns(Product[] memory){
        uint validProductCount;
        for(uint i = 0 ; i < products.length; i++){
            if(products[i].isAvailable){
                validProductCount++;
            }
        }

      Product[] memory validProductList = new Product[](validProductCount);
      for(uint i = 0 ; i < products.length; i++){
            if(products[i].isAvailable){
                validProductList[i] = products[i];
            }
      }

        return validProductList;
    }


    function getProduct(uint id)public isValidProduct(id)  view returns(Product memory){
        return  products[id];
    }

    function getProductCount() public view  returns(uint){
        return products.length;
    }

    function viewProduct(uint productId,uint userId) public isValidProduct(productId) isNotCeo isUser(userId){
        address[] memory ls = products[productId].views;
        bool isFound = false;
        for(uint i = 0 ; i < ls.length; i++){
            if(ls[i] == msg.sender){
                isFound = true;
            }
        }
        require(!isFound , "You are already viewed");
        products[productId].views.push(msg.sender);
    }

    function getTotalViewsOfProduct(uint id) public isValidProduct(id) view  returns (uint) {
        return products[id].views.length;
    }

    struct User{
        address userAddress;
        string name;
        uint rate;
        Position position;
        uint[] productsIds;
        uint registerationDate;   
        bool isBloked;
    }

    enum Position {Blocked, Bronze, Silver, Gold, Premium, Pro}

    mapping(uint => User) public users;
    uint currentUserId = 0;

    modifier isUserBlocked(){
        _;
    }

    modifier checkProdIsAvailInUser(){
        _;
    }

    
    modifier isUser(uint userId) {
        require(users[userId].userAddress == msg.sender, "Invalid user");
          _;
    }

    function registerUsers(string memory  name) public isNotCeo{
        uint[] memory productsIds;
        users[currentUserId] = (
            User(
                msg.sender,
                name,
                0,
                Position.Bronze,
                productsIds,
                block.timestamp,   
                false
            )
        );

        currentUserId++;
    }

    function getAllUsers()public isCeo view returns (User[] memory) {

        User[] memory userList = new User[](currentUserId); //initialize an empty array of length = `nextCandidateId - 1`
        for(uint i = 0; i < userList.length; i++){
            userList[i] = users[i];
        }
        return userList;
    }
    
    function getUser(uint id) public view returns(User memory){
          return users[id];
    }

    function getProductsByUser()public {}

    function toggleUserStat()public {}

    function changeUserPosition()private{}



}