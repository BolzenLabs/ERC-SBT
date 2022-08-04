// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721.sol";

contract MySBT is ERC721 {
    uint256 Counter;
    uint256 whitelistCount;
    mapping(address => uint256) whitelist;

    constructor() ERC721("MySBT", "MSBT") {}

    function whiteList(address to) public {
        whitelistCount += 1;
        whitelist[to] = whitelistCount;
    }

    function totalSupply() public view returns (uint256) {
        return Counter;
    }

    function safeMint(address to) public {
        Counter += 1;
        _safeMint(to, Counter);
    }
}
