// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract CHALLENGE is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    string[] uriData = [
        "https://gateway.pinata.cloud/ipfs/QmRZtXKDv7Hq6hDuJq8PL4Aow9L47fC1iPNApEgeDiFtyC",
        "https://gateway.pinata.cloud/ipfs/QmYLB4TDqop1cQn5K2qdJdufyVyjDkGqPpFSRRAxFyr4a2",
        "https://gateway.pinata.cloud/ipfs/QmYyxscu5PhfszHMWwqQoTLK1TqMQQJfmBBLTZiwoxWBGZ",
        "https://gateway.pinata.cloud/ipfs/QmYpUPcFeFTfX1j4ah4YZciqM9PTqLoiu8ZwdT8JuDYgoY",
        "https://gateway.pinata.cloud/ipfs/QmRT6DX3rSMrerZWsFbRpW7G7VwWebZBKkfhnsT3cbfXgg"];
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("CHALLENGE", "CHNG") {}

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uriData[0]);
    }

    function changeData(uint _tokenId) public {
        _setTokenURI(_tokenId, uriData[1]);
    }

    function changeData1(uint _tokenId) public {
        _setTokenURI(_tokenId, uriData[2]);
    }

    function changeData2(uint _tokenId) public {
        _setTokenURI(_tokenId, uriData[3]);
    }

    function changeData3(uint _tokenId) public {
        _setTokenURI(_tokenId, uriData[4]);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}