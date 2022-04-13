var LGCollection = artifacts.require("./LGCollection.sol");

module.exports = function(deployer) {
  deployer.deploy(LGCollection(500,'ipfs://lkslpoeiznvdjyzreqmlpory'));
};
