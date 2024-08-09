// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MeemToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Dimond", "Meem") {
        _mint(msg.sender, initialSupply);
    }
    function decimals() public pure override returns (uint8) {
        return 1;
    }
}

// 0x3baf5d83395c4e1b36c498a5963f4204b77921e6 ---- Deci1 ---- https://sepolia.etherscan.io/tx/0x5ec762b6650a83d7a43798db7dc644d186d74471014023b576541d75364ebf89

// 0x86f5fe2d1c90e1f9d5984cc3974b0fbc8513b3ec ---- Meem ---- https://sepolia.etherscan.io/tx/0xbb6c5c2671eb5d2c4c1ee01cd3e17ce4367e7fa7bea268b71a9b876206ef7dc0