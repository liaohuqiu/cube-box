var CommonWalletLibrary = artifacts.require("./CommonWalletLibrary.sol");
var GamerVerifier = artifacts.require("./GamerVerifier.sol");
var TimeDelayedVault = artifacts.require("./TimeDelayedVault.sol");

module.exports = function(deployer) {
  deployer.deploy(CommonWalletLibrary);
  deployer.deploy(GamerVerifier);

  deployer.link(CommonWalletLibrary, TimeDelayedVault);
  deployer.link(GamerVerifier, TimeDelayedVault);
  deployer.deploy(TimeDelayedVault);
};
