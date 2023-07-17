## Bank Contract

The Bank smart contract facilitates the deposit and withdrawal of ERC20 tokens and Ether. Additionally, it imports and utilizes ERC20 token contracts for popular tokens such as Polygon (MATIC), Shiba Inu (SHIB), and Tether (USDT).. It includes the following functions:

- **`whiteListedToken`**: Allows the contract owner to whitelist various tokens that can be used in the contract. Only the owner can call this function.

- **`getWhiteListedSymbols`**: Retrieves the array of whitelisted token symbols.

- **`getWhiteListedAddress`**: Retrieves the address associated with a specific whitelisted token.

- **`getTokenBalance`**: Retrieves the balance of a specific deposited ERC20 token for the caller.

- **`depositTokens`**: Allows users to deposit ERC20 tokens by transferring them to the contract. The corresponding token balance is incremented.

- **`withdrawTokens`**: Enables users to withdraw deposited ERC20 tokens. The corresponding token balance is decremented.

- **`withdrawEther`**: Enables users to withdraw deposited Ether. The corresponding Ether balance is decremented.

Please note that the "Bank" contract uses the OpenZeppelin library, specifically the `IERC20` interface, for interacting with ERC20 tokens.

## ERC20 Token Contracts

The repository also includes ERC20 token contracts for popular tokens such as Polygon (MATIC), Shiba Inu (SHIB), and Tether (USDT). These contracts inherit from the OpenZeppelin `ERC20` contract and include a constructor for initializing the token details and minting an initial supply.

- **Polygon (MATIC)**: Token symbol is "MATIC". The contract name is "Polygon". It mints an initial supply of 5000 tokens.

- **Shiba Inu (SHIB)**: Token symbol is "SHIB". The contract name is "Shiba Inu". It mints an initial supply of 5000 tokens.

- **Tether (USDT)**: Token symbol is "USDT". The contract name is "Tether". It mints an initial supply of 5000 tokens.

## How to Use

1. Deploy the "Bank" contract to interact with ERC20 tokens and Ether. Only the contract owner can whitelist tokens.

2. Use the `whiteListedToken` function to whitelist tokens by providing the symbol and contract address.

3. Use the `depositTokens` function to deposit ERC20 tokens. Specify the token amount and symbol. The token balance will be incremented.

4. Use the `withdrawTokens` function to withdraw deposited ERC20 tokens. Specify the token amount and symbol. The token balance will be decremented.

5. Use the `withdrawEther` function to withdraw deposited Ether. Specify the Ether amount. The Ether balance will be decremented.

6. Use the appropriate getter functions (`getWhiteListedSymbols`, `getWhiteListedAddress`, `getTokenBalance`) to retrieve information about whitelisted tokens and token balances.

7. Deploy the ERC20 token contracts (e.g., Polygon, Shiba Inu, Tether) separately if you want to interact with those tokens in other contracts or applications.

## License

The code in this repository is licensed under the MIT License.
