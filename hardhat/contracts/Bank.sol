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
    mapping(address => mapping(bytes32 => uint256)) public balances;

    // The constructor initializes the owner as the caller address of this contract.
    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev whiteListedToken: allow only the owner of this contract to whitelist 
     * the various tokens that can be used in this contract.
     * 
     * @param symbol- The symbol of the token e.g: BTC - Bitcoin.
     * @param tokenAddress - The contract address of the token.
     */
    function whiteListedToken(bytes32 symbol, address tokenAddress) external {
        require(msg.sender == owner, "This is not a public function");

        whiteListedSymbols.push(symbol);
        whiteListedTokens[symbol] = tokenAddress;
    }

    /**
     * @dev getWhiteListedSymbols: Get the array of whitelisted tokens symbols.
     * @return Returns the array of whitelisted tokens symbols.
     */
    function getWhiteListedSymbols() external view returns(bytes32[] memory){
        return whiteListedSymbols;
    }

    /**
     * @dev getWhiteListedAddress: get the address for a specific whitelisted token.
     * @param symbol- The symbol of the token e.g: BTC - Bitcoin.
     * @return Returns the array of whitelisted tokens contract address.
     */
    function getWhiteListedAddress(bytes32 symbol) external view returns(address) {
        return whiteListedTokens[symbol];
    }

    /**
     * @dev getTokenBalance: get the balance for a specific deposited ERC20 token.
     * @param symbol- The symbol of the token e.g: BTC - Bitcoin.
     * @return Returns the balance of a specific deposited ERC20 token.
     */
    function getTokenBalance(bytes32 symbol) external view returns(uint256) {
        return balances[msg.sender][symbol];
    }

    /**
     * @dev depositTokens: allows the deposit of ERC20 tokens.
     * @param amount - amount of tokens to deposit.
     * @param symbol- The symbol of the token e.g: BTC - Bitcoin.
     */
    function depositTokens(uint256 amount, bytes32 symbol) external {
        // Increment the balances for the sender address.
        balances[msg.sender][symbol] += msg.value;

        //Then we will get the address of the token, which is in our whitelisted token mapping.
        // Using that address, we will call a function on an IERC20 contract to request 
        // transferring this amount of tokens to this contract.
        IERC20(whiteListedTokens[symbol]).transferFrom(msg.sender, address(this), amount);
    }

    /**
     * @dev withdrawTokens: enables the withdrawal of tokens deposited in the contract.
     * @param amount - amount of tokens to withdraw. 
     * @param symbol- The symbol of the token e.g: BTC - Bitcoin.
     */
    function withdrawTokens(uint256 amount, bytes32 symbol) external {
        require(balances[msg.sender][symbol] >= amount, "Insufficient Balance");

        balances[msg.sender][symbol] -= amount;
        // IERC20 contract to request transfer amount of tokens to msg.sender.
        IERC20(whiteListedTokens[symbol]).transfer(msg.sender, amount);
    }

    /**
     * @dev withdrawEther: enables the withdrawal of ether deposited in the contract.
     * @param amount - amount of tokens to withdraw. 
     * It is required to be greater than or equal to balance; otherwise, throw an error.
     */
    function withdrawEther(uint256 amount) external {
        require(balances[msg.sender]['ETH'] >= amount, "Insufficient Balance");

        balances[msg.sender]['ETH'] -= amount;
        payable(msg.sender).call{value: amount}("");
    }

    // Allow us to receive ETH sent to the contract.
    receive() external {
        // Increment the balances for the sender address.
        balances[msg.sender]['ETH'] += msg.value;
    }
}