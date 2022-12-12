// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Bank {
    // The owner of the contract, which will be initialized when we deploy the contract.
    address public owner;
    // This will store the symbol of the token and allow for depositing in this contract.
    bytes32[] public whiteListedSymbols;

    // To track the token symbol to the address where the token contract is deposited
    mapping(bytes32 => address) public whiteListedTokens;
    // This stores the token balances deposited by each address.
    mapping(address => mapping(bytes32 => uint256)) public balance;

    // The constructor initializes the owner as the caller address of this contract.
    constructor() ERC20("", "") {
        owner = msg.sender;
    }
}