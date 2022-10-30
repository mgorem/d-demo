// SPDX-License-Identifier: MIT
// code for the token we use to vote
// create an ERC20 Token then make it governancable

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract GovernanceToken is ERC20 {
    uint256 s_maxSupply = 1000000000000000000000000;

    constructor() 
    ERC20("GovernanceToken", "GTK")
    ERC20Permit("GovernanceToken")
     {
        _mint(msg.sender, s_maxSupply);
    }

    // overrides required by solidity
  function _afterTokenTransfer(
    address from,
    address to,
    uint256 amount
  ) internal override(ERC20Votes) {
    super._afterTokenTransfer(from, to, amount);
  }

  function _mint(address to, uint256 amount) internal override(ERC20Votes) {
    super._mint(to, amount);
  }

  function _burn(address account, uint256 amount) internal override(ERC20Votes) {
    super._burn(account, amount);
  }
}