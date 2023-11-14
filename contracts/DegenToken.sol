// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    constructor() ERC20("Degen", "DGN")  {
        // initializes available items to the itemList array
        createItem("Cool Staff", 2500);
        createItem("Nice Sword", 2250);
        createItem("Fine Axe", 2500);
        createItem("Great Spear", 3000);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferToken(address to, uint256 value) public {
        require(balance() >= value, "Not enough balance for specified transfer amount...");
        approve(msg.sender, value);
        transferFrom(msg.sender, to, value);
    }

    function balance() public view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function burn(uint256 value) public {
        require(balance() >= value, "Not enough balance for specified burn amount...");
        approve(msg.sender, value);
        _burn(msg.sender, value);
    }

    // struct for item name and cost
    struct Item {
        string name;
        uint256 cost;
    }

    Item[] private itemList;

    // function to create item (only by adding memory keyword allows struct to be placed to an array)
    function createItem(string memory name, uint256 cost) private  {
        Item memory i = Item(name, cost);
        itemList.push(i);
    }
    

    function redeemToken(uint256 itemNum) public {
        // item index as item ID
        uint256 itemValue =  itemList[itemNum].cost;
        
        require(balance() >= itemValue, "You don't have enough funds for the item...");
        approve(msg.sender, itemValue);
        transferFrom(msg.sender, owner(), itemValue);
    }

    function showItems() public view returns(Item[] memory) {
        return itemList;
    }
}