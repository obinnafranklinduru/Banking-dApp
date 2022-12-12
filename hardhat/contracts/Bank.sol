// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@op"

contract Bank is ERC20, Ownable {

    constructor() ERC20("", "") {
        owner = msg.sender;
    }
}