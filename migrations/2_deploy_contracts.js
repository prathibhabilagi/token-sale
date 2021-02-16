const BtsToken = artifacts.require("BtsToken");

module.exports = function (deployer) {
  deployer.deploy(BtsToken);
};
