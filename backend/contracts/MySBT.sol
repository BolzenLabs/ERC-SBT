// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "./ERC721.sol";

/// Wallet already owns a SBT
error ExistingToken();
// Sbt doesnt exist
error NonExistingToken();
/// Not Self
error NotSelf();
//Invalid Choice
error InvalidChoice();

/// Transfers Disallowed
contract MySBT is ERC721 {
    //Define Profile Data Structure
    struct Profile {
        string identity; //Username
        uint256 id; //Unique ID
        string profile_uri; //Profile URI
        string data_uri; //Data URI
    }

    //Contract specific definitions
    string public contractName; //Contract name
    address public operator; //Contract operator
    bytes32 private zeroHash =
        0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;

    uint256 totalSupply;
    uint256 whitelistCount;
    uint256 runningIds; //Running count of the ids to assign.

    //Contract Mapping Definitions
    mapping(address => uint256) public whitelist;

    mapping(address => Profile) private profiles;
    mapping(address => uint256) public accountsToIds;

    event Mint(address _to);
    event Burn(address _to);
    event Update(address _to);

    constructor(string memory _name) ERC721("MySBT", "MSBT") {
        contractName = _name;
        operator = msg.sender;
    }

    function safeMint(
        address to,
        string memory username,
        string memory profile_uri,
        string memory data_uri
    ) public {
        // require(whitelist[to], "Account not whitelisted");
        if (keccak256(bytes(profiles[to].identity)) != zeroHash)
            revert ExistingToken();
        if (msg.sender != to) revert NotSelf();

        profiles[to] = Profile(username, runningIds, profile_uri, data_uri);
        accountsToIds[to] = runningIds;

        _safeMint(to, runningIds);
        runningIds += 1;
        totalSupply += 1; // increase total supply
        emit Mint(to);
    }

    function safeBurn(address to) public {
        if (keccak256(bytes(profiles[to].identity)) == zeroHash)
            revert NonExistingToken();
        if (msg.sender != to) revert NotSelf();

        _safeBurn(profiles[to].id);
        totalSupply -= 1;
        delete profiles[to];
        // delete accountsToIds[to]; //We are not deleting the accounts that once minted.
        emit Burn(to);
    }

    //Pass in 0 to update profile URI
    //Pass in 1 to update json URI
    function updateURI(
        address to,
        string memory uri,
        uint256 choice
    ) external {
        if (keccak256(bytes(profiles[to].identity)) == zeroHash)
            revert NonExistingToken();
        if (msg.sender != to) revert NotSelf();
        if (choice != 1 && choice != 0) revert InvalidChoice();

        if (choice == 0) profiles[to].profile_uri = uri;
        else profiles[to].data_uri = uri;
        emit Update(to);
    }

    function getprofileURI(address to) public view returns (string memory) {
        return profiles[to].profile_uri;
    }

    function getdataURI(address to) public view returns (string memory) {
        return profiles[to].data_uri;
    }

    //Function to return total supply of SBTS
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function getProfile(address to) public view returns (Profile memory) {
        if (keccak256(bytes(profiles[to].identity)) == zeroHash)
            revert NonExistingToken();
        return profiles[to];
    }

    // Revert NFT transfers  public view override
    // function _beforeTokenTransfer(address, address, uint256) internal virtual override {
    // revert TransferDisabled();
    // }
    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) internal virtual override {
        revert TransferDisabled();
    }

    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        revert TransferDisabled();
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        revert TransferDisabled();
    }

    //Function to whitelist an address.
    function whiteList(address to) public {
        whitelistCount += 1;
        whitelist[to] = whitelistCount;
    }
}
