const path = require("path");

const HDWalletProvider = require('@truffle/hdwallet-provider');
const fs = require('fs');
const mnemonic = fs.readFileSync(".secret").toString().trim();

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  contracts_build_directory: path.join(__dirname, "client/src/contracts"),
  networks: {
    develop: {
      port: 8545
    },
    matic: {
      provider: () => new HDWalletProvider(mnemonic,'https://rpc-mumbai.maticvigil.com'),
      network_id: 80001
    },
  },
  compilers: {
    solc: {
      version: "^0.8.9"
    }
}
}
