pragma solidity ^0.7.4;

import "./BtsToken.sol";

contract BtsTokenSale {
    address admin;
    BtsToken public tokenContract;
    uint256 public tokenPrice;

    constructor(BtsToken _tokenContract, uint256 _tokenPrice) {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }
}
