// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract test{
    
    struct Product{
        string name;
        bool isAvailable;
    }

    Product[] public products;

    function addProduct(string memory name, bool isAvailable) public{
        products.push(Product(name,isAvailable));
    }

    function getAvailableProducts() public view  returns(Product[] memory){
        Product[] memory  availableProducts;
        uint j = 0;
        for(uint i = 0 ; i < products.length ; i++){
            if(products[i].isAvailable){
                availableProducts[j] = (products[i]);
                j++;
            }
        }
        return  availableProducts;
    }
}