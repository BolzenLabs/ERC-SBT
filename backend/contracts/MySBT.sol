// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721.sol";

contract MySBT is ERC721 {
    uint256 Counter;

    constructor() ERC721("MySBT", "MSBT") {}

    function totalSupply() public view returns (uint256) {
        return Counter;
    }

    function safeMint(address to) public {
        Counter++;
        _safeMint(to, Counter);
    }
}
