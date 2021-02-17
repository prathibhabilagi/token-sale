const BtsToken = artifacts.require("BtsToken");
const BtsTokenSale = artifacts.require("BtsTokenSale");

module.exports = function(deployer) {
  deployer.deploy(BtsToken, 1000000).then(function() {
    // Token price is 0.001 Ether
    var tokenPrice = 1000000000000000;
    return deployer.deploy(BtsTokenSale, BtsToken.address, tokenPrice);
  });
};
