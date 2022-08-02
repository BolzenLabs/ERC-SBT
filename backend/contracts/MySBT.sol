// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721.sol";

contract MySBT is ERC721 {
    uint256 Counter;

    constructor() ERC721("MySBT", "MSBT") {}
    
    function totalSupply(){
        return Counter
    }
    function safeMint(address to) public {
        uint256 tokenId = Counter;
        _safeMint(to, tokenId);
        Counter++;
    }
}
