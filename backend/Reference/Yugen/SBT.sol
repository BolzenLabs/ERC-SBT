// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
import "hardhat/console.sol";

/**
 * An experiment in Soul Bound Tokens (SBT's) following Vitalik's
 * co-authored whitepaper at:
 * https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4105763
 *
 */

/// Wallet already owns a SBT
error ExistingToken();
// Sbt doesnt exist
error NonExistingToken();
/// Not Self
error NotSelf();
//Invalid Choice
error InvalidChoice();

contract SBT {
    struct Soul {
        string identity;
        string name;
        string profile_uri;
        string data_uri;
    }

    string public name; //Contract name
    address public operator; //Contract operator
    bytes32 private zeroHash =
        0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;

    // Track ID for next SBT mint
    uint256 private mintCount;
    mapping(address => uint256) public accountToId;

    // Address -> SoulStruct
    mapping(address => Soul) private souls;

    // Mapping owner address to token count

    event Mint(address _soul);
    event Burn(address _soul);
    event Update(address _soul);

    constructor(string memory _name) {
        name = _name;

        operator = msg.sender;
    }

    function mint(address to, Soul memory _soulData) external {
        if (keccak256(bytes(souls[to].identity)) != zeroHash)
            revert ExistingToken();
        if (msg.sender != to) revert NotSelf();

        souls[to] = _soulData;
        accountToId[msg.sender] = mintCount;
        mintCount = mintCount + 1;
        emit Mint(to);
    }

    function burn(address to) external {
        if (keccak256(bytes(souls[to].identity)) == zeroHash)
            revert NonExistingToken();
        if (msg.sender != to) revert NotSelf();

        delete souls[to];
        delete accountToId[to];
        accountToId[msg.sender] = 0;
        emit Burn(to);
    }

    function hasSoul(address to) external view returns (bool) {
        if (keccak256(bytes(souls[to].identity)) == zeroHash) {
            return false;
        } else {
            return true;
        }
    }

    //Pass in 0 to update profile URI
    //Pass in 1 to update json URI
    function updateURI(
        address to,
        string memory uri,
        uint256 choice
    ) external {
        if (keccak256(bytes(souls[to].identity)) == zeroHash)
            revert NonExistingToken();
        if (msg.sender != to) revert NotSelf();
        if (choice != 1 && choice != 0) revert InvalidChoice();

        if (choice == 0) souls[to].profile_uri = uri;
        else souls[to].data_uri = uri;
        emit Update(to);
    }

    function getprofileURI(address to) public view returns (string memory) {
        return souls[to].profile_uri;
    }

    function getdataURI(address to) public view returns (string memory) {
        return souls[to].data_uri;
    }

    function getSoul(address to) external view returns (Soul memory) {
        return souls[to];
    }
}
