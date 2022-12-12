// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Shiba is ERC20 {
  constructor() ERC20('Shiba Inu', 'SHIB') {
    _mint(msg.sender, 5000 * 10**18);
  }
}