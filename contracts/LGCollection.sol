//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract LGCollection is ERC721, ERC2981 , Ownable, ERC721URIStorage {
  
  using Counters for Counters.Counter;
   Counters.Counter private _tokenIdCounter;
    string public contractURI;
    uint96 royaltyFeesInBips;
    address royaltyAddress;

    constructor(uint96 _royaltyFeesInBips, string memory _contractURI)  ERC721("Legendary Girls", "LGS") {
       contractURI = _contractURI;
        // set royalty of all NFTs to 5%
        _setDefaultRoyalty(_msgSender(), 500);
    }
    function setRoyaltyInfo(address _receiver, uint96 _royaltyFeesInBips) public onlyOwner {
           royaltyAddress = _receiver;
           royaltyFeesInBips = _royaltyFeesInBips;
       }

       function setContractURI(string calldata _contractURI) public onlyOwner {
              contractURI = _contractURI;
          }

    function _baseURI() internal pure override returns (string memory) {
            return "ipfs//";
        }

    function safeMint(address to, string memory uri) onlyOwner {
       uint256 tokenId = _tokenIdCounter.current();
       _tokenIdCounter.increment();
       _safeMint(to, tokenId);
       _setTokenURI(tokenId, uri);
   }


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
        
  function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721, ERC2981) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
